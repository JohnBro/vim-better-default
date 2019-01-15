" default.vim - Better vim than the default
" Maintainer:   Liu-Cheng Xu <https://github.com/liuchengxu>
" Version:      1.0
" vim: et ts=2 sts=2 sw=2

scriptencoding utf-8

if &compatible || exists('g:loaded_vim_better_default')
   finish
endif
let g:loaded_vim_better_default = 1

let s:save_cpo = &cpo
set cpo&vim

" Identify platform {
let s:os         = {}
let s:os.mac     = has('macunix')
let s:os.linux   = has('unix') && !has('macunix') && !has('win32unix')
let s:os.windows = has('win32')
" }

" Neovim has set these as default
if !has('nvim')

  set nocompatible

  syntax on                      " Syntax highlighting
  filetype plugin indent on      " Automatically detect file types
  set autoindent                 " Indent at the same level of the previous line
  set autoread                   " Automatically read a file changed outside of vim
  set backspace=indent,eol,start " Backspace for dummies
  set complete-=i                " Exclude files completion
  set display=lastline           " Show as much as possible of the last line
  set encoding=utf-8             " Set default encoding
  set history=10000              " Maximum history record
  set hlsearch                   " Highlight search terms
  set incsearch                  " Find as you type search
  set laststatus=2               " Always show status line
  set mouse=a                    " Automatically enable mouse usage
  set smarttab                   " Smart tab
  set ttyfast                    " Faster redrawing
  set viminfo+=!                 " Viminfo include !
  set wildmenu                   " Show list instead of just completing

  set ttymouse=xterm2

endif

set complete+=k       " Include dictionary complection
set completeopt=menuone,longest,preview
set shortmess=atOI    " No help Uganda information, and overwrite read messages to avoid PRESS ENTER prompts
set ignorecase        " Case insensitive search
set smartcase         " ... but case sensitive when uc present
set scrolljump=5      " Line to scroll when cursor leaves screen
set scrolloff=5       " Minumum lines to keep above and below cursor
set nowrap            " Do not wrap long lines
set shiftwidth=4      " Use indents of 4 spaces
set tabstop=4         " An indentation every four columns
set softtabstop=4     " Let backspace delete indent
set splitright        " Puts new vsplit windows to the right of the current
set splitbelow        " Puts new split windows to the bottom of the current
set autowrite         " Automatically write a file when leaving a modified buffer
set mousehide         " Hide the mouse cursor while typing
set hidden            " Allow buffer switching without saving
set t_Co=256          " Use 256 colors
set ruler             " Show the ruler
set showcmd           " Show partial commands in status line and Selected characters/lines in visual mode
set showmode          " Show current mode in command-line
set showmatch         " Show matching brackets/parentthesis
set matchtime=5       " Show matching time
set report=0          " Always report changed lines
set linespace=0       " No extra spaces between rows
set pumheight=20      " Avoid the pop up menu occupying the whole screen
set timeoutlen=250    " Change timeout to 250ms
set ttimeoutlen=1000  " Change toggle timeout to 1000ms
set updatetime=1000   " Change default updatetime
set sessionoptions+=localoptions,winpos,resize

if !exists('g:vim_better_default_tabs_as_spaces') || g:vim_better_default_tabs_as_spaces
  set expandtab    " Tabs are spaces, not tabs
end

" http://stackoverflow.com/questions/6427650/vim-in-tmux-background-color-changes-when-paging/15095377#15095377
set t_ut=

set winminheight=0
set wildmode=list:longest,full

set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶

set whichwrap+=<,>,h,l  " Allow backspace and cursor keys to cross line boundaries

set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

set wildignore+=*swp,*.class,*.pyc,*.png,*.jpg,*.gif,*.zip
set wildignore+=*/tmp/*,*.o,*.obj,*.so     " Unix
set wildignore+=*\\tmp\\*,*.exe            " Windows

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv
" Treat long lines as break lines (useful when moving around in them)
nmap j gj
nmap k gk
vmap j gj
vmap k gk
nnoremap n nzz
nnoremap N Nzz
nnoremap G Gzz
nnoremap { {zz
nnoremap } }zz

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W w !sudo tee % > /dev/null

" Change cursor shape for iTerm2 on macOS {
  " bar in Insert mode
  " inside iTerm2
  if $TERM_PROGRAM =~# 'iTerm'
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_SR = "\<Esc>]50;CursorShape=2\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif

  " inside tmux
  if exists('$TMUX') && $TERM != 'xterm-kitty'
    if $TERM != 'screen-256color' && $TERM != 'xterm-256color'
      set term=xterm-256color      "Fix for Ctrl key abnormal in tmux
    endif
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  endif

  " inside neovim
  if has('nvim')
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=2
  endif
" }

if get(g:, 'vim_better_default_minimum', 0)
  finish
endif

if get(g:, 'vim_better_default_backup_on', 0)
  set backup
else
  set nobackup
  set noswapfile
  set nowritebackup
endif

if get(g:, 'vim_better_default_enable_folding', 1)
  set foldenable
  set foldmarker={,}
  set foldlevel=0
  set foldmethod=marker
  " set foldcolumn=3
  set foldlevelstart=99
endif

set background=dark         " Assume dark background
set cursorline              " Highlight current line
set fileformats=unix,dos,mac        " Use Unix as the standard file type
set number                  " Line numbers on
set relativenumber          " Relative numbers on
set fillchars=vert:│,stl:\ ,stlnc:\ 

" Annoying temporary files
set directory=/tmp//,.
set backupdir=/tmp//,.
if v:version >= 703
  set undodir=/tmp//,.
endif

highlight clear SignColumn  " SignColumn should match background
" highlight clear LineNr      " Current line number row will have same background color in relative mode

if has('unnamedplus')
  set clipboard=unnamedplus,unnamed
else
  set clipboard+=unnamed
endif

if get(g:, 'vim_better_default_persistent_undo', 0)
  if has('persistent_undo')
    set undofile             " Persistent undo
    set undolevels=1000      " Maximum number of changes that can be undone
    set undoreload=10000     " Maximum number lines to save for undo on a buffer reload
  endif
endif

if has('gui_running')
  if s:os.windows
    source $VIMRUNTIME\mswin.vim
    source $VIMRUNTIME\delmenu.vim
    behave mswin
    set winaltkeys=no
  else
    if filereadable("/etc/vim/gvimrc.local")
      source /etc/vim/gvimrc.local
    endif
  endif
  set guioptions-=r        " Hide the right scrollbar
  set guioptions-=L        " Hide the left scrollbar
  set guioptions-=T
  set guioptions-=e
  set guioptions-=b
  set guioptions-=m
  set shortmess+=c
  " No annoying sound on errors
  set noerrorbells
  set novisualbell
  set visualbell t_vb=
endif

" Key (re)Mappings {

  if get(g:, 'vim_better_default_key_mapping', 1)

    " Basic {
      if get(g:, 'vim_better_default_basic_key_mapping', 1)
        " jk,<C-j> | escaping
        inoremap jk <Esc>
        cnoremap jk <C-c>
        inoremap <C-j> <Esc>
        cnoremap <C-j> <Esc>
        " Quit visual mode
        vnoremap v <Esc>
        " Quit normal mode
        " Move to the start of line
        nnoremap H ^
        vnoremap H ^
        " Move to the end of line
        nnoremap L $
        vnoremap L $
        " Redo
        nnoremap U <C-r>

        nnoremap <silent> <Leader>q  :call default#smart_quit()<CR>
        nnoremap <Leader>Q  :qa!<CR>
        " Move half page faster
        nnoremap <Leader>d  <C-d>
        nnoremap <Leader>u  <C-u>
        " Insert mode shortcut
        inoremap <C-h> <Bs>
        inoremap <C-j> <Esc>
        inoremap <C-k> <Up>
        inoremap <C-b> <Left>
        inoremap <C-f> <Right>
        inoremap <C-l> <Delete>
        inoremap <C-s> <C-o>:update<CR>
        inoremap <C-u> <Esc>viwU<Esc>
        " Normal mode shortcut
        nnoremap <C-h> <C-W>h
        nnoremap <C-j> <C-W>j
        nnoremap <C-k> <C-W>k
        nnoremap <C-l> <C-W>l
        nnoremap <C-a> ggVG
        nnoremap <C-s> :update<CR>
        nnoremap <C-Down> ddp
        nnoremap <C-Up>   ddkP
        " Visul mode shortcut
        vnoremap <C-a> <C-C>ggVG
        vnoremap <C-s> <C-c>:update<CR>
        " Termial mode shortcut
        if has('nvim') || has('terminal')
          tnoremap <C-j> <C-W>j
          tnoremap <C-k> <C-W>k
          tnoremap <C-h> <C-W>h
          tnoremap <C-l> <C-W>l
        endif
        " Bash like
        inoremap <C-a> <Home>
        inoremap <C-e> <End>
        inoremap <C-d> <Delete>
        inoremap <C-u> <Esc>viwU<Esc>$a
        " Command mode shortcut
        cnoremap <C-h> <BS>
        cnoremap <C-j> <Down>
        cnoremap <C-k> <Up>
        cnoremap <C-b> <Left>
        cnoremap <C-f> <Right>
        cnoremap <C-l> <Delete>
        cnoremap <C-a> <Home>
        cnoremap <C-e> <End>
        " Quick command mode
        nnoremap <CR> :
        " In the quickfix window, <CR> is used to jump to the error under the
        " cursor, so undefine the mapping there.
        autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
        " Yank to the end of line
        nnoremap Y y$
        " Auto indent pasted text
        nnoremap p p=`]<C-o>
        " Open shell in vim
        if has('nvim') || has('terminal')
          map <Leader>' :terminal<CR>
        else
          map <Leader>' :shell<CR>
        endif
        if has('gui_running')
          nnoremap <M-j>              :resize +5<cr>
          nnoremap <M-k>              :resize -5<cr>
          nnoremap <M-h>              :vertical resize -5<cr>
          nnoremap <M-l>              :vertical resize +5<cr>
        endif

        " Search result highlight countermand
        nnoremap <Leader>sc :nohlsearch<CR>
        " Toggle pastemode
        nnoremap <Leader>tp :setlocal paste!<CR>
      endif
    " }

    " Buffer {
      if get(g:, 'vim_better_default_buffer_key_mapping', 1)
        nnoremap <Leader>bp :bprevious<CR>
        nnoremap <Leader>bn :bnext<CR>
        nnoremap <Leader>bf :bfirst<CR>
        nnoremap <Leader>bl :blast<CR>
        nnoremap <Leader>bd :bd<CR>
        nnoremap <Leader>bk :bw<CR>

        for s:i in range(1, 9)
          " <Leader>b[1-9] move to buffer [1-9]
          execute 'nnoremap <Leader>b' . s:i . ' :b' . s:i . '<CR>'
        endfor
        unlet s:i
      endif
    " }
    " Tab {
      if get(g:, 'vim_better_default_tab_key_mapping', 1)
        " Use <Tab>,S-<Tab> to change tab
        nnoremap <Tab> :tabnext<CR>
        vnoremap <Tab> :tabnext<cr>
        nnoremap <S-Tab> :tabprevious<CR>
        vnoremap <S-Tab> :tabprevious<CR>
        " tab-add
        nnoremap <leader>Ta :tabnew<CR>
        vnoremap <leader>Ta :tabnew<CR>
        " tab-close
        nnoremap <leader>Tc :tabclose<CR>
        vnoremap <leader>Tc :tabclose<CR>
        " tab-find
        nnoremap <leader>Tf :tabfind<CR>
        vnoremap <leader>Tf :tabfind<CR>
        " tab-list
        nnoremap <leader>Tl :tabs<CR>
        vnoremap <leader>Tl :tabs<CR>
        " tab-next
        nnoremap <leader>Tn :tabnext<CR>
        vnoremap <leader>Tn :tabnext<CR>
        " tab-previous
        nnoremap <leader>Tp :tabprevious<CR>
        vnoremap <leader>Tp :tabprevious<CR>
        for s:i in range(1, 9)
          " <Leader><Tab>[1-9] move to tab [1-9]
          execute 'nnoremap <Leader>T' . s:i . ' ' . s:i . 'gt'
        endfor
        unlet s:i
      endif
    " }

    " Arrow key remapping {
    if get(g:, 'vim_better_default_arrow_key_mapping', 1)
      " remap down-up to switch tab
      " remap <- -> to switch buffer
      nnoremap <Left>  :bprevious<CR>
      vnoremap <Left>  :bprevious<CR>
      nnoremap <Right> :bnext<CR>
      vnoremap <Right> :bnext<CR>
      nnoremap <Up>    :tabprevious<CR>
      vnoremap <Up>    :tabprevious<CR>
      nnoremap <Down>  :tabnext<CR>
      vnoremap <Down>  :tabnext<CR>
    endif
    " }

    " File {
      if get(g:, 'vim_better_default_file_key_mapping', 1)
        " File save
        nnoremap <Leader>fs :update<CR>
      endif
    " }

    " Fold {
      if get(g:, 'vim_better_default_fold_key_mapping', 1)
        nnoremap <Leader>f0 :set foldlevel=0<CR>
        nnoremap <Leader>f1 :set foldlevel=1<CR>
        nnoremap <Leader>f2 :set foldlevel=2<CR>
        nnoremap <Leader>f3 :set foldlevel=3<CR>
        nnoremap <Leader>f4 :set foldlevel=4<CR>
        nnoremap <Leader>f5 :set foldlevel=5<CR>
        nnoremap <Leader>f6 :set foldlevel=6<CR>
        nnoremap <Leader>f7 :set foldlevel=7<CR>
        nnoremap <Leader>f8 :set foldlevel=8<CR>
        nnoremap <Leader>f9 :set foldlevel=9<CR>
      endif
    " }

    " Window {
      if get(g:, 'vim_better_default_window_key_mapping', 1)
        nnoremap <Leader>ww <C-W>w
        nnoremap <Leader>wr <C-W>r
        nnoremap <Leader>wd <C-W>c
        nnoremap <Leader>wq <C-W>q
        nnoremap <Leader>wj <C-W>j
        nnoremap <Leader>wk <C-W>k
        nnoremap <Leader>wh <C-W>h
        nnoremap <Leader>wl <C-W>l
        if has('nvim') || has('terminal')
          tnoremap <Leader>wj <C-W>j
          tnoremap <Leader>wk <C-W>k
          tnoremap <Leader>wh <C-W>h
          tnoremap <Leader>wl <C-W>l
        endif
        nnoremap <Leader>wH <C-W>10<
        nnoremap <Leader>wL <C-W>10>
        nnoremap <Leader>wJ :resize +10<CR>
        nnoremap <Leader>wK :resize -6<CR>
        nnoremap <Leader>w= <C-W>=
        nnoremap <Leader>ws <C-W>s
        nnoremap <Leader>w- <C-W>s
        nnoremap <Leader>wv <C-W>v
        nnoremap <Leader>w\| <C-W>v
        nnoremap <Leader>w2 <C-W>v
      endif
    " }
    " String operator shortcup {
      if get(g:, 'vim_better_default_operator_key_mapping', 0)
        " Use cp or dp to delete content in parenthesis
        onoremap p i()
      endif
    " }

  endif

" }

let &cpo = s:save_cpo
unlet s:save_cpo
