# Start X at login
if status --is-interactive
  if test -z "$DISPLAY" -a $XDG_VTNR = 1
    exec startx -- -keeptty
  end
end

set fish_greeting
zoxide init fish | source

if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_user_key_bindings
  fish_vi_key_bindings
end

# Alias
alias py="python3"
alias vim="nvim"
alias vi="nvim"
alias c="clear"
alias top="htop"
alias po="poetry"
alias q="exit"
alias dc="docker-compose"
alias dk="docker"
alias gs="git status"
alias gch="git checkout"
alias ls="exa"
alias la="exa -la"
alias sync='osync.sh ~/.config/osync/sync.conf'
alias yay="paru --color always"
alias du="du -h"
alias tmux="TERM=screen-256color-bce /usr/bin/tmux"
alias rm="trash"
alias space="dust -d 2"
alias tma="tmux attach -t"

# Paths
set -U fish_user_paths ~/.local/scripts $fish_user_paths
