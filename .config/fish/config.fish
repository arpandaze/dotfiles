# Start X at login
# if status --is-interactive
#   if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
#     exec startx -- -keeptty
#   end
# end

if status --is-login
    if test (tty) = /dev/tty1
        exec startx -- -keeptty # or start sway or whatever
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

# Paths
set -gx fish_user_paths $PYENV_ROOT/bin ~/.local/scripts ~/.local/bin ~/go/bin ~/.cargo/bin /opt/flutter/bin $fish_user_paths /opt/homebrew/bin 
set -gx SUDO_EDITOR nvim
set -gx GOPATH ~/go

pyenv init - | source

# Alias
alias gcc="/usr/bin/gcc"
alias g++="/usr/bin/g++"
alias py="python3"
alias vim="nvim"
alias vi="nvim"
alias c="clear"
alias top="htop"
alias po="poetry"
alias q="exit"
alias docker="podman"
alias dc="docker-compose"
alias dk="podman"
alias gs="git status"
alias gch="git checkout"
alias ls="exa"
alias la="exa -la"
alias sync='osync.sh ~/.config/osync/sync.conf'
# alias yay="paru --color always"
alias du="du -h"
alias tmux="TERM=screen-256color-bce /usr/bin/tmux"
alias rm="trash"
alias space="dust -d 2"
alias tma="tmux attach -t"
alias python="python3"
alias gputop="nvtop"
alias flutter-run="flutter run --pid-file /tmp/flutter.pid"


# Disable ENV prompt since it is already shown on the right side
set VIRTUAL_ENV_DISABLE_PROMPT 1
set -gx DBUS_SESSION_BUS_ADDRESS 'unix:path=/run/user/1000/bus'
set -gx LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/local/cuda/lib64
set -gx LANG en_US.UTF-8
set -Ux PYENV_ROOT $HOME/.pyenv

if test -z "$XDG_CURRENT_DESKTOP"
    set -Ux XDG_CURRENT_DESKTOP GNOME
end

if test -z "$QT_QPA_PLATFORMTHEME"
   set -Ux QT_QPA_PLATFORMTHEME qt5ct
end
