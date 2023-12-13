autoload -U colors zsh/terminfo
colors

source ~/gitstatus/gitstatus.plugin.zsh

function set_prompt() {
    icon_section="%K{241}  " 
    path_section="%K{214}%F{241}%F{237} %~ "
    git_section="%k%F{214}"

    if gitstatus_query MY && [[ $VCS_STATUS_RESULT == ok-sync ]]; then
        git_branch=${${VCS_STATUS_LOCAL_BRANCH:-@${VCS_STATUS_COMMIT}}//\%/%%}
        git_indicator_label=""
        
        (( VCS_STATUS_NUM_STAGED    )) && git_indicator_label='✓'
        (( VCS_STATUS_NUM_UNSTAGED  )) && git_indicator_label='✗'
        (( VCS_STATUS_NUM_UNTRACKED )) && git_indicator_label='?'

        git_icon=""
        [ ! -z $git_indicator_label ] &&  git_icon=" ${git_indicator_label}"

        git_section="%K{248}%F{214}%F{237}  ${git_branch}${git_icon} %k%F{248}"
    fi

    PROMPT="%B${icon_section}${path_section}${git_section}%k%b%f "
}

gitstatus_stop 'MY' && gitstatus_start -s -1 -u -1 -c -1 -d -1 'MY'
autoload -Uz add-zsh-hook
add-zsh-hook precmd set_prompt

alias reload="source ~/.zshrc"
alias v="nvim"
alias vim="nvim"
alias g="git"
