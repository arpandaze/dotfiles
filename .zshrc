# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
startx
fi

if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
  source "${VIRTUAL_ENV}/bin/activate"
fi

eval "$(direnv hook zsh)"

export QT_QPA_PLATFORMTHEME="qt5ct"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/scripts:$PATH"

export EDITOR="nvim"
export VISUAL="nvim"
export TERM=xterm-256color
fpath+=~/.zfunc


#Vim mode for zsh
bindkey -v

ZSH_DISABLE_COMPFIX=true
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git sudo command-not-found z zsh-autosuggestions vi-mode poetry)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


export LC_CTYPE=UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

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
alias ga="git add"
alias gc="git commit -m"
alias gch="git checkout"
alias ls="exa"
alias la="exa -la"
alias mac="sshfs -o reconnect,ServerAliveInterval=15,ServerAliveCountMax=3 daze@mac:/Users/daze/Documents/Projects ~/MacDocuments"
alias umac="umount ~/MacDocuments"
alias yay="paru --color always"
alias du="du -h"
alias tmux="TERM=screen-256color-bce tmux"

alias tma="tmux attach -t"

tmc(){
    tmux has-session -t $1 
    if [ $? ]
    then
      command tmux new-session -d -s $1
    fi

    tmux switch -t $1
}


v(){
  if [[ $1 == "" ]]; then
    command nvim
  else
    command nvim $1
  fi
}

hey(){
    if [[ $1 == "install" ]]; then
        command sudo pacman -S ${@:2}
    fi
    if [[ $1 == "remove" ]]; then
        command sudo pacman -Rns ${@:2}
    fi
    if [[ $1 == "uninstall" ]]; then
        command sudo pacman -Rns ${@:2}
    fi
    if [[ $1 == "update" ]]; then
        command sudo pacman -Syu
        command yay -Syu
        command flatpak update
        command xmonad --recompile
        pushconf
    fi
    if [[ $1 == "list" ]]; then
        command pacman -Qe
    fi
}

act(){
  if [[ $1 == "" ]]; then
    source ./*/bin/activate
  else
    command python3 -m virtualenv $1
  fi
}

rate(){
  if [[ $1 ==  "" ]]; then
    command curl rate.sx
  else
    command curl rate.sx/{$1}
  fi
}

conf(){
    if [[ $1 == "zsh" || $1 == "z" ]]; then
        command nvim ~/.zshrc && source ~/.zshrc
    fi
    if [[ $1 == "tmux" || $1 == "z" ]]; then
        command nvim ~/.tmux.conf
    fi
    if [[ $1 == "xmobar1" || $1 == "bar1" ]]; then
        command nvim ~/.config/xmobar/xmobarrc1
    fi
    if [[ $1 == "xmobar2" || $1 == "bar2" ]]; then
        command nvim ~/.config/xmobar/xmobarrc2
    fi
    if [[ $1 == "xmonad" || $1 == "nad" ]]; then
        command nvim ~/.xmonad/xmonad.hs
    fi
    if [[ $1 == "bash" ]]; then
        command nvim ~/.bashrc
    fi
    if [[ $1 == "alacritty" || $1 == "term" ]]; then
        command nvim ~/.config/alacritty/alacritty.yml
    fi
    if [[ $1 == "vim" || $1 == "vi" || $1 == "nvim" ]]; then
        pwd=$(pwd)
        cd ~/.config/nvim && nvim ~/.config/nvim/init.lua && cd $pwd
    fi
    if [[ $1 == "ins" || $1 == "installscript" ]]; then
        command nvim ~/.config/script/install.sh
    fi
    if [[ $1 == "fm" || $1 == "vifm" ]]; then
        command nvim ~/.config/vifm/vifmrc
    fi
    if [[ $1 == "x" || $1 == "xinit" ]]; then
        command nvim ~/.xprofile
    fi
    if [[ $1 == "r" || $1 == "rofi" ]]; then
        command nvim ~/.config/rofi
    fi
    if [[ $1 == "p" || $1 == "picom" ]]; then
        command nvim ~/.config/picom.conf
    fi
}

mkmig(){
    dc exec backend alembic upgrade head
}

mig(){
    dc exec backend alembic upgrade head
    dc exec backend alembic revision --autogenerate -m $1
    dc exec backend alembic upgrade head
}


musicd()
{
    youtube-dl -i -x --audio-format m4a $1 -o '~/Music/%(title)s.m4a'
}

setopt correct
export SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r$reset_color? [Yes, No, Abort, Edit] "

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="$HOME/.poetry/bin:$PATH"

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
