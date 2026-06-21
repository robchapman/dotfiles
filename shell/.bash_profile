export BASH_SILENCE_DEPRECATION_WARNING=1
eval "$(/opt/homebrew/bin/brew shellenv)"
[[ -f ~/.bashrc ]] && source ~/.bashrc
. "$HOME/.cargo/env"
export PATH="$HOME/.cargo/bin:$PATH"
