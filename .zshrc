autostart_tmux_linux () {
    if [ -z "$TMUX" ] && [[ "$TERM_PROGRAM" != "vscode" ]]; then
        tmux attach -t TMUX || tmux new -s TMUX
    fi
}

enable_git_completion_linux() {
    autoload -Uz compinit && compinit
}

if [[ $(uname) == *"Darwin"* ]]; then # if amzn-mac
    source ~/.dotfiles/amzn/.zshrc
elif [[ $(grep -i amzn2int /proc/version) ]]; then # if amzn-devbox
    source ~/.dotfiles/amzn/.zshrc
    autostart_tmux_linux
    enable_git_completion_linux
elif [[ $(grep -i Microsoft /proc/version) ]]; then # if wsl
    export BROWSER=/usr/bin/wslview
    autostart_tmux_linux
    enable_git_completion_linux
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



# bun completions
[ -s "/home/benapie/.bun/_bun" ] && source "/home/benapie/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
