export PS1="\W "

export GREP_COLOR='1;37;41'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

export LD_PRELOAD="/usr/local/lib/stderred.so"
export LD_LIBRARY_PATH="/usr/lib/jvm/java-7-openjdk-i386/jre/lib/i386:/usr/local/lib/"
export ECHO_NEST_API_KEY="WYCRXJO5BNOAKPK1O"
export PKG_CONFIG_PATH="/usr/share/pkgconfig"
export EDITOR="/usr/bin/vim"
export JACKDHOME="/home/em"
export JACKDUSER="em"
export RUBYLIB="/usr/lib/ruby"
export LLVM="/home/em/llvm/Release"
export VIMCLOJURE_SERVER_JAR="/usr/share/vim/vim73/bundle/VimClojure/lib/server-2.3.0.jar"

alias sudo='A=`alias` sudo  '
alias s=sudo

alias l='ls -FGC --color=auto'

c() {
    if [ "${#1}" == 0 ]; then
        cd /home/em
    else
        cd "$1"
    fi
    l
}

# A shortcut function that simplifies usage of xclip.
# - Accepts input from either stdin (pipe), or params.
# - If the input is a filename that exists, then it
#   uses the contents of that file.
# ------------------------------------------------
cb() {
  local _scs_col="\e[0;32m"; local _wrn_col='\e[1;31m'; local _trn_col='\e[0;33m'
  # Check that xclip is installed.
  if ! type xclip > /dev/null 2>&1; then
    echo -e "$_wrn_col""You must have the 'xclip' program installed.\e[0m"
  # Check user is not root (root doesn't have access to user xorg server)
  elif [[ "$USER" == "root" ]]; then
    echo -e "$_wrn_col""Must be regular user (not root) to copy a file to the clipboard.\e[0m"
  else
    # If no tty, data should be available on stdin
    if ! [[ "$( tty )" == /dev/* ]]; then
      input="$(< /dev/stdin)"
    # Else, fetch input from params
    else
      input="$*"
    fi
    if [ -z "$input" ]; then  # If no input, print usage message.
      echo "Copies a string or the contents of a file to the clipboard."
      echo "Usage: cb <string or file>"
      echo "       echo <string or file> | cb"
    else
      # If the input is a filename that exists, then use the contents of that file.
      if [ -e "$input" ]; then input="$(cat $input)"; fi
      # Copy input to clipboard
      echo -n "$input" | xclip -selection c
      # Truncate text for status
      if [ ${#input} -gt 80 ]; then input="$(echo $input | cut -c1-80)$_trn_col...\e[0m"; fi
      # Print status.
      echo -e "$_scs_col""Copied to clipboard:\e[0m $input"
    fi
  fi
}
# Shortcut to copy SSH public key to clipboard.
alias cb_ssh="cb /home/em/.ssh/id_rsa.pub"

man() {
	/usr/bin/man $@ || (help $@ 2> /dev/null && help $@ | less)
}

alias jack='`cat /home/em/.jackdrc` &'
alias jjar='java -Xms1024m -jar'
alias j='jp2a'
alias L='c /home/em/Dokument/LaTeX'
alias ff=fbff
alias e=elinks
alias sr='surfraw -browser=elinks'
alias srg='surfraw -browser=elinks google'
alias ipod='cd /media/ipod'
alias a='ack-grep'
alias wgetall='wget --random-wait -r -p -e robots=off -U opera'
alias screencast='ffmpeg -f x11grab -s wxga -r 25 -i :0.0 -sameq'
alias 7z='7za x'
alias scp='scp -vpr'
alias free='free -m'
alias ssh-home='ssh em@128.253.240.126'
alias sshx-home='ssh -X em@128.253.240.126'
alias adb='s /home/em/android/platform-tools/adb'
alias mus='c /home/em/Musik'
alias vid='c /home/em/Video'
alias and='c /home/em/android*/tools'
alias gcal=gcalcli
alias goo=google
alias ytdl=/usr/bin/youtube-dl
alias c='c 2>/dev/null'
alias dc=microdc2
alias ss='sudo !!'
alias iftop='sudo iftop'
alias b='c -'
alias p2h=pdftohtml
alias aria=aria2c
alias cdoc=catdoc
alias ppt=catppt
alias x=xls2csv
alias v=vi
alias vn='vi INSTALL*'
alias vr='vi README*'
alias ba='vi /home/em/.bash_aliases'
alias what=whatis
alias where=whereis
alias ap=apropos
alias in='./configure; make; sudo make install'
alias pin='perl Makefile.*; make; sudo make install'
alias pyn='python setup.py build; sudo python setup.py install'
alias t=/home/em/.todo/todo.sh
alias todo='vi /home/em/Notes/todo/todo.txt'
alias untar='tar xfv'
alias unrar='unrar-free x'
alias mnt='sudo mount'
alias find='sudo find'
alias r='rm -r'
alias cp='cp -r'
alias m=mv
alias mk='mkdir -p'
alias g='git clone'
alias ..='c ..'
alias .2='c ../..'
alias .3='c ../../..'
alias .4='c ../../../..'
alias l1='ls -1'
alias la='ls -a'
alias ll='ls -lh'
alias lt='ls -t'
alias lt1='ls -t1'
alias llt='ls -lth'
alias lla='ls -lha'
alias l1a='ls -l1a'
alias lta='ls -lta'
alias lt1a='ls -t1a'
alias llta='ls -lhta'
alias my=mysql
alias V='vlc -I ncurses'
alias open=xdg-open
alias cht=finch
alias rt='c /'
alias notes='c /home/em/Notes'
alias doc='c /home/em/Dokument'
alias ds='c /home/em/Skrivbord'
alias d='c /home/em/H*mtningar'
alias p='c /home/em/Bilder'
alias gif='c /home/em/Bilder/GIFs'
alias nsfw='c /home/em/Bilder/NSFW'
alias dir2ogg='dir2ogg -v -r -q10 --convert-all --delete-input'
alias gtfo='sudo umount'
alias f='dfc'
alias u='du -hsc'
alias all='ls *'
alias sv='sudo vi'
alias vs='sudo visudo'
alias processing='/home/em/processing-1.5.1/processing'
alias arduino='/home/em/arduino-1.0/arduino'

n() {
        [ ! -d $HOME/notes ] && mkdir -p $HOME/notes
        ${EDITOR:-vi} $HOME/notes/"$*"
}

nls() {
        ls -c /home/em/notes/ | grep "$*"
}
