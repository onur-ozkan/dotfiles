# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# User specific environment and startup programs

PATH="$HOME/.local/bin:$PATH"
PATH="$HOME/.local/bin/statusbar:$PATH"
export PATH="/snap/bin:$PATH"
