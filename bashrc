#!/bin/bash
#======================================================================
# 
# PURPOSE: attempt at multiplatform .bashrc
# 
# USAGE: 
#             
#
# PRECONDITIONS/REQUIREMENTS:
#             - need git, emacs
#             
# 
# INPUTS:
#             - 
# 
# OUTPUTS:
# 
# NOTES: 
#
# AUTHOR:
#                      - Eric Winter
# 
# CREATED:    6/10/12
# 
# REVISIONS:  v1.0 6/2012
# 
# KNOWN BUGS: none
#
#======================================================================
# 

#if false; then     #skip whole file.

# PROMPT=$P$G       # old default
#PS1="\u@\h:\w \$ " # ehw@K2:/c/work $
PS1="\h:\w \$ "     # K2:/c/work $

export EDITOR=/c/emacs-23.2/bin/emacs.exe
export PATH=.:$PATH


#vary by platform
#=======================================
if [ $HOSTNAME == 'K2' ]; then
  echo Detected host: k2
  work=/c/work      # on XP
  emacsHome=~   # in the case of XP, (where .emacs lives), just an FYI.
  apache=/c/Apache2.2
  alias r193=". ~/bin/ruby193.sh"
  alias r187=". ~/bin/ruby187.sh"
  emacs=/c/emacs-23.2/bin/emacs.exe
  . ~/bin/ruby193.sh
elif [ $HOSTNAME == 'KLSHOME' ]; then
  #acer
  work=/c/Users/ehw/work
  emacsHome=$HOME   # in the case of Windows 7.
  emacs=/c/emacs-23.4/bin/emacs.exe
elif [ $HOSTNAME == 'KATHY-PC' ]; then
  #compaq
  echo Detected host: Kathy-pc compaq
  work=/c/work      # on XP
  emacsHome=/c      # in the case of XP, (where .emacs lives), just an FYI.
  emacs=/c/emacs-23.4/bin/emacs.exe
else
  echo Unknown or new hostname: $HOSTNAME
fi


#
# --- Rails commands ----------------------------------------------------------
#
function rails_command {
    local cmd=$1
    shift

    if [ -e script/rails ]; then
        script/rails $cmd "$@"
    else
        script/$cmd "$@"
    fi
}

function rs {
    rails_command server "$@"
}

function rc {
    rails_command console "$@"
}

function rg {
    rails_command generate "$@"
}

function rr {
    rails_command runner "$@"
}

# tail -f shortcut for Rails log files.
#
# It selects the log file to tail depending on the environment, priority is:
#
#   1. argument, eg rl test
#   2. RAILS_ENV environment variable
#   3. Defaults to 'development'
#
# Thanks to pgas in #bash for the idiom to chain the defaults.
function rl {
    tail -f log/${1-${RAILS_ENV-development}}.log
}

function rn {
    local app_name=$1
    shift

    rails new $app_name --skip-bundle "$@" && cd $app_name && bundle install --local
}

# Reboots Passenger.
alias rb='touch tmp/restart.txt'

# Be sure to run the rake in your bundle.
alias bx='bundle exec'
alias bk='bundle exec rake'
alias br='bundle exec rails'
alias bs='bundle exec spec'




# 
# set the title of the window
# mimics title command in dos
# 
function title {
    echo -e "\033]2;$1 $2 $3 $4 $5 $6\007"
}

# Alias commands
alias h10='history 10'
alias h20='history 20'
alias h='h=$(pwd)'      #here 
alias isodate2='date  +%Y-%m-%dT%H%M'
alias isodate='date --iso-8601=minutes | sed "s/://g"'
alias l1='ls -1'
alias ll='ls -l'
alias ls='ls -F --color --show-control-chars'
alias purge='rm *~ .*~'
alias rv="ruby -v"      # ruby/rails shortcuts
alias t='t=$(pwd)'      #there 
alias projects=". ~/.project_shortcuts"   # contains aliases/dir names

# set initial window frame title
title bashrc $(date  +%H:%M) 

ruby -v            #fyi

# fi               #skip whole file.
. ~/.project_shortcuts   # contains aliases/dir names



