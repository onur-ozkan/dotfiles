# Created by Onur Ozkan for 5.8

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%F{#87af5f} %b%f'

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST

PROMPT='%F{#87afd7} %f %F{#f7ca88}%~%f ${vcs_info_msg_0_} -> '

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
