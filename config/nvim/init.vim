packadd! coc.nvim
packadd! nvim-colorizer.lua
packadd! fzf | packadd! fzf.vim
packadd! vifm.vim
packadd! tcomment_vim
packadd! vim-textobj-user
packadd! vim-textobj-quotes
packadd! vim-textobj-indent
packadd! vim-textobj-comment
packadd! vim-sneak
packadd! vim-easy-align
packadd! vim-markdown
packadd! vim-surround
packadd! vim-fugitive
packadd! vim-repeat
packadd! vim-polyglot

set hidden nobackup nowritebackup noswapfile
set smarttab expandtab shiftwidth=2 softtabstop=2
set smartindent autoindent
set linebreak nowrap " display long lines in just one line
set ignorecase smartcase " ignore case when searching but still respect capital input
set number relativenumber
set splitright splitbelow diffopt+=vertical " default diff split splits open at the bottom and right
set noshowmode noshowcmd
set scrolloff=999 " Always keep cursor in the middle when <C-d> and <C-u>
set history=10000
set path+=**
set wildmenu
set updatetime=500 " CursorHold event will respect this value
set shortmess+=ac
set timeoutlen=200 " By default timeoutlen is 1000 ms
set signcolumn=yes " Always show signcolumn
set foldmethod=indent " not as cool as syntax, but faster
set foldlevelstart=99 " start unfolded
set foldtext=alex#settings#foldtext()
set termguicolors
set lazyredraw " dont redraw screen during macro execution
set list
set fillchars=diff:∙               " BULLET OPERATOR (U+2219, UTF-8: E2 88 99)
set fillchars+=fold:·              " MIDDLE DOT (U+00B7, UTF-8: C2 B7)
set listchars+=tab:▷·              " WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7)
set fillchars+=eob:\               " suppress ~ at EndOfBuffer
set fillchars+=vert:\              " supress sign between vertical splits
