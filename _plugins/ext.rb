require 'jekyll/scholar'

module Jekyll
  class ConferenceBadgeGenerator < Generator
    safe true
    priority :normal

    def generate(site)
      # Get all shorttitles from bibliography files
      shorttitles = extract_shorttitles(site)

      # Get existing badge classes from CSS
      existing_badges = extract_existing_badges(site)

      # Find new conferences
      new_conferences = shorttitles - existing_badges

      if new_conferences.any?
        puts "Found new conferences: #{new_conferences.join(', ')}"
        generate_badge_css(new_conferences, site)
        update_layout_logic(new_conferences, site)
      end
    end

    private

    def extract_shorttitles(site)
      shorttitles = []

      # Read bibliography files
      bibliography_files = Dir.glob('_bibliography/*.bib')
      bibliography_files.each do |file|
        content = File.read(file)
        content.scan(/shorttitle\s*=\s*\{([^}]+)\}/).each do |match|
          shorttitles << match[0].strip.downcase
        end
      end

      shorttitles.uniq
    end

    def extract_existing_badges(site)
      css_file = 'assets/css/conference-badges.css'
      return [] unless File.exist?(css_file)

      content = File.read(css_file)
      badges = []

      # Extract badge classes from CSS
      content.scan(/\.conference-badge\.([a-zA-Z0-9-]+)\s*\{/).each do |match|
        badges << match[0]
      end

      badges
    end

    def generate_badge_css(new_conferences, site)
      css_file = 'assets/css/conference-badges.css'
      return unless File.exist?(css_file)

      content = File.read(css_file)

      # Find the end of the file (before the closing brace)
      lines = content.split("\n")
      insert_index = lines.length - 1

      # Find the last badge definition
      lines.each_with_index do |line, index|
        if line.strip.start_with?('/*') && line.include?('*/')
          insert_index = index + 1
        end
      end

      # Generate CSS for new conferences
      new_css = []
      new_conferences.each do |conference|
        # Determine color based on conference type
        color = determine_conference_color(conference)
        new_css << "/* #{conference.upcase} */"
        new_css << ".conference-badge.#{conference.downcase.gsub(/[^a-z0-9]/, '-')} { background: linear-gradient(135deg, #{color[:start]} 0%, #{color[:end]} 100%); }"
        new_css << ""
      end

      # Insert new CSS
      lines.insert(insert_index, *new_css)

      # Write back to file
      File.write(css_file, lines.join("\n"))
      puts "Updated CSS file with new conference badges"
    end

    def update_layout_logic(new_conferences, site)
      layout_files = ['_layouts/bibliography.html', '_layouts/selected_papers.html']

      layout_files.each do |layout_file|
        next unless File.exist?(layout_file)

        content = File.read(layout_file)
        lines = content.split("\n")

        # Find the last elsif statement before the else
        insert_index = -1
        lines.each_with_index do |line, index|
          if line.strip == '{% else %}'
            insert_index = index
            break
          end
        end

        if insert_index > 0
          # Generate new logic for new conferences
          new_logic = []
          new_conferences.each do |conference|
            new_logic << "  {% elsif conference_type contains '#{conference.downcase}' %}"
            new_logic << "    {% assign badge_class = '#{conference.downcase.gsub(/[^a-z0-9]/, '-')}' %}"
          end

          # Insert new logic
          lines.insert(insert_index, *new_logic)

          # Write back to file
          File.write(layout_file, lines.join("\n"))
          puts "Updated #{layout_file} with new conference logic"
        end
      end
    end

    def determine_conference_color(conference)
      conference_lower = conference.downcase

      # Define color schemes for different conference types
      case conference_lower
      when /iccv|cvpr|vision/
        { start: '#e74c3c', end: '#c0392b' }  # Red for Computer Vision
      when /neurips|nips|icml|learning/
        { start: '#9b59b6', end: '#8e44ad' }  # Purple for Machine Learning
      when /aaai|ijcai|ai/
        { start: '#f39c12', end: '#e67e22' }  # Orange for AI
      when /acl|emnlp|naacl|conll|coling|linguistics/
        { start: '#27ae60', end: '#229954' }  # Green for Computational Linguistics
      when /bea|edm|workshop|education/
        { start: '#f1c40f', end: '#f39c12' }  # Yellow for Education & Workshops
      when /ieee/
        { start: '#34495e', end: '#2c3e50' }  # Dark Gray for IEEE
      when /arxiv|preprint/
        { start: '#95a5a6', end: '#7f8c8d' }  # Gray for Preprints
      else
        { start: '#3498db', end: '#2980b9' }  # Blue for Other Conferences
      end
    end
  end
end
