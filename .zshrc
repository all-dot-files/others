# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random"
ZSH_THEME="ys"
# ZSH_THEME="agnoster"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=30'

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# zsh-syntax-highlighting
# source ~/.config/zsh/themes/catppuccin_frappe-zsh-syntax-highlighting.zsh


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# golang conf
export GOROOT='/usr/local/go'
export GOPRIVATE=*.baidu.com
export GOPROXY=https://goproxy.baidu-int.com,https://goproxy.io,direct
export GOPATH=/Users/houzhuyuan/Data/go
alias code="open -a 'Visual Studio Code'"

# env set-up
export PATH="$PATH:$GOROOT"
export PATH="$PATH:$GOROOT/bin/"
export PATH="$PATH:$GOPATH/bin/"
export PATH="$PATH:$GOPATH/bin/darwin_arm64/"
export PATH="$PATH:$GOPATH/bin/darwin_amd64/"
export PATH="$PATH:/usr/local/go/pkg/tool/darwin_arm64"

# proxy conf
alias wgon="wg-quick up wg0"
alias wgoff="wg-quick down wg0"

# command alias
alias ll='ls -l'
alias la='ls -a'
alias grep="grep --color=auto"
alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s zip='unzip'
alias -s bz2='tar -xjvf'

# cd alias
alias cdd='cd ~/Desktop/'
alias cdp='cd ~/Personal/'

# git alias
alias g='git'

alias ga='git add'
alias gaa='git add --all'
alias gapa='git add --patch'
alias gau='git add --update'
alias gap='git apply'

alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbda='git branch --no-color --merged | command grep -vE "^(\*|\s*(master|develop|dev)\s*$)" | command xargs -n 1 git branch -d'
alias gbl='git blame -b -w'
alias gbnm='git branch --no-merged'
alias gbr='git branch --remote'
alias gbs='git bisect'
alias gbsb='git bisect bad'
alias gbsg='git bisect good'
alias gbsr='git bisect reset'
alias gbss='git bisect start'

alias gc='git commit -v'
alias 'gc!'='git commit -v --amend'
alias 'gcn!'='git commit -v --no-edit --amend'
alias gca='git commit -v -a'
alias 'gca!'='git commit -v -a --amend'
alias 'gcan!'='git commit -v -a --no-edit --amend'
alias 'gcans!'='git commit -v -a -s --no-edit --amend'
alias gcam='git commit -a -m'
alias gcsm='git commit -s -m'
alias gcb='git checkout -b'
alias gcf='git config --list'
alias gcl='git clone --recursive'
alias gclean='git clean -fd'
alias gpristine='git reset --hard && git clean -dfx'
alias gcm='git checkout master'
alias gcd='git checkout develop'
alias gcmsg='git commit -m'
alias gco='git checkout'
alias gcount='git shortlog -sn'
compdef _git gcount
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias gcs='git commit -S'

# HomeBrew
export HOMEBREW_NO_INSTALL_CLEANUP=1
export HOMEBREW_INSTALL_FROM_API=1
export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
export HOMEBREW_NO_AUTO_UPDATE=true
export HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=true
# for tap in core cask{,-fonts,-versions} command-not-found services; do
#     brew tap --custom-remote --force-auto-update "homebrew/${tap}" "https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-${tap}.git"
# export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
# export HOMEBREW_API_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles/api" #brew.idayer.com
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
# HomeBrew END

export GIT_HOME="/usr/local/git"
export PATH="$PATH:$GIT_HOME/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export NVM_NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node

# llvm
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

# navi
_navi_call() {
   local result="$(navi "$@" </dev/tty)"
   printf "%s" "$result"
}

_navi_widget() {
   local -r input="${LBUFFER}"
   local -r last_command="$(echo "${input}" | navi fn widget::last_command)"
   local replacement="$last_command"

   if [ -z "$last_command" ]; then
      replacement="$(_navi_call --print)"
   elif [ "$LASTWIDGET" = "_navi_widget" ] && [ "$input" = "$previous_output" ]; then
      replacement="$(_navi_call --print --query "$last_command")"
   else
      replacement="$(_navi_call --print --best-match --query "$last_command")"
   fi

   if [ -n "$replacement" ]; then
      local -r find="${last_command}_NAVIEND"
      previous_output="${input}_NAVIEND"
      previous_output="${previous_output//$find/$replacement}"
   else
      previous_output="$input"
   fi

   zle kill-whole-line
   LBUFFER="${previous_output}"
   region_highlight=("P0 100 bold")
   zle redisplay
}

zle -N _navi_widget
bindkey '^g' _navi_widget

# rust
export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup

# go env manage
[[ -s "/Users/houzhuyuan/.gvm/scripts/gvm" ]] && source "/Users/houzhuyuan/.gvm/scripts/gvm"

source $ZSH/oh-my-zsh.sh
eval "$(vfox activate zsh)"

export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

# NEW_SESSION=`tmux new-session -dP`
# TMUX=`tmux switch-client -t $NEW_SESSION`
