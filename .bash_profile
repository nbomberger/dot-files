# .bashrc
# 
#  by Nathaniel Bomberger October 5, 2009

# Source global definitions
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
# Colors added by Nate Bomberger
DULL=0
BRIGHT=1

FG_BLACK=30
FG_RED=31
FG_GREEN=32
FG_YELLOW=33
FG_BLUE=34
FG_VIOLET=35
FG_CYAN=36
FG_WHITE=37

FG_NULL=00

BG_BLACK=40
BG_RED=41
BG_GREEN=42
BG_YELLOW=43
BG_BLUE=44
BG_VIOLET=45
BG_CYAN=46
BG_WHITE=47

BG_NULL=00

##
# ANSI Escape Commands
##
ESC="\033"
NORMAL="\[$ESC[m\]"
RESET="\[$ESC[${DULL};${FG_WHITE};${BG_NULL}m\]"

##
# Shortcuts for Colored Text ( Bright and FG Only )
##

# DULL TEXT

BLACK="\[$ESC[${DULL};${FG_BLACK}m\]"
RED="\[$ESC[${DULL};${FG_RED}m\]"
GREEN="\[$ESC[${DULL};${FG_GREEN}m\]"
YELLOW="\[$ESC[${DULL};${FG_YELLOW}m\]"
BLUE="\[$ESC[${DULL};${FG_BLUE}m\]"
VIOLET="\[$ESC[${DULL};${FG_VIOLET}m\]"
CYAN="\[$ESC[${DULL};${FG_CYAN}m\]"
WHITE="\[$ESC[${DULL};${FG_WHITE}m\]"

# BRIGHT TEXT
BRIGHT_BLACK="\[$ESC[${BRIGHT};${FG_BLACK}m\]"
BRIGHT_RED="\[$ESC[${BRIGHT};${FG_RED}m\]"
BRIGHT_GREEN="\[$ESC[${BRIGHT};${FG_GREEN}m\]"
BRIGHT_YELLOW="\[$ESC[${BRIGHT};${FG_YELLOW}m\]"
BRIGHT_BLUE="\[$ESC[${BRIGHT};${FG_BLUE}m\]"
BRIGHT_VIOLET="\[$ESC[${BRIGHT};${FG_VIOLET}m\]"
BRIGHT_CYAN="\[$ESC[${BRIGHT};${FG_CYAN}m\]"
BRIGHT_WHITE="\[$ESC[${BRIGHT};${FG_WHITE}m\]"

# REV TEXT as an example
REV_CYAN="\[$ESC[${DULL};${BG_WHITE};${BG_CYAN}m\]"
REV_RED="\[$ESC[${DULL};${FG_YELLOW}; ${BG_RED}m\]"

function elite2 {
local GRAD1=`tty|cut -d/ -f3`
local COLOR1="${YELLOW}"
local COLOR2="\[\033[1;36m\]"
local COLOR3="\[\033[1;30m\]"
local COLOR4="\[\033[0m\]"
PS1="$COLOR2($COLOR1\u$COLOR3@${BRIGHT_BLUE}\h$COLOR2)$COLOR1$COLOR2($COLOR1\#$COLOR3/$COLOR1$GRAD1$COLOR2)$COLOR1$COLOR2($COLOR1\$(date +%I:%M%P)$COLOR3:$COLOR1\$(date +%m/%d/%y)$COLOR2)$COLOR1$COLOR3-$COLOR4\n$COLOR3$COLOR1$COLOR2($COLOR1\$$COLOR3:$COLOR1$COLOR2)$COLOR1$COLOR3-$COLOR4 " 
PS2="$COLOR2$COLO$COLOR3-$COLOR4 "
}

# User specific aliases and functions
set -o vi

alias home='cd ~;ls'
alias domain='ssh -l nathanie nathanielbomberger.com'
alias compx='ssh -X -l ntb22 tux.cs.drexel.edu'
# Amazon sandbox environments 
# Rasberry pi - added by Nathaniel Bomberger 6-11-2013
alias pi='ssh pi@pi'
# Wheelhouse admiral
alias testadmiral='ssh testadmiral'

alias ll='ls -alF'
# added by Nathaniel Bomberger Jun-30-2011 for python3 
alias pyth=python3

# Quick and dirty stuff
alias play='cd ~/play'

elite2
source ~/.profile

# MacPorts Installer addition on 2010-05-16_at_02:59:31: adding an appropriate PATH variable for use with MacPorts.
#export PATH=/opt/local/bin:/opt/local/sbin:$PATH
## Finished adapting your PATH environment variable for use with MacPorts.

#case "$-" in *i*) byobu-launcher && exit 0; esac;
#export CPPFFLAGS="-l/opt/local/include $CPPFLAGS"
#export LDFLAGS="-l/opt/local/lib $LDFLAGS"

##
# Your previous /Users/nbomberger/.bash_profile file was backed up as /Users/nbomberger/.bash_profile.macports-saved_2011-01-19_at_12:01:03
##

# MacPorts Installer addition on 2011-01-19_at_12:01:03: adding an appropriate PATH variable for use with MacPorts.
#export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.
# added 4-5-2011 local command usage ~/bin/
export PATH=/Users/nbomberger/bin:$PATH

function randomosx() {
LIST_OF_FUN=$(curl --connect-timeout 3 -s http://twitter.com/natebomberger | grep '<span class=\"entry' | sed -e 's/<[^>]*>//g' | sed 's/^[ \t]*//;s/[ \t]*$//' )
RANDY=`echo $RANDOM%20+1 | bc`  
echo "$LIST_OF_FUN" | sed -n "${RANDY}p"
}
# added 4-5-2011 local command usage ~/bin/
export SVN_EDITOR=vim

# Setting PATH for Python 3.2
# The orginal version is saved in .bash_profile.pysave
#PATH="/Library/Frameworks/Python.framework/Versions/3.2/bin:${PATH}"

# added 2-29-2012  adb for android dev
export ANDROID_HOME=/Users/nbomberger/adt-bundle-mac-x86_64/sdk
export PATH=$PATH:$ANDROID_HOME


# Finished adapting your PATH environment variable for use with MacPorts.
# added 7-4-2012 to fix rmagick
#export PKG_CONFIG_PATH="/opt/local/lib/pkgconfig:$PKG_CONFIG_PATH"
#export C_INCLUDE_PATH="/usr/local/Cellar/imagemagick/6.7.7-6/include/ImageMagick/wand/MagickWand.h:$C_INCLUDE_PATH"
#
export EDITOR='subl -w'

# DELETED: 08-11-2012 because `brew doctor` told me to..
#export DYLD_LIBRARY_PATH="/usr/local/mysql/lib:$DYLD_LIBRARY_PATH"

export PYTHONSTARTUP=~/.pythonrc
export FRAPI_PATH=/Users/nbomberger/Site/frapi

# Added by Nathaniel Bomberger for EC2 command access, tools
export JAVA_HOME=`/System/Library/Frameworks/JavaVM.framework/Versions/Current/Commands/java_home`
export EC2_HOME=~/bin/amazon-ec2-api-tools
export PATH=$EC2_HOME/bin:$PATH
# Added by Nathaniel Bomberger for Vagrant use
# http://net.tutsplus.com/tutorials/php/vagrant-what-why-and-how/
#PATH=$PATH:/Applications/VirtualBox.app/Contents/MacOS
export PATH

# Added by Nathaniel Bomberger 6-11-2013
# Cause the status of terminated background jobs to be reported immediately, rather than before printing the next primary prompt.
set -b
# Added by Nathaniel Bomberger 1-18-2014
# Modified by Nathaniel Bomberger 5-13-2014 (homebrew install)
# jenkins on off switches (aliases)
alias jenkins_start='launchctl load ~/Library/LaunchAgents/homebrew.mxcl.jenkins.plist'
alias jenkins_stop='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.jenkins.plist'

alias rtest='rspec -c -b -f documentation'
alias postgres_start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias postgres_stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

case $- in
    *i*) source ~/.bashrc
esac
# Added by Nathaniel Bomberger 2-10-2014
if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

# Added to assist with Wheelhouse on April 8, 2013
# By Nathaniel Bomberger
# Need to do the following:
#   
#   brew install osxfuse sshfs
# 
# Follow instructions and you should be able to do
# rmount server:/path/to/directory/you/want/to/mount
# Remote Mount (sshfs)
# creates mount folder and mounts the remote filesystem
rmount() {
  local host folder mname
  host="${1%%:*}:"
  [[ ${1%:} == ${host%%:*} ]] && folder='' || folder=${1##*:}
  if [[ $2 ]]; then
    mname=$2
  else
    mname=${folder##*/}
    [[ "$mname" == "" ]] && mname=${host%%:*}
  fi
  if [[ $(grep -i "host ${host%%:*}" ~/.ssh/config) != '' ]]; then
    mkdir -p ~/mounts/$mname > /dev/null
    sshfs $host$folder ~/mounts/$mname -oauto_cache,reconnect,defer_permissions,negative_vncache,volname=$mname,noappledouble && echo "mounted ~/mounts/$mname"
  else
    echo "No entry found for ${host%%:*}"
    return 1
  fi
}

# Remote Umount, unmounts and deletes local folder (experimental, watch you step)
rumount() {
  if [[ $1 == "-a" ]]; then
    ls -1 ~/mounts/|while read dir
    do
      [[ $(mount | grep "mounts/$dir") ]] && umount ~/mounts/$dir
      [[ $(ls ~/mounts/$dir) ]] || rm -rf ~/mounts/$dir
    done
  else
    [[ $(mount | grep "mounts/$1") ]] && umount ~/mounts/$1
    [[ $(ls ~/mounts/$1) ]] || rm -rf ~/mounts/$1
  fi
}


# Pebble SDK
export PATH=/Users/nbomberger/pebble-dev/PebbleSDK-current/bin:$PATH
export PATH=~/pebble-dev/arm-cs-tools/bin:$PATH

# Added by Nathaniel Bomberger 09/2/2014
alias swift='xcrun swift'
alias swiftc='xcrun swiftc'

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH
alias xctest='/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/Library/Xcode/Agents/xctest'

# delete .DS_Store recursivley
alias rm_dsstore='find . -name '*.DS_Store' -type f -delete'

# Added in order to assist with Weblinc - Nathaniel Bomberger 1-12-2014
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Added to load go when installed via homebrew (google language
source ~/.gorc

# Added for emacs support installed via homebrew by Nathaniel Bomberger - 4-26-2016
alias emacs="/usr/local/Cellar/emacs/HEAD/Emacs.app/Contents/MacOS/Emacs -nw"
# Added for safetytag
export NODE_SERVER=local
# Added for Zookeeper/Kafka
export PATH=$PATH:$JAVA_HOME/bin
ssh-add -A 2>/dev/null;

# Added for NVM 1-25-2017
# Hidden for NVM 10-5-2017 to use n
#export NVM_DIR=~/.nvm
#source $(brew --prefix nvm)/nvm.sh

#fastlane
#export PATH="$HOME/.fastlane/bin:$PATH"

# added for swiftenv (fast switching between swift versions)
if which swiftenv > /dev/null; then eval "$(swiftenv init -)"; fi


# added for mysql
MYSQL=/usr/local/mysql/bin
export PATH=$PATH:$MYSQL
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH

#added for Ocaml 5-15-2017
. /Users/nbomberger/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# Custom scripts for development environments
#PATH=$PATH$( find $HOME/dev/ -type d -printf ":%p" )

# added by Miniconda3 4.3.21 installer
export PATH="/Users/nbomberger/miniconda3/bin:$PATH"
# Added for Android/React development per
# https://facebook.github.io/react-native/docs/getting-started.html
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

export REACT_EDITOR=code
export PATH="$HOME/.fastlane/bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"
