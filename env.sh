#!/bin/zsh

# PATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/apache-maven-3.3.9/bin"
export EDITOR='subl -w'
# export PYTHONPATH=$PYTHONPATH
# export MANPATH="/usr/local/man:$MANPATH"

# Virtual Environment
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Coding
# source /usr/local/bin/virtualenvwrapper.sh

# Owner
export USER_NAME="Nithin Betegeri"

# FileSearch
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }

#mkdir and cd
function mkcd() { mkdir -p "$@" && cd "$_"; }

#docker cleanup
function dockrmi() { if [[ -z "$1" ]];then docker rmi -f $(docker images -q -f "dangling=true"); else docker images | grep $1 | tr -s " " | cut -d " " -f 3 | xargs docker rmi -f ; fi }
function dockrmiall() { docker rmi -f $(docker images -q ); }
function dockrm() { if [[ -z "$1" ]];then docker rm -f $(docker ps -q -f status=exited); else docker ps -a | grep hello-world | tr -s " " | cut -f 1 -d " " | xargs docker rm -f ; fi }
function dockrmall() { docker rm -f $(docker ps -a -q ); }
function dockrmvol() { docker volume ls -q | xargs docker volume rm ; }
function gitpullall() { find . -type d -depth 1 -exec git --git-dir={}/.git --work-tree=$PWD/{} pull origin master \; }
function gitstatusall() {
  find . -maxdepth 1 -mindepth 1 -type d -exec sh -c '(echo {} && cd {} && git status -s && echo)' \;
}

# Aliases
alias cppcompile='c++ -std=c++11 -stdlib=libc++'

# Use sublimetext for editing config files
alias zshconfig="subl ~/.zshrc"
alias envconfig="subl ~/Coding/config/env.sh"

export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home"
export PATH=${PATH}:$JAVA_HOME
