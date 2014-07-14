## fasd
eval "$(fasd --init auto)"
## Prompt:
setopt PROMPT_SUBST AUTO_CD
autoload -Uz vcs_info

bindkey -e

precmd() {
  print -Pn "\e]0;%n@%m: %~\a"
  vcs_info
  echo -n "\a"
}
zstyle ':vcs_info:*' formats \
  '%F{yellow}(%b)'
PROMPT='%F{green}%n%F{yellow}@%F{green}%m${vcs_info_msg_0_} %F{green}%3~ %F{yellow}» %F{reset}'
RPROMPT='[%*]'

export ALTERNATE_EDITOR=''
export EDITOR='emacsclient -c -nw'
export SVN_EDITOR=$EDITOR
export GIT_EDITOR=$EDITOR
export SHELL=/bin/zsh

alias g=git
alias _=sudo
alias v=vim-wrapper
alias vd=vimdiff
alias task='nocorrect task'
alias rr='ranger'
alias gg='git grep'
alias gst='git status'
alias f='fasd -f'
alias v='f -e vim'
alias -g G='| grep'
alias -g GI='| grep -i'
alias -g GV='| grep -v'
alias -g V='| grep -v'
alias -g L='| less'
alias xargs1='xargs -n 1'
alias gs=''
alias ack=ack-grep
alias firefox-lite="firefox -P lite -no-remote"
alias gh="git --git-dir=$HOME/.githome --work-tree=$HOME"
alias gp="git push && git push --tags"
alias ls="ls --color=auto"

# Fix long git autocomplete
__git_files() {
  _wanted files expl 'index file' _path_files
}

#[[ $TERM == rxvt-unicode-256color ]] && export TERM=rxvt
## Unbind ctrl+s
stty -ixon

# Node.js
NPM_PACKAGES="$HOME/.npm-packages"
PATH="$NPM_PACKAGES/bin:$PATH"
unset MANPATH  # delete if you already modified MANPATH elsewhere in your config
MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
[[ -s ~/.nvm/nvm.sh ]] && . ~/.nvm/nvm.sh # This loads NVM

# PHPBrew
export PHPBREW_SET_PROMPT=1
[[ -s ~/.phpbrew/bashrc ]] && . ~/.phpbrew/bashrc

# The following lines were added by compinstall
zstyle ':completion:*' auto-description '- %d'
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' format '-- %d --'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' ignore-parents parent pwd .. directory
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' original true
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' squeeze-slashes true
zstyle :compinstall filename '/home/my/.zshrc'

autoload -Uz compinit
compinit
