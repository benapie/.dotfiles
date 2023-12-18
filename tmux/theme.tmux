set-option -g status-position "bottom"
set-option -g status-style bg=default,fg=default
set-option -g status-justify centre
set-option -g status-left '#[bg=default,fg=default,bold]#{?client_prefix,,  tmux  }#[bg=#34455A,fg=#CBCCC6,bold]#{?client_prefix,  tmux  ,}'
set-option -g status-right 'benapie '
set-option -g window-status-format ' #I:#W '
set-option -g window-status-current-format '#[bg=#34455A,fg=#CBCCC6] #I:#W#{?window_zoomed_flag, 󰊓 , }'
