[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

# Expose brew python2
export PATH="/usr/local/opt/python@2/bin:$PATH"

export PATH=$PATH:/Users/ajluo/Documents/AndroidADT/sdk/platform-tools

#Android Paths
export PATH=$PATH:/Users/ajluo/Documents/AndroidADT/sdk/build-tools/android-4.4.2
export PATH=$PATH:/Users/ajluo/Documents/AndroidADT/sdk/tools

#Show/Hide Hidden Files Terminal Commands
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

#GUIDEBOOK STUFF========================================
export ARCHFLAGS="-arch x86_64"

export PATH=/usr/local/bin:$PATH
export PATH=$PATH:/opt/local/bin
export PATH=$PATH:/usr/local/mysql/bin

test -f ~/.bashrc && source ~/.bashrc

# IMPORT BASH PROMPT SCRIPT
if [ -f ~/.bash_prompt ]; then
    . ~/.bash_prompt
fi

# IMPORT BASH ALIAS
if [ -f ~/.bash_alias ]; then
    . ~/.bash_alias
fi

# IMPORT GIT AUTOCOMPLETION SCRIPT
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
  __git_complete co _git_checkout
fi

# VIRTUAL ENVIRONMENT
#source /usr/local/bin/virtualenvwrapper.sh
export PYTHONDONTWRITEBYTECODE=1
export VIRTUALENV_DISTRIBUTE=1

# UPDATE PATH
export PATH=/usr/local/bin:$PATH

# HELPER METHODS
function gp(){
    grep -rin "$1" * --include=*.$2;
    return;
}

#Homebrew Path
export PATH=/usr/local/sbin:$PATH

#Android SDK platform tools path
export PATH="$PATH:~/Library/Android/sdk/platform-tools/"
