# Automatic Conference Badge System

This system automatically generates colored badges for new conferences and journals that appear in your bibliography files.

## How It Works

### 1. Automatic Detection
The system scans all `.bib` files in the `_bibliography/` directory and extracts all `shorttitle` values.

### 2. Badge Generation
When a new conference/journal is found (not already in the CSS), the system:
- Generates appropriate CSS styling with colors based on conference type
- Updates the layout logic to handle the new conference
- Assigns colors based on conference categories

### 3. Color Categories
- **Computer Vision**: Red (`#e74c3c` → `#c0392b`) - ICCV, CVPR, etc.
- **Machine Learning**: Purple (`#9b59b6` → `#8e44ad`) - NeurIPS, ICML, etc.
- **AI**: Orange (`#f39c12` → `#e67e22`) - AAAI, IJCAI, etc.
- **Computational Linguistics**: Green (`#27ae60` → `#229954`) - ACL, EMNLP, NAACL, etc.
- **Education & Workshops**: Yellow (`#f1c40f` → `#f39c12`) - BEA, EDM, Workshops, etc.
- **IEEE Conferences**: Dark Gray (`#34495e` → `#2c3e50`) - IEEE conferences
- **Preprints**: Gray (`#95a5a6` → `#7f8c8d`) - arXiv, etc.
- **Other Conferences**: Blue (`#3498db` → `#2980b9`) - Default for new conferences

## Usage

### Method 1: Automatic (Jekyll Plugin)
The system runs automatically when you build your Jekyll site. The plugin in `_plugins/ext.rb` will:
- Detect new conferences
- Generate badges automatically
- Update CSS and layout files

### Method 2: Manual Script
Run the standalone script to generate badges manually:

```bash
ruby generate_badges.rb
```

This will:
- Scan for new conferences
- Generate CSS for new badges
- Update layout logic
- Show a summary of what was found/updated

## Adding New Conferences

### 1. Add to BibTeX
Simply add a `shorttitle` field to your BibTeX entry:

```bibtex
@inproceedings{example2024,
  title={Your Paper Title},
  author={Author, Name},
  booktitle={New Conference Name},
  shorttitle={NEWCONF},  % This will trigger badge generation
  year={2024}
}
```

### 2. Run Badge Generation
Either:
- Build your Jekyll site (automatic)
- Run `ruby generate_badges.rb` (manual)

### 3. Verify
The new conference will now have a colored badge in your publications list.

## Files Modified

The system modifies these files:
- `assets/css/conference-badges.css` - Adds new badge styles
- `_layouts/bibliography.html` - Adds logic for new conferences
- `_layouts/selected_papers.html` - Adds logic for new conferences

## Example Output

When you run the script, you'll see output like:
```
🔍 Scanning for new conferences...
🎯 Found new conferences: iccv workshop, ph.d. dissertation, ieee tvcg
✅ Updated CSS file with new conference badges
✅ Updated _layouts/bibliography.html with new conference logic
✅ Updated _layouts/selected_papers.html with new conference logic
🎉 Badge generation complete!

📊 Summary:
  - Total shorttitles found: 19
  - Existing badges: 29
  - New conferences: 3
```

## Customization

### Adding New Color Categories
Edit the `determine_conference_color` function in `generate_badges.rb` or `_plugins/ext.rb`:

```ruby
when /your-pattern/
  { start: '#your-color', end: '#your-darker-color' }
```

### Modifying Badge Styles
Edit `assets/css/conference-badges.css` to change the overall badge appearance.

## Troubleshooting

### Badge Not Appearing
1. Check that the `shorttitle` field is correctly formatted in your BibTeX
2. Run `ruby generate_badges.rb` to see if the conference was detected
3. Check the CSS file for the new badge class
4. Check the layout files for the new logic

### Wrong Color
The system uses pattern matching to assign colors. If a conference gets the wrong color, you can:
1. Modify the `determine_conference_color` function
2. Add a specific case for your conference
3. Re-run the badge generation

### Manual Override
If you need to manually override a badge, you can:
1. Edit the CSS file directly
2. Edit the layout logic directly
3. The automatic system will not overwrite manual changes
