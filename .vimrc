set number
set t_Co=256
set encoding=utf-8
set wrap linebreak
set formatprg=par
set modelines=0
set splitbelow
set splitright
set gdefault
set hlsearch
"set t_AB=^[[48;5;%dm
"set t_AF=^[[38;5;%dm
"set scrolloff=3
"set autoindent
"set showmode
"set wildmenu
"set wildmode=list:longest
"set visualbell
"set cursorline
"set ttyfast
"set backspace=indent,eol,start
"set laststatus=2
"set relativenumber
"set undofile
colorscheme slate

let mapleader = ";"
let $MYVIMRC = '/etc/vim/vimrc.local'

call pathogen#infect()
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

map \gq ?^$\\|^\s*\(\\begin\\|\\end\\|\\label\)?1<CR>gq//-1<CR>
omap lp ?^$\\|^\s*\(\\begin\\|\\end\\|\\label\)?1<CR>//-1<CR>.<CR>

nnoremap n nzz
nnoremap j gj
nnoremap k gk
nnoremap <F1> <nop>
inoremap <F1> <nop>
vnoremap <F1> <nop>
nnoremap <silent> vv <C-w>v
nnoremap <silent> <C-1> <C-w>1
nnoremap / /\v
vnoremap / /\v
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>
nnoremap <leader>rc <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"nnoremap <silent> <F3> :YRShow<cr>
"nnoremap <silent> <F3> <ESC>:YRShow<cr>

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Visually select the text that was last edited/pasted
nmap <leader>v `[v`]

"vmap y "+y
"map p "+gp
"map P "+gP

au FocusLost * :wa

" Use Q to intelligently close a window 
" (if there are multiple windows into the same buffer)
" or kill the buffer entirely if it's the last window looking into that buffer
function! CloseWindowOrKillBuffer()
  let number_of_windows_to_this_buffer = len(filter(range(1, winnr('$')), "winbufnr(v:val) == bufnr('%')"))

  " We should never bdelete a nerd tree
  if matchstr(expand("%"), 'NERD') == 'NERD'
    wincmd c
    return
  endif

  if number_of_windows_to_this_buffer > 1
    wincmd c
  else
    bdelete
  endif
endfunction

nnoremap <silent> Q :call CloseWindowOrKillBuffer()<CR>

" " IMPORTANT: grep will sometimes skip displaying the file name if you
" " search in a single file. This will confuse Latex-Suite. Set your grep
" " program to always generate a file-name.
"set grepprg=grep\ -nH\ $*
set grepprg=ack-grep\ -H\ $*

" Settings for VimClojure
let vimclojureRoot = "/usr/share/vim/vim73/bundle/VimClojure/"
let vimclojure#HighlightBuiltins = 1
let vimclojure#HighlightContrib = 1
let vimclojure#DynamicHighlightcing = 1
let vimclojure#ParenRainbow = 1
let vimclojure#WantNailgun = 1
"let vimclojure#NailgunClient = /usr/share/vim/vim73/bundle/VimClojure/bin/ng"

" Start vimclojure nailgun server (uses screen.vim to manage lifetime)
"nmap <silent> <Leader>sc :execute "ScreenShell java -cp clojure.jar;clojure-contrib.jar;/usr/share/vim/vim73/bundle/VimClojure/lib/server-2.3.0.jar vimclojure.nailgun.NGServer 127.0.0.1" <cr>
" Start a generic Clojure repl (uses screen.vim)
"nmap <silent> <Leader>sC :execute "ScreenShell java -cp " . classpath . "\" clojure.main" <cr>

" " OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" " 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" " The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

set runtimepath+=/usr/share/lilypond/2.12.3/vim/
