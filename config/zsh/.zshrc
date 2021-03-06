setopt AUTO_CD # Change dir without typing cd
setopt CD_SILENT
setopt AUTO_PUSHD # Push dir into dir stack
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_MINUS
setopt INC_APPEND_HISTORY # Write to the history file immediately, not when the shell exits.
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS # Delete empty lines from history file
setopt HIST_IGNORE_SPACE # Ignore a record starting with a space
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt MENU_COMPLETE # Tab once to get completion directly.
setopt NONOMATCH # Enable url paste without quote
setopt PROMPT_SUBST # Enable prompt parameter expansion, command substitution and arithmetic expansion
setopt IGNORE_EOF # C-d will not exit shell
autoload -U colors && colors # Enable colors
autoload -Uz compinit
compinit -d $XDG_DATA_HOME/zsh/zcompdump-$ZSH_VERSION
zmodload zsh/complist
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors '' # Colorize completions using default `ls` colors.
_comp_options+=(globdots)		# Include hidden files.

declare -A USER_DIRS=(
  # [{order}_{name}]="{path} {symbol} {program} {description}"
  [01-conf]="/home/alex/Code/alex.files/     nvim    System"
  [02-code]="/media/HDD/Dev/                 mpv     Dev"
  [03-book]="/media/HDD/Book/                zathura Book"
  [04-note]="/home/alex/Documents/notes/     nvim    Notes"
  [05-pics]="/home/alex/Pictures/            sxiv    Pictures"
  [06-vids]="/home/alex/Video/               mpv     Video"
  [07-down]="/home/alex/Downloads/           mpv     Downloads"
)
declare -A SYS_DIRS=(
  # [{priority}_{name}]="{path} {symbol} {color}"
  [00_DATA]="/media/HDD/    220"
  [00_HOME]="/home/alex/    152"
  [01_ROOT]="/              167"
)
declare -A ZSH_HIGHLIGHT_STYLES=(
  [alias]=fg=yellow,bold
  [builtin]=fg=blue,bold
  [function]=fg=yellow,bold
  [command]=fg=blue,bold
)
ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS+=(forward-word)

for file in $(/bin/ls $ZDOTDIR); do . $ZDOTDIR/$file; done
. /usr/share/z/z.sh
. /usr/share/fzf/completion.zsh
. /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
. /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
