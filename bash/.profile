# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

PATH="$HOME/.npm/bin:$PATH"

PATH="$HOME/.config/composer/vendor/bin:$PATH"

# shims rather than `mise activate`, so that GUI applications and scripts which
# never source a shell rc file find the tools too
PATH="$HOME/.local/share/mise/shims:$PATH"

# enable gpg-agent as the ssh-agent
# see https://www.gnupg.org/faq/whats-new-in-2.1.html#autostart
# and https://unix.stackexchange.com/questions/373831/cant-use-openpgp-key-exported-from-gnupg-with-ssh#373963
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
