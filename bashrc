#!/bin/sh
PS1=': '
#PS1='[\u@\h \W]\$ '

setxkbmap -option ctrl:swapcaps -layout us
xset r rate 150 80
feh --bg-scale ~/wallpapers/bg2.jpg


# Environment variables
export PATH="/usr/local/bin:$PATH"
export PATH="/snap/bin:$PATH"
export PATH="/home/waker/software:$PATH"
export PATH="~/scripts:$PATH"
export PATH="~/software/matlab/bin:$PATH"

export WAKER='/home/waker'
export SOFTWARE='/home/waker/software'
export SCRIPTS='/home/waker/scripts'
export CONFIG='/home/waker/config'
export KTH='/home/waker/kth'
export DEV='/home/waker/dev'
export WALLPAPER='/home/waker/user/wallpaper'
export EDITOR='vim'

# Aliases
alias emacs='emacs -nw'
alias sudo='sudo env "PATH=$PATH"'
alias vim='vim'
alias v='vim'
alias r='rfind'
alias ls='ls --color=auto'
alias cu='cd ../ && pwd'
alias l='clear && ls -la --color=auto'
alias ll='clear && ls --color=auto'
alias d='. $SCRIPTS/go_to_dir.sh'
alias f='. $SCRIPTS/go-to-file.sh'
alias us='setxkbmap -option ctrl:swapcaps -layout us'
alias se='setxkbmap -option ctrl:swapcaps -layout se'
alias vplug='cd $HOME/.vim/pack/vendor/start'
alias sb='source $HOME/.bashrc'
alias aa='xrdb -merge ~/.Xresources'
alias wg='website.sh'
