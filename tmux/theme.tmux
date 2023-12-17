set-option -g status-position "bottom"
set-option -g status-style bg=default,fg=default
set-option -g status-justify centre
set-option -g status-left '#[bg=default,fg=default,bold]#{?client_prefix,,  tmux  }#[bg=#{@tmux-bg},fg=black,bold]#{?client_prefix,  tmux  ,}'
set-option -g status-right 'benapie '
set-option -g window-status-format ' #I:#W '
set-option -g window-status-current-format '#[bg=#{@tmux-bg},fg=#000000] #I:#W#{?window_zoomed_flag, 󰊓 , }'
