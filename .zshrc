if [[ "${TERM}" != "" && "${TERM}" == "alacritty" ]]; then
  precmd() { print -Pn "\e]0;$(id --user --name): zsh[%L] %~\a" }
  preexec() { echo -en "\e]0;$(id --user --name): ${1}\a" }
fi

branch() {
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]]; then
    :
  else
    echo ' [\ue725 '%B%{$fg[magenta]%}@$branch%b']'
  fi
}

setopt prompt_subst
PROMPT='%B%{$fg[white]%}%(4~|%-1~/.../%2~|%~)%u%b$(branch) #%{$fg[cyan]%}#%B%(?.%{$fg[cyan]%}.%{$fg[red]%})#%{$reset_color%}%b '
RPROMPT='%B%{$fg[red]%} %(?..[%?])%b'
print -P '%F{#c8d3f5}[$USER@$HOST]%f %B%F{#82aaff}$(uname -srm)%f%b · %F{#c3e88d}$(uptime --pretty)%f'

setopt appendhistory
setopt autocd
setopt correct
setopt extendedglob
setopt histignorealldups
setopt histignorespace
setopt nobeep
setopt nocaseglob
setopt nocheckjobs
setopt numericglobsort
setopt rcexpandparam
setopt rmstarsilent

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path $HOME/.zsh/cache
zstyle ':completion:*' completer _extensions _complete _match _approximate
zstyle ':completion:*' file-list all
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion::complete:*' gain-privileges 1
zstyle ':completion:*:descriptions' format ' -- %B%F{#c8d3f5}%d%f%b --'
zstyle ':completion:*:messages' format ' -- %B%F{#ffc777}%d%f%b --'
zstyle ':completion:*:warnings' format ' -- %B%F{#ff757f}no matches found%f%b --'
fpath=("$HOME/.zsh/fs" "/usr/share/zsh/site-functions" "$fpath[@]")

autoload -Uz compinit && compinit
autoload -Uz colors && colors

HISTFILE=$HOME/.history
HISTSIZE=65536
SAVEHIST=$HISTSIZE

source $HOME/.zsh/aliases
source $HOME/.zsh/exports
source $HOME/.zsh/functions
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey -e
bindkey '^[[7~' beginning-of-line
bindkey '^[[H' beginning-of-line
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line
fi
bindkey '^[[8~' end-of-line
bindkey '^[[F' end-of-line
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}" end-of-line
fi
bindkey '^[[2~' overwrite-mode
bindkey '^[[3~' delete-char
bindkey '^[[C' forward-char
bindkey '^[[D' backward-char
bindkey '^[[5~' history-beginning-search-backward
bindkey '^[[6~' history-beginning-search-forward
bindkey '^[Oc' forward-word
bindkey '^[Od' backward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^H' backward-kill-word
bindkey '^[[Z' undo

zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
