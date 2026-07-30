# Set GIT_HOME folder
export GIT_HOME=$HOME/Documents/git

# export LC_CTYPE=C
# export LANG=C
alias tmux='tmux -u'

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# pnpm 11
# export PNPM_HOME="/Users/samobrien/.local/share/mise/installs/pnpm"
# case ":$PATH:" in
#   *":$PNPM_HOME/bin:"*) ;;
#   *) export PATH="$PNPM_HOME/bin:$PATH" ;;
# esac
# pnpm end

# pnpm 10
export PNPM_HOME="/Users/samobrien/.local/share/mise/installs/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Ruby
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Postgres
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Java
export JAVA_HOME="/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home"

# mise
eval "$(/Users/samobrien/.local/bin/mise activate zsh)"

# Rust
export PATH=$PATH:~/.cargo/bin/

export COREPACK_ENABLE_AUTO_PIN=0

if [ -z "$TMUX" ]
then
    tmux attach -t TMUX || tmux new -s TMUX
fi

# direnv
eval "$(direnv hook zsh)"

# local bin
export PATH=$HOME/.local/scripts:$PATH
bindkey -s ^f "tmux-sessionizer\n"

# Ruby
export RUBYOPT="-r$HOME/.rubyopenssl_default_store.rb $RUBYOPT"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
export EDITOR="nvim"

# Tailscale
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"

# Playwright
export BROWSER='open -a "Google Chrome"'

# Ghostty
export PATH="$PATH:/Applications/Ghostty.app/Contents/MacOS"

# Load secrets
[ -f ~/.secrets ] && source ~/.secrets

