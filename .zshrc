autostart_tmux () {
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
    autostart_tmux
    enable_git_completion_linux
    # if you wish to use IMDS set AWS_EC2_METADATA_DISABLED=false
    export AWS_EC2_METADATA_DISABLED=true
elif [[ $(grep -i Microsoft /proc/version) ]]; then # if wsl
    export BROWSER=/usr/bin/wslview
    autostart_tmux
    enable_git_completion_linux
    export ANDROID_HOME=/mnt/c/Users/napie/AppData/Local/Android/Sdk
    export WSLENV=ANDROID_HOME/p
fi

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
source ~/.dotfiles/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.dotfiles/.p10k.zsh ]] || source ~/.dotfiles/.p10k.zsh


alias reload="source ~/.zshrc"
alias v="nvim"
alias g="git"
alias pn="pnpm"



# bun completions
[ -s "/home/benapie/.bun/_bun" ] && source "/home/benapie/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
path+="$BUN_INSTALL/bin"

