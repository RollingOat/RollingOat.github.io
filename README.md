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

The site is hosted on GitHub Pages at <https://rollingoat.github.io>, built from
the `pw2026` branch of the [`RollingOat.github.io`](https://github.com/RollingOat/RollingOat.github.io)
repo. GitHub runs Jekyll itself on every push — the local Ruby setup is only for
previewing, and nothing needs to be built or committed by hand.

### Current setup

| Setting | Value |
| --- | --- |
| Repo | `RollingOat/RollingOat.github.io` |
| Branch Pages builds from | `pw2026` |
| Remote protocol | SSH (`git@github.com:...`), authenticated with `~/.ssh/id_ed25519` |
| Published URL | <https://rollingoat.github.io> |

The repo must be named exactly `<username>.github.io` to get the bare
`rollingoat.github.io` URL. Any other name publishes to
`rollingoat.github.io/<repo-name>/` instead.

### Enabling Pages (one time)

1. Go to the repo → **Settings** → **Pages**.
2. Under **Build and deployment**, set **Source** to `Deploy from a branch`.
3. Set **Branch** to **`pw2026`** and the folder to **`/ (root)`**, then **Save**.
4. Wait a minute or two, then load <https://rollingoat.github.io>.

Step 3 is the easy one to get wrong: the dropdown defaults to `main`, and this
repo has a `main` branch holding unrelated content. If Pages is pointed at
`main` the published site will not be this site.

### Publishing a change

```bash
./serve.sh                        # check it at http://localhost:4001 first
git add -A
git commit -m "Update publications"
git push
```

`git push` alone is enough — `pw2026` already tracks `origin/pw2026`. The live
site updates roughly a minute after the push.

### If the deploy fails

- The repo's **Actions** tab shows a `pages build and deployment` run for each
  push; open the failed run to see the Jekyll error.
- Build errors are almost always malformed YAML in `_data/publications.yml` —
  an unquoted title containing a colon is the usual culprit. Run
  `./serve.sh` locally first and the same error will surface there.
- GitHub Pages runs Jekyll 3.10, which the `Gemfile` here pins to, so a build
  that succeeds locally will succeed remotely.

### Switching the branch later

To publish from `main` instead:

```bash
git push origin pw2026:main
```

Then change **Settings → Pages → Branch** to `main`.
