set -g status-position "top"
set -g status-style bg=default,fg=default
set -g status-justify centre
set -g status-left '#[bg=default,fg=default,bold]#{?client_prefix,,  tmux  }#[bg=#34455A,fg=#CBCCC6,bold]#{?client_prefix,  tmux  ,}'
set -g status-right 'benapie '
set -g window-status-format ' #I:#W '
set -g window-status-current-format '#[bg=#34455A,fg=#CBCCC6] #I:#W#{?window_zoomed_flag, 󰊓 , }'

set -g pane-border-lines heavy
set -g pane-border-style fg=#0f1419
set -g pane-active-border-style bg=default,fg=#34455A

