# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set up the prompt

autoload -Uz colors && colors
autoload -Uz promptinit
autoload -Uz vcs_info

promptinit

setopt histignorealldups sharehistory

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Aliases
alias ls='ls --hide=".*" -l --color=auto --human-readable'
alias ll='ls -Al --color=auto --human-readable'
alias ls='exa \
  --oneline \
  --long \
  --all \
  --binary \
  --color-scale \
  --git \
  --group \
  --group-directories-first \
  --header \
  --icons \
  --modified \
  --octal-permissions \
  --time-style long-iso'

alias ls2='ls \
  --tree \
  --level 2'

alias dsl='docker service logs -f --tail 100'
alias dsi='docker service inspect'
alias dsls='docker service ls'
alias dsps='docker service ps'

#alias dps='docker ps --all --format "table {{.Names}}\t{{.Status}}\t{{.ID}}" | grep -v ^NAMES | grep "^[^.]*$" | sort'
alias dps='docker ps --all --format "table {{.Names}}\t{{.Status}}\t{{.ID}}" | grep -v ^NAMES | sort'
alias dpss='docker ps --all --format "table {{.Names}}\t{{.Status}}\t{{.Image}}\t{{.ID}}" | grep -v ^NAMES | sort'
alias dex='docker exec -it'

alias dni='docker node inspect'
alias dnls='docker node ls'
alias dnlabels='docker node inspect --format="{{.Spec.Labels}}"'

alias zz="source ~/.zshrc;echo \"Reloaded zshrc\""

alias vim="nvim"

export PATH=$HOME/.local/bin:/opt/nvim-linux64/bin:$PATH

# Load version control information
precmd() { vcs_info }

# List directory after changing directories
chpwd() { ls }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%b'

# Set up the prompt with git branch name
setopt PROMPT_SUBST
NEWLINE=$'\n'
HOSTNAME=$(hostname)
PROMPT='%F{white}%n@${HOSTNAME}$reset_color %F{green}${PWD/#$HOME/~} %F{cyan}${vcs_info_msg_0_} $reset_color ${NEWLINE}> '

# Start or attach to TMUX
#[[ $TERM != "screen" ]] && exec tmux attach

# Path Variables
#export TERM='xterm-256color'
#export EDITOR='nvim'
#export VISUAL='nvim'
#export TERM=xterm-direct

#HERE=$(realpath())
#SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
#echo "SCRIPT DIR: $SCRIPT_DIR"
#HERE=$(dirname $0:A)
#source "/home/marco/.home/zsh/powerlevel10k/powerlevel10k.zsh-theme"
source ~/.home/zsh/powerlevel10k/powerlevel10k.zsh-theme
source ~/.home/zsh/.p10k.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh