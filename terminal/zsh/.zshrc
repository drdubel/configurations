#ource /Users/antek/env/bin/activate
#-*- zshrc -*-
# Antoni Suszko
# $Id: .zshrc,v 1.0 2022/10/01 16:26 drdubel
#
# ~/.zshrc

# ---------------------------------------------------------------------------
# OS-specific setup
# ---------------------------------------------------------------------------
case "$(uname)" in
  Darwin)
    ulimit -n 2048
    alias mtr="sudo /usr/local/sbin/mtr"
    [[ -f "$HOME/.iterm2_shell_integration.zsh" ]] && source "$HOME/.iterm2_shell_integration.zsh"
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

    if [[ -f /opt/homebrew/opt/antidote/share/antidote/antidote.zsh ]]; then
      source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
      antidote load
    fi
    ;;
  Linux)
    alias ls='ls -F'
    export CHROME_EXECUTABLE=/usr/bin/firefox
    export BROWSER='/usr/bin/firefox'
    export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
    export MultiMC="$HOME/.local/share/multimc/MultiMC"

    export PATH="$PATH:/opt/cuda/bin"
    export LD_LIBRARY_PATH="/opt/cuda/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"
    export PATH="$PATH:/opt/android-sdk/platform-tools:/opt/android-sdk/tools:/opt/android-sdk/tools/bin"
    export PATH="$PATH:/opt/flutter/bin"
    export PATH="$PATH:$HOME/development/flutter/bin"
    export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts"
    export PATH="$PATH:$HOME/.nexustools"
    ;;
esac

# ---------------------------------------------------------------------------
# History
# ---------------------------------------------------------------------------
HISTFILE="$HOME/.zsh_history"
HISTSIZE=250000
SAVEHIST=250000
DIRSTACKSIZE=10

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY

# ---------------------------------------------------------------------------
# Shell options
# ---------------------------------------------------------------------------
setopt AUTO_PUSHD
setopt RMSTARSILENT
setopt NOBEEP
setopt AUTOCD
setopt AUTOLIST

# ---------------------------------------------------------------------------
# Environment / PATH (common to both machines)
# ---------------------------------------------------------------------------
export EDITOR='nvim'
export PAGER=less
export LESSCHARSET=utf-8
export LC_ALL="C.UTF-8"
export LANG="C.UTF-8"
export LC_CTYPE="pl_PL.UTF-8"
export MAILDIR="$HOME/Mail/inbox/"
export MAIL="$MAILDIR"
export XDG_CONFIG_HOME="$HOME/.config"
export VAULT_CLI_NO_COLOR=1
export FZF_DEFAULT_OPTS="--color=light"

export GOPATH="$HOME/go"
export PATH="$HOME/env/bin:$GOPATH/bin:$HOME/.cargo/bin:$HOME/local/bin:$HOME/.krew/bin:$PATH"
export PATH="$PATH:$HOME/.pub-cache/bin"
export PATH="$PATH:$HOME/.local/bin"

# ---------------------------------------------------------------------------
# Aliases
# ---------------------------------------------------------------------------
alias l='ls -hlAt'
alias lr='ls -hlArt'
alias vi=nvim
alias vim=nvim
alias kys="shutdown now"

# ---------------------------------------------------------------------------
# Completion
# ---------------------------------------------------------------------------
autoload -Uz compinit
autoload -U +X bashcompinit
compinit
bashcompinit

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
fpath+=~/.zfunc

command -v kubectl >/dev/null && complete -F __start_kubectl k
command -v terraform >/dev/null && complete -o nospace -C terraform terraform

# ---------------------------------------------------------------------------
# Key bindings
# ---------------------------------------------------------------------------
bindkey -e
bindkey "^U" vi-kill-line
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char
bindkey ";5C" forward-word
bindkey ";5D" backward-word
bindkey "^H" backward-kill-word
bindkey "5~" kill-word
bindkey -s '^ ' 'clear^M'
bindkey "^\\" "pkill -9 !!:0"

# ---------------------------------------------------------------------------
# Prompt
# ---------------------------------------------------------------------------
eval "$(starship init zsh)"

# ---------------------------------------------------------------------------
# Local/machine-specific overrides
# ---------------------------------------------------------------------------
[[ -f ~/.env ]] && source ~/.env
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
export ANDROID_HOME="/Users/antek/Library/Android/sdk"
export ANDROID_SDK_ROOT="/Users/antek/Library/Android/sdk"
export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$PATH"
