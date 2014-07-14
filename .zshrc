#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
## fasd
#eval $(fasd --init zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install)
eval "$(fasd --init auto)"
#fasd_cache="$HOME/.fasd-init-zsh"
#if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  #fasd --init zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install >| "$fasd_cache"
#fi
#source "$fasd_cache"
#unset fasd_cache
## Prompt:
setopt PROMPT_SUBST
autoload -Uz vcs_info
precmd() {
  vcs_info
  echo -n "\a"
}
zstyle ':vcs_info:*' formats \
  '%F{yellow}(%b)'
PROMPT='%F{green}%n%F{yellow}@%F{green}%m${vcs_info_msg_0_} %F{green}%3~ %F{yellow}» %F{reset}'
RPROMPT='[%*]'
export EDITOR=vim
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
alias -g V='| grep -v'
alias -g L='| less'
alias xargs1='xargs -n 1'
alias gs=''
alias ack=ack-grep
alias firefox-lite="firefox -P lite -no-remote"
alias gh="git --git-dir=$HOME/.git-home --work-tree=$HOME"
alias gp="git push && git push --tags"

__git_files() {
  _wanted files expl 'index file' _path_files
}
## This does not work in .zshenv for some reason:
### Set the list of directories that Zsh searches for programs.
path=(
  ~/bin
  /usr/local/{bin,sbin}
  /usr/{bin,sbin}
  /{bin,sbin}
  $path
  ~/racket/bin
)
### Language
if [[ -z "$LANG" ]]; then
  eval "$(locale)"
fi
## A hack for Ubuntu
TERM=xterm-256color
## Unbind ctrl+s
stty -ixon

# NPM packages in homedir
NPM_PACKAGES="$HOME/.npm-packages"

# Tell our environment about user-installed node tools
PATH="$NPM_PACKAGES/bin:$PATH"
# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH  # delete if you already modified MANPATH elsewhere in your config
MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

# Tell Node about these packages
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"

[[ -s ~/.nvm/nvm.sh ]] && . ~/.nvm/nvm.sh # This loads NVM

export PHPBREW_SET_PROMPT=1
. ~/.phpbrew/bashrc
