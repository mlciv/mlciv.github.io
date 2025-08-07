# MLCIV.com: Jekyll Site for Machine Learning Civilization

[![Deploy Jekyll site to Pages](https://github.com/mlciv/mlciv.github.io/actions/workflows/jekyll.yml/badge.svg)](https://github.com/mlciv/mlciv.github.io/actions/workflows/jekyll.yml)

Welcome to the source code for [mlciv.com](https://mlciv.com), a Jekyll-powered academic and research website. This guide will help you add your own content—such as blog posts, pages, navigation links, authors, and bibliography entries.

---

## Table of Contents
- [Getting Started](#getting-started)
- [Directory Structure](#directory-structure)
- [Adding Blog Posts](#adding-blog-posts)
- [Adding Pages](#adding-pages)
- [Customizing Navigation](#customizing-navigation)
- [Managing Authors](#managing-authors)
- [Adding Bibliography Entries](#adding-bibliography-entries)
- [Local Development & Deployment](#local-development--deployment)
- [Contributing](#contributing)
- [License](#license)

---

## Getting Started

### Prerequisites
- [Ruby](https://www.ruby-lang.org/en/documentation/installation/)
- [Bundler](https://bundler.io/): `gem install bundler`
- [Jekyll](https://jekyllrb.com/): `gem install jekyll`

### Install Dependencies
```bash
bundle install
```

### Run Locally
```bash
bundle exec jekyll serve --config _config.yml,_config_dev.yml
```
Visit [http://localhost:4000](http://localhost:4000) in your browser.

---

## Directory Structure

- `_posts/` — Blog posts (Markdown files, named `YYYY-MM-DD-title.md`)
- `pages/` — Static pages (e.g., About, Teaching, Students)
- `_data/` — Site data (navigation, authors, social media, etc.)
- `_bibliography/` — BibTeX files for publications
- `_drafts/` — Draft posts/pages (not published until moved to `_posts/` or `pages/`)
- `assets/` — Images, CSS, JS, fonts, etc.
- `_includes/` — Reusable HTML snippets
- `_layouts/` — Page and post layouts
- `_plugins/` — Custom Ruby plugins (e.g., for jekyll-scholar)

---

## Adding Blog Posts

1. **Create a Markdown file** in `_posts/` named `YYYY-MM-DD-title.md`.
2. **Add front matter** at the top. Example:

```markdown
---
layout: page
# Content
subheadline: ""
title: "My New Post"
teaser: "A short summary of my post."
categories: [research]
tags: [nlp, ai]
comments: true
---

Your post content goes here. Use Markdown!
```

3. **Images:** Place images in `assets/img/` and reference them as `![Alt text]({{ site.urlimg }}image.jpg)`.

4. **Drafts:** You can start in `_drafts/` and move to `_posts/` when ready.

---

## Adding Pages

1. **Create a Markdown file** in `pages/` (e.g., `pages/my_page.md`).
2. **Add front matter**. Example:

```markdown
---
layout: page
subheadline: "About Me"
title: "About"
teaser: "Learn more about me."
permalink: /about/
---

Page content here.
```

3. **Special Layouts:**
   - `layout: page` — Standard page
   - `layout: page-fullwidth` — Full-width page
   - `layout: video` — For video content
   - `layout: publication` — For publication lists

4. **See `_drafts/` for more front matter templates.**

---

## Customizing Navigation

Edit `_data/navigation.yml` to add or remove navigation links. Example:

```yaml
- title: Home
  url: "/"
  side: left
- title: Publications
  url: "/publications/"
  side: left
- title: Contact
  url: "/contact/"
  side: right
```
- `side: left` or `side: right` controls menu placement.
- You can add dropdowns (see commented examples in the file).

---

## Managing Authors

Edit `_data/authors.yml` to add new authors. Example:

```yaml
JaneDoe:
  name: "Jane Doe"
  siterole: "contributor"
  uri: https://janedoe.com/
  email: janedoe@email.com
  twitter: "@janedoe"
```
- Set the default author in `_config.yml` (`author: JaneDoe`).
- You can override the author per post/page with `author: JaneDoe` in the front matter.

---

## Adding Bibliography Entries

This site uses [jekyll-scholar](https://github.com/inukshuk/jekyll-scholar) for publications.

1. **Edit BibTeX files** in `_bibliography/` (e.g., `references.bib`, `selected.bib`).
2. **Display publications** in a page using:
   ```liquid
   {% bibliography --query @*[year=2025] %}
   {% bibliography --file selected %}
   ```
3. **Configure scholar settings** in `_config.yml` under `scholar:`.

### Adding PDF Files for Publications

To add PDF files for your publications:

1. **Place PDF files** in the `papers/` directory with the same name as your BibTeX entry key:
   ```
   papers/
   ├── your-paper-2024.pdf          # Main paper PDF
   ├── your-paper-2024.slides.pdf   # Presentation slides
   ├── your-paper-2024.poster.pdf   # Conference poster
   └── your-paper-2024.thumb.png    # Thumbnail image
   ```

2. **Add BibTeX entry** in `_bibliography/references.bib`:
   ```bibtex
   @inproceedings{your-paper-2024,
     title={Your Paper Title},
     author={Your Name and Co-author},
     booktitle={Conference Name},
     year={2024},
     url={https://doi.org/your-paper-doi}  # Optional: external URL
   }
   ```

3. **The site automatically creates links** to your PDF files:
   - **Paper**: Links to `papers/your-paper-2024.pdf`
   - **Slides**: Links to `papers/your-paper-2024.slides.pdf` (if exists)
   - **Poster**: Links to `papers/your-paper-2024.poster.pdf` (if exists)
   - **BibTeX**: Shows the citation in BibTeX format

4. **File naming conventions**:
   - Main paper: `entry-key.pdf`
   - Slides: `entry-key.slides.pdf`
   - Poster: `entry-key.poster.pdf`
   - Thumbnail: `entry-key.thumb.png` or `entry-key.thumb.jpg`

5. **Example** from the existing site:
   ```bibtex
   @inproceedings{naim2025edm,
     title={Towards Actionable Pedagogical Feedback...},
     author={Naim, Jannatun and Cao, Jie and ...},
     booktitle={Proceedings of the 18th International Conference on Educational Data Mining},
     year={2025},
     pages={328--341}
   }
   ```
   This automatically links to `papers/naim2025edm.pdf`.

**Note**: The jekyll-scholar plugin automatically detects and links PDF files based on the BibTeX entry key. No additional configuration is needed in the BibTeX file itself.

---

## Local Development & Deployment

- **Local build:**
  ```bash
  bundle exec jekyll build
  ```
- **Deploy scripts:**
  - `publish_index.sh` — Deploys to `_index_deploy` branch
  - `publish_mlciv.sh` — Deploys to `_mlciv_deploy` branch

---

## Contributing

1. Fork the repo and create your branch.
2. Add or edit content as described above.
3. Commit and push your changes.
4. Open a pull request.

**Tips:**
- Use existing posts/pages as templates.
- Check `_drafts/` for more front matter examples.
- For navigation, social media, and footer links, see `_data/`.
- For troubleshooting, see [Jekyll docs](https://jekyllrb.com/docs/) or open an issue.

---

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.

