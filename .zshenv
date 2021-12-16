bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

alias vim="nvim"

# bash scripts
PATH="$HOME/.local/bin:$PATH"

# dwmblock scripts
PATH="$HOME/.local/bin/statusbar:$PATH"

# snap
PATH="/snap/bin:$PATH"

# rust
PATH="$HOME/.cargo/bin:$PATH"

# golang
export PATH="$PATH:~$HOME/go/bin/"
export GOPATH="$HOME/go"

# defaults
export EDITOR=nvim
export TERMINAL=st
export FZF_DEFAULT_COMMAND='rg --hidden -l "" -g "!.git"'

# nnn
export NNN_PLUG='p:preview-tui;f:fzopen'
export NNN_FIFO=/tmp/nnn.fifo
export NNN_OPTS="H"

# Intellij apps
export _JAVA_AWT_WM_NONREPARENTING=1

# omnisharp
export OMNISHARP_ROSLYN="$HOME/.omnisharp/run"
