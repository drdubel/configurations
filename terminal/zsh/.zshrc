# -*- zshrc -*-
# Antoni Suszko
# $Id: .zshrc,v 1.0 2022/10/01 16:26 drdubel
#

case `uname` in
'SunOS')
    PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/ccs/bin:/usr/ucb:/usr/local/bin:/usr/local/sbin
    MANPATH=/usr/share/man:/usr/local/man:/usr/local/share/man:/usr/sfw/share/man:/usr/sfw/esp/man:/usr/perl5/5.6.1/man:/usr/openwin/share/man:/usr/dt/share/man:/usr/j2se/man:/usr/java1.2/man
    TERM=xtermc
    alias screen='TERM=screen screen'
    SCREENDIR=$HOME/.screen
    export PATH MANPATH TERM SCREENDIR
    ;;
'HP-UX')
    TERM=xtermc
    export TERM
    ;;
'Linux')
    #unalias ls
    alias ls='ls -F'
    ;;
'FreeBSD')
    ;;
'Darwin')
    ulimit -n 2048
    alias mtr="sudo /usr/local/sbin/mtr"
    test -e $HOME/.iterm2_shell_integration.zsh && source $HOME/.iterm2_shell_integration.zsh || true
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
    ;;
*)
    ;;
esac

HISTFILE=${HOME}/.zsh_history
HISTSIZE=25000
SAVEHIST=25000
DIRSTACKSIZE=10

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY
setopt AUTO_PUSHD
setopt RMSTARSILENT
setopt NOBEEP
setopt AUTOCD


b_esc=`print -Pn "\e]0;"`
e_esc=`print -Pn "\a"`

case "${TERM}" in
screen)
    export PROMPT="%{${b_esc}$WINDOW %n@%m:%/${e_esc}%}%m%# "
    preexec () {
        print -Pn "\e]0;$WINDOW %n@%m:%/: ";
        print -RPn "%60>...>${(V)1//\%/%%}";
        print -Pn "\a";
    }
    ;;
xterm*|rxvt*)
    export PROMPT="%{${b_esc}%n@%m:%/${e_esc}%}%m%# "
    preexec () {
        print -Pn "\e]0;%n@%m:%/: ";
        print -RPn "%60>...>${(V)1//\%/%%}";
        print -Pn "\a";
    }
    ;;
*)
   export PROMPT="%m%# "
   ;;
esac

# oh my zsh config

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'
export LC_ALL="en_GB.UTF-8"
export LANG="en_GB.UTF-8"
export LC_CTYPE="pl_PL.UTF-8"
export MAILDIR=${HOME}/Mail/inbox/
export MAIL=$MAILDIR
export LESSCHARSET=utf-8
export PAGER=less

bindkey -e
bindkey "^U" vi-kill-line

export GOPATH=$HOME/go
export PATH=$HOME/env/bin:$GOPATH/bin:$HOME/.cargo/bin:$HOME/local/bin:$PATH:$HOME/.krew/bin
export FZF_DEFAULT_OPTS="--color=light"
export XDG_CONFIG_HOME=$HOME/.config

setopt AUTOLIST

# Aliases

alias lsd='ls -d *(-/DN)'
alias ag="ag --color-line-number '1;14' --color-path '1;34' --color-match '2;31'"
alias k=kubectl
alias vi=nvim
alias vim=nvim

export VAULT_CLI_NO_COLOR=1

# source <("$HOME/.cargo/bin/starship" init zsh --print-full-init)
# Completion
autoload -Uz compinit
autoload -U +X bashcompinit
compinit
bashcompinit
complete -F __start_kubectl k
complete -o nospace -C terraform terraform
zstyle ':completion:*' menu select
fpath+=~/.zfunc

source <(antibody init)

antibody bundle < ~/.zsh_plugins.txt
eval "$(starship init zsh)"
alias ls='colorls'
bindkey -s '^@' 'clear^M'
