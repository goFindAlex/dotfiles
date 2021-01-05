for i in $SYS_DIRS; do
  local sym=$(eval echo $"$i" | head -c 3)
  local color=$(eval echo $"$i" | tail -c 4)
  local str=$(_colorize "$color" "$sym$SYM_OFFSET")
  eval "${i[@]}[3]="\$str""
done

NAVI_B=(sed '"'); for i in $SYS_DIRS; do NAVI_B+=("s|^\${"$i"[2]}|\${"$i"[3]}|g;"); done; NAVI_B+=('"');
NAVI_A=(sed '"'); for i in $SYS_DIRS; do NAVI_A+=("s|^\${"$i"[1]}\$SYM_OFFSET|\${"$i"[2]}|g;"); done; NAVI_A+=('"');

__fzf-navi() {
  [[ $1 == 'z' ]] && { local CMD=(z -l '|' awk \'{print \$2}\'); } \
  || { local CMD=(fd -H -td --ignore-file $XDG_CONFIG_HOME/fd/root . /); }
  dest=$(eval "$CMD" | eval "$NAVI_B" | fzf +s --tac --ansi | eval "$NAVI_A")
  [[ -z $dest ]] && { zle reset-prompt; return; } || { cd $dest; zle reset-prompt; }
}

__fzf-open() {
  local ignore fd_cmd="fd -tf -H -L -c always"
  [[ $1='/' ]] && ignore=(--ignore-file ~/.config/fd/root); cd $1
  local res=$(eval $fd_cmd $ignore | fzf -m --ansi --preview="preview {}" --prompt=$2)
  [[ -n $res ]] && { _set_title $3; echo $res | xargs -ro -d '\n' $3 2>&1; _reset_title; }
  cd -; zle reset-prompt; zle-line-init;
}

__fzf-hist() {
  setopt localoptions noglobsubst noposixbuiltins pipefail no_aliases
  local selected num
  selected=($(fc -rl 1 | fzf +m))
  [[ -n "$selected" ]] && { num=$selected[1]; [[ -n "$num" ]] && zle vi-fetch-history -n $num; }
  zle reset-prompt
}

__fzf-open-menu() {
  local res=($(for i in ${(@v)USER_DIRS}; do echo $i; done | fzf --prompt="Open: " --with-nth 2,4));
  [[ -n $res ]] && { res[2]+=" "; __fzf-open $res; } || zle reset-prompt
}

__fzf-cd() { local sel=$(ls -D | fzf --ansi); [[ -n $sel ]] && cd $sel; zle reset-prompt; }
__fzf-comp-helper() { BUFFER="$BUFFER**"; zle end-of-line; fzf-completion; }
__fzf-kill() { BUFFER="kill -9 "; zle end-of-line; fzf-completion; }
__fzf-clip() { }
