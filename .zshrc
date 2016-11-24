setopt PROMPT_SUBST AUTO_CD HIST_IGNORE_ALL_DUPS HIST_IGNORE_SPACE EXTENDEDGLOB SHARE_HISTORY NONOMATCH
autoload -Uz vcs_info
zmodload -i zsh/parameter

bindkey -e

title() {
  print -Pn "\e]0;$1\a"
}
precmd() {
  title '%n@%m: %~'
  vcs_info
  echo -n "\a"
  psvar[1]=$#jobtexts; [[ $#jobtexts -eq 0 ]] && psvar[1]=();
}
preexec() {
  title "%n@%m: %~ | $1"
}
DIR_FILE=/tmp/last-dir
chpwd() {
  echo $PWD > $DIR_FILE
}
-() {
  cd $(cat $DIR_FILE)
}
zstyle ':vcs_info:*' formats \
  '%F{yellow}(%b)'
PROMPT='%F{green}%n%F{yellow}@%F{green}%m${vcs_info_msg_0_}%(1v.(bg: %v%).) %F{green}%3~ %F{yellow}» %F{reset}'
RPROMPT='[%*]'

export ALTERNATE_EDITOR=''

export EDITOR=EDITOR
export SVN_EDITOR=$EDITOR
export GIT_EDITOR=$EDITOR
export SHELL=/bin/zsh
export HISTSIZE=10000000
export SAVEHIST=$HISTSIZE
export HISTFILE=$HOME/.zhistory
export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:'
export LESS='-F -g -i -M -R -S -w -X -z-4'
export PATH=~/bin:~/.linuxbrew/bin:$PATH
export FZF_DEFAULT_OPTS='--extended --cycle'

alias g=git
alias _=sudo
alias v=vim-wrapper
alias vd=vimdiff
alias task='nocorrect task'
alias rr='ranger'
alias gg='git grep'
alias gst=scmpuff_status
alias f='fasd -f'
alias v='f -e vim'
alias -g G='| grep'
alias -g GI='| grep -i'
alias -g GV='| grep -v'
alias -g V='| grep -v'
alias -g L='| less'
alias -g N='2> /dev/null'
alias xargs1='xargs -n 1'
alias gs=''
alias ack=ack-grep
alias firefox-lite="firefox -P lite -no-remote"
alias gh="git --git-dir=$HOME/.githome --work-tree=$HOME"
alias gp="git push && git push --tags"
alias gd="git describe --tags"
alias ls="ls --group-directories-first --color=auto"
alias sl=ls
alias m="fasd -e mpv"
alias ytdl=youtube-dl
alias ,='cd ~/,'

function e {
  $EDITOR $@ &> /dev/null &!
}

function libre {
  libreoffice --nologo $@ &!
}

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
zstyle ':completion:*:descriptions' format "-- %d% --"
zstyle ':completion:*' group-name ''
zstyle ':completion:*' ignore-parents parent pwd .. directory
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' original true
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' squeeze-slashes true
zstyle :compinstall filename '/home/my/.zshrc'

# See https://coderwall.com/p/9fksra/speed-up-your-zsh-completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit
compinit

bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

autoload -U select-word-style
select-word-style bash

# Shift-tab
bindkey '^[[Z' reverse-menu-complete

zle -N deer-launch
bindkey '\ek' deer-launch

if [ -f ~/local.sh ]; then
   . ~/local.sh
fi

source ~/.fresh/build/shell.sh

eval "$(fasd --init auto)"

eval "$(scmpuff init -s)"

escape() {
  # See http://zsh.sourceforge.net/Doc/Release/Expansion.html#Parameter-Expansion-Flags
  echo "${(q-)1}"
}

fzf-process() {
  read key
  read f
  export f
  case $key in
    alt-h)
      cd ..
      fzf-fm
      ;;
    /)
      find . | fzf-open
      ;;
    alt-m)
      mpv $f
      ;;
    enter)
      if [ -d $f ]; then
        cd $f
        fzf-fm
      else
        zle reset-prompt
        ef=`escape $f`
        zle -U ' '$ef
      fi
      ;;
  esac
}
fzf-open() {
  fzf --expect alt-h,/,alt-m,enter | fzf-process
}
fzf-fm() {
  ls -A | fzf-open
}
fzf-open() {
  f=`find ~/annex/* ~/,/* ~/.cache/songs/* 2> /dev/null | uniq | fzf`
  if [ -z $f ]; then
    # nothing
  else
    open $f
  fi
}

zle -N fzf-fm
bindkey '\eo' fzf-fm

bindkey -s '\ei' 'fzf-open\n'

bindkey -s '^z' 'bg; disown\n'

bindkey -s '\er' 'ranger\n'

zle-line-init ()
{
  #auto-fu-init
}
#zle -N zle-line-init
#zle -N zle-keymap-select auto-fu-zle-keymap-select

bindkey '^[' vi-cmd-mode
