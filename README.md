# Personal Website

Academic homepage built on the [minimal-light](https://github.com/yaoyao-liu/minimal-light)
Jekyll theme (MIT). Deployed with GitHub Pages.

## Local preview

```bash
./serve.sh
```

Then open <http://localhost:4001>. The page rebuilds automatically as you save.

Ruby and Jekyll live in the `website` conda env, so nothing is installed system-wide.
If the env ever goes missing, recreate it with:

```bash
conda create -y -n website -c conda-forge ruby=3.3 c-compiler cxx-compiler
conda run -n website gem install --no-document bundler
conda run -n website bundle install
```

## What to edit

| File | Contents |
| --- | --- |
| `_config.yml` | Name, position, affiliation, email, social links, avatar, font, dark mode |
| `index.md` | About Me, Research Interests, News |
| `_data/publications.yml` | One block per paper: title, authors, venue, links, thumbnail |
| `_includes/services.md` | Reviewing and teaching (currently commented out) |
| `assets/img/` | Avatar (`avatar.png`), favicons, paper thumbnails |
| `assets/files/` | CV PDF |

### Adding a publication

Append a block to `_data/publications.yml`:

```yaml
  - title: "Paper Title"
    authors: Coauthor One, <strong>Jiuzhou Lei</strong>, Coauthor Three
    conference_short: ICRA          # short badge shown next to the entry
    conference: IEEE International Conference on Robotics and Automation <strong>(ICRA)</strong>, 2026.
    pdf: https://arxiv.org/abs/xxxx.xxxxx
    code: https://github.com/...    # optional
    page: https://...               # optional project page
    bibtex: https://...             # optional
    image: ./assets/img/teaser.png  # optional thumbnail
    notes: Oral Presentation        # optional, rendered in red
```

Every field except `title`, `authors`, and `conference` is optional.

### Adding your photo and CV

Drop `avatar.png` (square, ~400x400) in `assets/img/`, and your CV in
`assets/files/`. Then uncomment the `cv_link` line in `_config.yml` to make the
CV icon appear in the header.

## Deploying

Push to the `main` branch of the `RollingOat.github.io` repo. GitHub Pages
builds the site itself — the local Ruby setup is only for previewing.
