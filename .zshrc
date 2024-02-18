if [[ $(uname) == *"Darwin"* ]]; then # if amzn-mac
    source ~/.dotfiles/amzn/.zshrc
elif [[ $(grep -i amzn2int /proc/version) ]]; then # if amzn-devbox
    source ~/.dotfiles/amzn/.zshrc
elif [[ $(grep -i Microsoft /proc/version) ]]; then # if wsl
    export BROWSER=/usr/bin/wslview
fi

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
source ~/.dotfiles/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.dotfiles/.p10k.zsh ]] || source ~/.dotfiles/.p10k.zsh


alias reload="source ~/.zshrc"
alias v="nvim"
alias vim="nvim"
alias g="git"
alias pn="pnpm"
