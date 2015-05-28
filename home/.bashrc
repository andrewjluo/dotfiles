export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

#GUIDEBOOK STUFF=====================================================
# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true

# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

# virtualenvwrapper (tools to make virtualenv a bit easier to use, incl. mkvirtualenv)
source /usr/local/bin/virtualenvwrapper.sh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Make RVM work correctly
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

# Anaconda
export PATH=$HOME/anaconda/bin:$PATH

#CS 140 Path
export PATH="/usr/class/cs140/`uname -m`/bin:$PATH"

source "$HOME/.homesick/repos/homeshick/homeshick.sh"