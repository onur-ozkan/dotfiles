bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# default configuration of audio on boot
pactl set-sink-volume 0 50%
pactl set-sink-mute @DEFAULT_SINK@ true


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
export EDITOR=vim
export TERMINAL=st

# nnn
export NNN_PLUG='p:preview-tui;f:fzopen'
export NNN_FIFO=/tmp/nnn.fifo
export NNN_OPTS="H"
alias open='tmux new-session nnn -a -P p'
