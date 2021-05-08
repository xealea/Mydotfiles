# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="arrow"

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
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
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
plugins=(zsh-autosuggestions zsh-completions zsh-syntax-highlighting bgnotify git)

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
setopt INC_APPEND_HISTORY
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

PRIV="doas"

alias c="clear"
alias q="exit"
alias hd="hexdump -C"
alias default-apps="printf '\ec' && ~/.scripts/default-apps/launch && ~/.scripts/default-apps/launch -e"
alias pacrem="$PRIV pacman -Rcns"
alias yayupd="yay -Sy"
alias yayupg="yay -Syu"
alias emergeins="$PRIV emerge -av"
alias emergeinmask="$PRIV emerge -av --autounmask=y --autounmask-write"
alias emergepv="$PRIV emerge -pv"
alias emergeupd="$PRIV emaint -a sync"
alias emergeupg="$PRIV emerge -av --update --deep --changed-use @world"
alias emergedepc="$PRIV emerge --depclean -av"
alias emergenuse="$PRIV emerge -av --update --newuse --deep @world"
alias emergecuse="$PRIV emerge -av --update --changed-use --deep @world"
alias ecleandist="$PRIV eclean-dist --deep"
alias ecleanpkg="$PRIV eclean-pkg --deep"
alias ecleankern="$PRIV eclean-kernel -n 3"
alias rc-service="$PRIV rc-service"
alias rc-update="$PRIV rc-update"
alias pingoogle="ping 8.8.8.8"
alias trimall="$PRIV fstrim -va"
alias nanosu="$PRIV nano"
alias nvimsu="$PRIV nvim"
alias refram="$PRIV bash -c \"sync; echo 3 > /proc/sys/vm/drop_caches\""

# GPG Dialog
export GPG_TTY=$(tty)

# prompt
setopt prompt_subst  # enable command execution in prompt
[ "$SSH_CLIENT" ] && export TERM=urxvt DISPLAY=:0

topdir() {
	## display dir in top-right
	[ "$PWD" = "$HOME" ] && v='' || v=${PWD##*/}
	op=${OLDPWD##*/}

	# save cursor pos, move cursor to the top-right
	# then delete the previous contents
	# then print the new dir and restore cursor pos
	printf '%b%b%b' \
		"\033[s\033[0;9999H" \
		"\033[${#op}D\033[K" \
		"\033[999C\033[${#v}D$v\033[u"
}

# fancy prompts
command_not_found_handler() {
	printf 'not found:\033[38;05;%sm %s\033[0m\n' "$acc" "$0" >&2
	return 127
}

case $TERM in
	urxvt) acc=4  acc2=1  PROMPT=' %1~%F{%(?.4.1)} %(!.|./) %f';;
	*)     acc=16 acc2=16 PROMPT=$'%{\e[?25h\e[4 q%}%F{%(?.$acc.$acc2)} %f'
esac

export SUDO_PROMPT=$'pass ='
