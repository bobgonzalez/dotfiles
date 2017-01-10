syntax enable
set noswapfile 
set paste
nnoremap s :w<cr>
nnoremap - ddp
nnoremap <c-d> dd
inoremap <c-d> <esc>ddi
inoremap <c-p> <esc>pi
inoremap <c-y> <esc>Yi
vnoremap \ U 
nnoremap H 0
nnoremap L $
set tabstop=2				"visual spaces per tab
set softtabstop=2			"number of spaces in tab when editing
set expandtab				"tabs are spaces
set number					"line numbers
set relativenumber
set numberwidth=8
set showcmd					"show cmd in bottom bar
set cursorline				"cursorline
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)
"filetype indent on	"siletype-specific indentation
set wildmenu				"visual autocomplete
set lazyredraw				"redraw when needed
set showmatch				"matching [{()}]
set incsearch				"incremental search = as you type
set hlsearch				"highlight matches
let mapleader = "," 
let maplocalleader = "\\"
"edit vimrc in vertical split
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
"source recently edited vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
set history=700
set ignorecase
set ai						"auto indent
set si						"SMART INDENT
set wrap
"Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>ss :setlocal spell!<cr>
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
map <leader>cd :cd %:p:h<cr>:pwd<cr
set vb t_vb=				"turn off bells
inoremap jk <Esc>				"jk to enter normal mode
"echom "(>^.^<)" 
iabbrev ***   ************************************************************
iabbrev //*   //**********************************************************
iabbrev ___   ____________________________________________________________
iabbrev //_   //__________________________________________________________
let g:gundo_prefer_python3 = 1

set nocompatible              " be iMproved, required
filetype off 
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
"Plugin 'rip-rip/clang_complete'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'mattn/emmet-vim'	" emmet for html abbreviation expanding
Plugin 'sjl/gundo.vim'		" GUNDO undo visualizer using <F5>
Plugin 'scrooloose/syntastic' " syntax checker
Plugin 'Raimondi/delimitMate' " bracket matcher
Plugin 'scrooloose/nerdtree'  "NERD Tree
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set laststatus=2
if !has('gui_running')
	  set t_Co=256
endif

nnoremap <C-g> :GundoToggle<CR>
map <C-n> :NERDTreeToggle<CR>

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" Enables relative numbers.
function! EnableRelativeNumbers()
  set number
  set relativenumber
 endfunc

" Disables relative numbers.
function! DisableRelativeNumbers()
  set number
  set norelativenumber
endfunc

" NumberToggle toggles between relative and absolute line numbers
function! NumberToggle()
  if(&relativenumber == 1)
    call DisableRelativeNumbers()
    let g:relativemode = 0
  else
    call EnableRelativeNumbers()
    let g:relativemode = 1
  endif
endfunc
noremap <C-r>: call NumberToggle<cr>
