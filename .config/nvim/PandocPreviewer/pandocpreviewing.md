---
title: Previewing pandoc markdown notes
subtitle: with sidenotes
date: 2021.06.25
author: jacob louis hoover
---

# What is this for?

Note-taking/document-making in pandoc markdown is nice, because I can type the input below, and get the output (below that).

## Example input

```markdown
I'll type some **math**, like for instance

$$H[X] = -\sum_X p(x) \log p(x).$$

Also I'll put a numbered[^1] or unnumbered note[^2] in my text.

[^1]: This is the note text.

I would also like to *cite* some things,
**like *perhaps* some** linguistics classics
[e.g. @tesniere.l:2015; @chomsky.n:1955; @lambek.j:1958].
Also I can cite a page [@brown.p:1993, p. 2],
and Pandoc's `--citeproc` does the citation formatting.

[^2]:{-} The sidenote text can come anywhere,
it will be automatically placed where it needs to be.
```

## Example output

---

I'll type some **math**, like for instance

$$H[X] = -\sum_X p(x) \log p(x).$$

Also I'll put a numbered[^1] or unnumbered sidenote[^2] in my text.

[^1]: This is the note text.

I would also like to *cite* some things,
**like *perhaps* some** linguistics classics
[e.g. @tesniere.l:2015; @chomsky.n:1955; @lambek.j:1958].
Also I can cite a page [@brown.p:1993, p. 2],
and Pandoc's `--citeproc` does the citation formatting.

[^2]:{-} The sidenote text can come anywhere,
it will be automatically placed where it needs to be.

::: {#refs}
### References
:::

---


Using Pandoc to convert the markdown into HTML for viewing is particularly nice, because of its powerful support for citations.  These citations are in read from a BibTeX file, so I can take notes in markdown (which is fast and simple) and set my bibliography up to later use in LaTeX.


# How to

Basically, it's just this.  Write markdown like above example, save it as e.g. `myfile.md`[^yaml-header] and then run the following to see it as HTML.
```zsh
pandoc myfile.md -s -C -o myfile.html
```

- `-s` (or `--standalone`) gets you a standalone HTML file using a default stylesheet.
- [`-C` (or `--citeproc`)](https://pandoc.org/MANUAL.html#citations) parses citations

Below is a how I set up for markdown note-making in vim and use pandoc for preview.

[^yaml-header]: with a `yaml` header to specify the title, date, author, and other metadata.

## Basic setup

Requirements

- ([neo](https://neovim.io/))[vim](https://www.vim.org/) editor
- [pandoc](https://pandoc.org/index.html) tool

Write your markdown file (like I'm doing right now) in vim, and it's easy to set up a simple function that uses Pandoc to translate the markdown in current buffer to html and open it in a browser.
A very simple example of how to do this is in [this blog post](http://subhadig.net/preview-markdown-files-from-vim-the-easy-way.html).


## Formatting nicer

The default stylesheet is fine, but you can also define your own CSS with Pandoc's [`--css` flag](https://pandoc.org/MANUAL.html#option--css) to format it how you like. I like to use the style provided by [`tufte-pandoc-css`](https://github.com/jez/tufte-pandoc-css), in particular because it uses [`pandoc-sidenote`](https://github.com/jez/pandoc-sidenote) filter, so markdown _footnotes_ become _sidenotes_ instead of endnotes (as in the example above).

To do this, install `pandoc-sidenote`, and copy the `tufte-pandoc-css` repo.

```bash
brew install jez/formulae/pandoc-sidenote
git clone https://github.com/jez/tufte-pandoc-css.git
```

Then, the following command will convert your `myfile.md` to nice HTML5 like this, where `path/to/all.bib` is a BibTeX file containing your citations, and `PANDOCCSS=/your/path/to/tufte-pandoc-css`[^metadata]

```bash
pandoc myfile.md \
  --standalone --citeproc --katex --section-divs \
  --filter pandoc-sidenote \
  --to html5+smart \
  --template $PANDOCCSS/tufte \
  --css $PANDOCCSS/tufte-css/tufte.css \
  --css $PANDOCCSS/pandoc.css \
  --css $PANDOCCSS/pandoc-solarized.css \
  --css $PANDOCCSS/tufte-extra.css \
  --metadata bibliography=path/to/all.bib \
  --metadata reference-section-title=References \
  --metadata link-citations=true \
  --output myfile.html
```

[^metadata]: The options given here with the `--metadata` flag could alternatively be specified in the yaml header of the markdown file, like `bibliography: example.bib` to specify a file-specific bib file.

### Automating it in vim

To make this process easy while editing (so you can type your note in markdown use a quick keybinding to see it html), make a mapping to automatically call the above pandoc command, and open the resulting html file in your browser.

I wrote a function `PandocPreviewerView` in [`PandocPreviewer.vim`](/Users/j/.config/nvim/plugin/PandocPreviewer.vim) which I map to <key>\\</key><key>v</key> (where `\` is my `<locallleader>`).


### Something better?

It would be nice to have **live updating** like the plugin [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) does, but that would require some more work (or digging into that project to see if it is possible to use pandoc to generate the html instead of [markdown-it](https://github.com/markdown-it/markdown-it)).[^mdit-cites]

[^mdit-cites]: Perhaps instead it's as simple as modifying markdown-preview to integrate the markdown-it plugin [markdown-it-citations](https://github.com/martinring/markdown-it-citations), which makes citation "based on Pandoc".
