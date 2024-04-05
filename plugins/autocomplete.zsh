
zstyle ':autocomplete:*' min-input 3
zstyle ':autocomplete:*' delay 0.1  # seconds (float)

bindkey '\t' menu-select "$terminfo[kcbt]" menu-select
bindkey -M menuselect '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete

bindkey -M menuselect "$terminfo[kcub1]" .backward-char
bindkey -M menuselect "$terminfo[kcuf1]" .forward-char   

bindkey -M menuselect '^[' send-break
