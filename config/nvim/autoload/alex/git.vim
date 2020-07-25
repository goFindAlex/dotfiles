function! alex#git#cd(path) abort
   let dir = fnamemodify(a:path, ':p:h')
   if !empty(&buftype) || !isdirectory(dir)
     return
   else
     let root = finddir('.git', dir .';')
     if !empty(root) | execute 'tcd' fnameescape(fnamemodify(root, ':h')) | endif
   endif
endfunction

function! alex#git#isGitRepo() abort
  silent! execute('!git rev-parse --is-inside-work-tree &>/dev/null')
  return v:shell_error 
endfunction