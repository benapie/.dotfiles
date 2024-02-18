# start tmux if:
# 1. we are a "normal" process (e.g. not owned by tmux, vscode, ..)
# 2. are not sourcing ~/.zshrc
parent_process_name=$(cat /proc/$PPID/cmdline | rev | rev)
if [ $parent_process_name = "/init" ] && [ $ZSH_EVAL_CONTEXT = "file" ]; then
    tmux
fi


if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
source ~/.dotfiles/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.dotfiles/.p10k.zsh ]] || source ~/.dotfiles/.p10k.zsh

# if using WSL
if [[ $(grep -i Microsoft /proc/version) ]]; then
    export BROWSER=/usr/bin/wslview
fi

alias reload="source ~/.zshrc"
alias v="nvim"
alias vim="nvim"
alias g="git"
alias pn="pnpm"

if [[ $(uname) == *"Darwin"* ]] || [ $(grep -i amzn2int /proc/version) ]; then
    source ~/.dotfiles/amzn/.zshrc
fi
