_This readme file is at `.github/README.md`, so it will be displayed when viewing the repo on GitHub._

This file outlines how I version control my dotfiles, using a git repo with the worktree set to `$HOME`.
For instance, I use this to backup and version control 

- my [Neovim config](../.config/nvim). This is probably the thing in here that I've spent the most time configuring.

# Using a (bare) git repo for dotfiles

This is mostly following [Greg Owen's nice post](https://stegosaurusdormant.com/bare-git-repo/) explaining why and how to set up a bare git repo for dotfiles. See more info there, or [this tutorial on Atlassian](https://www.atlassian.com/git/tutorials/dotfiles).

Here's how I set this up:

## 1. Setting up the bare git repo the first time

1. Create a new bare git repo in the home directory on the local machine where there are dotfiles to keep track of (using a .git suffix for a bare git repo is convention to follow):
```bash
git init --bare $HOME/dotfiles.git
```

2. Add the following alias to your .bashrc or .zshrc, so you don't have to type it every time you want to add a file to the `dofiles` repo
```bash
alias dotgit='git --git-dir=$HOME/dotfiles.git/ --work-tree=$HOME'
```

3. Make Git not show all the untracked files in the home dir, then add the remote (make the new repo on github first)
```bash
dotgit config status.showUntrackedFiles no
dotgit remote add origin https://github.com/postylem/dotfiles.git
```

4. Add a new file to track (e.g. `.gitconfig`), and push while setting the remote branch at the same time (so in the future you just need to use `git push`:
```bash
dotgit add ~/.gitconfig
dotgit commit -m "track gitconfig"
dotgit push --set-upstream origin main
```

## 2. Cloning and using dotfiles on a new machine

1. Clone the repo to a temporary location on the new machine
```bash
git clone \
  --separate-git-dir=$HOME/dotfiles.git \
  https://github.com/postylem/dotfiles.git \
  dotfiles-tmp
```

2. Copy the working tree snapshot from the temporary location to the home directory, and delete the temp directory.
```bash
rsync --recursive --verbose --exclude '.git' dotfiles-tmp/ $HOME/
rm -rf dotfiles-tmp
```

3. Do steps 2--4 from above to set up a git bare repo on this new machine.
