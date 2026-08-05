# dotfiles

Managed with [GNU Stow](https://www.gnu.org/software/stow/). Each top-level
directory is a package whose contents mirror `$HOME`.

## Install

```sh
sudo apt install stow
git clone git@github.com:nicwortel/dotfiles.git ~/projects/dotfiles
cd ~/projects/dotfiles
stow --adopt */ && git restore .
```

`*/` matches every package directory. Install a subset by naming them instead,
e.g. `stow bash git`. Remove one with `stow -D <package>`. Run the same command
again after adding a package.

`--adopt` is needed because Stow aborts when a file already exists (such as
`.bashrc` and `.profile`).
`--adopt` moves them into the repository instead, and `git restore` restores the
committed version.
Commit or stash any changes first before running `stow --adopt`.

Log out and back in afterwards for the `PATH` additions in `.profile`.
Sourcing it (`source ~/.profile`) only affects the current shell.

## Notes

`.stowrc` points the target at `$HOME`; without it Stow would install into the
parent of the repo.
It also sets `--no-folding`, so Stow creates real directories and symlinks only
files.
Otherwise a directory whose entire contents come from one package (`~/.config/git`)
becomes a symlink into the repo, and anything the application writes there lands
in git.

`SSH_AUTH_SOCK` and `PATH` additions live in `.profile` so that GUI applications
inherit them from the session, not just terminal shells.
Note that `.profile` is sourced by dash, so it has to stay POSIX; bash arrays
won't work there.

`.bashrc` and `.profile` are complete copies of Ubuntu's defaults plus a few
additions, so they drift as the distro updates its own versions.
`diff /etc/skel/.bashrc bash/.bashrc` shows the local additions and anything
upstream has changed since.
