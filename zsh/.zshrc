# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set up the prompt
autoload -Uz colors && colors
autoload -Uz promptinit

promptinit

setopt histignorealldups sharehistory
setopt rm_star_silent # Don't add additional confirmation to "rm" command.

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
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

####################################
# Aliases
####################################
# Misc
alias b="./build.sh"
alias c="clear"
alias cat="bat --tabs 2"
alias clip="wl-copy"
alias lg="lazygit"
alias path="echo $PATH"
alias py="python3"
alias python="python3"
alias vim="nvim"
alias z="zellij attach -c"

alias sc="systemctl"
alias jc="journalctl"

# File System
alias lsdisk="lsblk -o NAME,MOUNTPOINT,FSTYPE,FSUSE%,SIZE,UUID,PARTUUID"
alias dus='du -sh * | sort -hr'

alias ls='eza \
  --oneline \
  --long \
  --binary \
  --color-scale \
  --git \
  --git-repos-no-status \
  --group \
  --group-directories-first \
  --header \
  --icons \
  --modified \
  --octal-permissions \
  --time-style long-iso'

alias lsa='eza \
  --all --all \
  --oneline \
  --long \
  --binary \
  --color-scale \
  --git \
  --git-repos-no-status \
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

# Locations
alias h="cd ~/.home"
alias st="cd ~/syncthing"
alias ws="cd ~/workspace"
alias wsf="cd ~/workspace/flyingpie"
alias wsi="cd ~/workspace/isres"
alias wss="cd ~/workspace/sandbox"

# Locations - Projects
alias d2="cd ~/workspace/isres/dtrv2_1"
alias wtq="cd ~/workspace/flyingpie/wtq/wtq_1"

# Docker
alias dl='docker logs --tail 100 -f'
alias ds='docker stats --format "table {{.Name}}\t{{.Container}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.MemPerc}}"'
alias dsp='docker system prune -f'
alias dx='docker exec -it'

alias dps='docker ps --all --format "table {{.Names}}\t{{.Status}}\t{{.ID}}" | grep -v ^NAMES | sort'
alias dpss='docker ps --all --format "table {{.Names}}\t{{.Status}}\t{{.Image}}\t{{.ID}}" | grep -v ^NAMES | sort'
alias dex='docker exec -it'

alias dni='docker node inspect'
alias dnls='docker node ls'
alias dnlabels='docker node inspect --format="{{.Spec.Labels}}"'

alias dsl='docker service logs -f --tail 100'
alias dsi='docker service inspect'
alias dsls='docker service ls'
alias dsps='docker service ps'
alias dc='docker compose'

# Dotnet
alias dn='dotnet'
alias dnb='dotnet build'
alias dnr='dotnet run'
alias dnw='dotnet watch'
alias dnwi='dotnet watch --non-interactive'

# Git
alias gitba='git branch -a'
alias gitc='git checkout'
alias gitcl='git reset --hard && git clean -fdx && git remote prune origin'
alias gitl='git log -n 15'
alias gitp='git pull'
alias gitpcl='git reset --hard && git clean -fdx && git remote prune origin && git pull'
alias gitpu='git push --set-upstream origin $(git symbolic-ref --short HEAD)'
alias gits='git status'
alias gitup='git branch --set-upstream-to=origin/$(git symbolic-ref --short HEAD)'
alias gitws='git commit -m "Workspace"'
alias gitcm='git commit -m'

alias k='kubectl --kubeconfig ~/.kube/local'
alias kdev='kubectl --kubeconfig ~/.kube/dtr-dev'

# Zsh
alias zz='source ~/.zshrc;echo \"Reloaded zshrc\"'

# Up
alias up1='cd ..'
alias up2='cd ../..'
alias up3='cd ../../..'
alias up4='cd ../../../..'
alias up5='cd ../../../../..'
alias up6='cd ../../../../../..'

# Yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

####################################
# /Aliases
####################################

# List directory after changing directories
chpwd() { clear; ls }

export EDITOR='nvim'
export VISUAL='nvim'

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

source ~/.home/zsh/antidote/antidote.zsh
antidote load ~/.home/zsh/.zsh_plugins.txt

source ~/.home/zsh/.p10k.zsh

bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1

_dotnet_zsh_complete()
{
	# Get full path to script because dotnet-suggest needs it
	# NOTE: this requires a command registered with dotnet-suggest be on the PATH
	full_path=`which ${words[1]}` # zsh arrays are 1-indexed

	# Get the full line
	# $words array when quoted like this gets expanded out into the full line
	full_line="$words"

	# Get the completion results, will be newline-delimited
	completions=$(dotnet-suggest get --executable "$full_path" -- "$full_line")
	# explode the completions by linefeed instead of by spaces into the descriptions for the
	# _values helper function.
	
	exploded=(${(f)completions})
	# for later - once we have descriptions from dotnet suggest, we can stitch them
	# together like so:
	# described=()
	# for i in {1..$#exploded}; do
	#     argument="${exploded[$i]}"
	#     description="hello description $i"
	#     entry=($argument"["$description"]")
	#     described+=("$entry")
	# done
	_values 'suggestions' $exploded
}

# If "dotnet-suggest" is installed, activate it.
if command -v dotnet-suggest &> /dev/null
then
	compdef _dotnet_zsh_complete $(dotnet-suggest list)
fi

export DOTNET_SUGGEST_SCRIPT_VERSION="1.0.0"

# JBang
export PATH="$HOME/.jbang/bin:$PATH"
