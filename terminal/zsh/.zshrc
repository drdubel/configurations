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



# oh my zsh config

#export ZSH="$HOME/.oh-my-zsh"
#ZSH_THEME="robbyrussell"
#plugins=(git)
#source $ZSH/oh-my-zsh.sh

export PATH="$PATH:/home/antek/development/flutter/bin" 
export EDITOR='nvim'
export LC_ALL="C.UTF-8"
export LANG="C.UTF-8"
export LC_CTYPE="pl_PL.UTF-8"
export MAILDIR=${HOME}/Mail/inbox/
export MAIL=$MAILDIR
export LESSCHARSET=utf-8
export PAGER=less
export JAVA_HOME="/home/antek/.local/share/JetBrains/Toolbox/apps/AndroidStudio/ch-0/221.6008.13.2211.9619390/jbr/" 
export MultiMC=/home/antek/.local/share/multimc/MultiMC
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="$PATH":"$HOME/programowanie/szkola/build"
export PATH="$PATH":"$HOME/programowanie/TenAPI/Protobuf/bin"

bindkey -e
bindkey "^U" vi-kill-line

export GOPATH=$HOME/go
export PATH=$HOME/env/bin:$GOPATH/bin:$HOME/.cargo/bin:$HOME/local/bin:$PATH:$HOME/.krew/bin
export FZF_DEFAULT_OPTS="--color=light"
export XDG_CONFIG_HOME=$HOME/.config
export PATH="/opt/cuda/bin${PATH:+:${PATH}}"
export LD_LIBRARY_PATH="/opt/cuda/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"

setopt AUTOLIST

# Aliases

alias l='ls -hlAt'
alias lr='ls -hlArt'
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
bindkey -s '^ ' 'clear^M'

export PATH=$PATH:/home/antek/.nexustools

#export NVM_DIR="$HOME/.config/nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
bindkey -e

bindkey    "^[[7~"        beginning-of-line
bindkey "^[[8~"        end-of-line
bindkey    "\e[2~"        overwrite-mode
bindkey    "\e[3~"        delete-char
bindkey "^[Od"        backward-word                 # rxvt
bindkey    "\e[1;5D"    backward-word
bindkey "^[Oc"        forward-word                # rxvt
bindkey    "\e[1;5C"    forward-word
bindkey "^[[A"         history-search-backward
bindkey "^[[B"        history-search-forward
bindkey    "\e[5~"        history-beginning-search-backward
bindkey    "\e[6~"        history-beginning-search-forward
bindkey    "^W"        backward-delete-word
export PATH=/var/tmp/context/tex/texmf-linux-64/bin:/var/tmp/context/tex/texmf-linux-64/bin:/opt/cuda/bin:/home/antek/env/bin:/home/antek/go/bin:/home/antek/.cargo/bin:/home/antek/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/opt/android-sdk/platform-tools:/opt/android-sdk/tools:/opt/android-sdk/tools/bin:/opt/cuda/bin:/opt/cuda/nsight_compute:/opt/cuda/nsight_systems/bin:/opt/flutter/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/antek/.local/share/JetBrains/Toolbox/scripts:/home/antek/.cargo/bin:/home/antek/go/bin:/home/antek/development/flutter/bin:/home/antek/.pub-cache/bin:/home/antek/programowanie/szkola/build:/home/antek/programowanie/TenAPI/Protobuf/bin:/home/antek/.krew/bin:/home/antek/.nexustools
bindkey "^\\" "pkill -9 !!:0"

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

