# User configuration sourced by interactive shells
#

# Define zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh

# .zshrc
fpath=( "$HOME/.zfunctions" $fpath )

export PATH=$PATH:/root/go/bin
#export TERM=xterm-256color

export GO111MODULE=on

export GOPROXY=https://goproxy.io

alias ll='ls -l -G'
alias ls='ls -G'
alias la='ls -Ga'


alias cnpm="npm --registry=https://registry.npm.taobao.org \
    --cache=$HOME/.npm/.cache/cnpm \
    --disturl=https://npm.taobao.org/dist \
    --userconfig=$HOME/.cnpmrc"

[ -f ~/.fzf.zsh] && source ~/.fzf.zsh
