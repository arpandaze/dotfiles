# Start X at login
if status --is-login
    if test (tty) = /dev/tty1
        exec startx -- -keeptty
    end
end

set fish_greeting
zoxide init fish | source


function fish_user_key_bindings
  fish_vi_key_bindings
end

# Paths
set -gx fish_user_paths ~/.local/scripts /opt/google-cloud-cli/bin ~/.local/bin ~/go/bin ~/.cargo/bin /home/daze/.local/opt/flutter/bin ~/.pub-cache/bin ~/.fvm/bin ~/.fluvio/bin $fish_user_paths /opt/homebrew/bin 

set -gx SUDO_EDITOR nvim
set -gx EDITOR nvim

set --universal nvm_default_version lts
set -gx GOPATH ~/go

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
alias dc="docker-compose"
alias dk="docker"
alias gs="git status"
alias lg="lazygit"
alias gch="git checkout"
alias ls="exa"
alias la="exa -la"
alias lad="lazydocker"
alias sync='osync.sh ~/.config/osync/sync.conf'
alias yay="paru --color always --bottomup"
alias du="du -h"
alias tmux="TERM=screen-256color-bce /usr/bin/tmux"
alias rm="trash"
alias space="dust -d 2"
alias tma="tmux attach -t"
alias python="python3"
alias gputop="nvtop"
alias fz="cd \$(fd --type directory | fzf)"
alias loc="tokei"

function k --wraps=kubectl
  command kubecolor --force-colors $argv 
end

function kubectl --wraps=kubectl
  command kubecolor --force-colors $argv
end

function watch --description 'modern watch'
    viddy -d --shell fish $argv[1..-1]
end

# Disable ENV prompt since it is already shown on the right side
set VIRTUAL_ENV_DISABLE_PROMPT 1
set -gx DBUS_SESSION_BUS_ADDRESS 'unix:path=/run/user/1000/bus'
set -gx LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/local/cuda/lib64
set -gx LANG en_US.UTF-8
set -Ux PYENV_ROOT $HOME/.pyenv
set -gx JAVA_HOME /opt/android-studio/jbr
set -gx _JAVA_OPTIONS '-Dawt.useSystemAAFontSettings=on'
set -gx JAVA_FONTS /usr/share/fonts/TTF

if test -z "$XDG_CURRENT_DESKTOP"
    set -Ux XDG_CURRENT_DESKTOP GNOME
end

if test -z "$QT_QPA_PLATFORMTHEME"
   set -Ux QT_QPA_PLATFORMTHEME qt5ct
end

atuin init fish | source > /dev/null 2>&1
pyenv init - | source > /dev/null 2>&1
sven export --shell fish | source > /dev/null 2>&1
