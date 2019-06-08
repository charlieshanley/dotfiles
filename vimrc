set nocompatible
filetype off

set rtp+=~/repos/dotfiles/bundle/Vundle.vim

call vundle#rc()

Plugin 'VundleVim/Vundle.Vim'

Plugin 'airblade/vim-gitgutter'
set updatetime=300

Plugin 'phaazon/gruvbox'
" set termguicolors
"set background=dark
"colorscheme gruvbox

Plugin 'neovimhaskell/haskell-vim'

" Syntax highlighting for Shakespearean templates (.hamlet, .lucius, .julius)
" Plugin 'pbrisbin/vim-syntax-shakespeare'

Plugin 'tpope/vim-commentary'

Plugin 'tpope/vim-surround'

Plugin 'vim-airline/vim-airline'
" let g:airline#extensions#ale#enabled = 1

Plugin 'scrooloose/nerdtree'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

call vundle#end()


filetype plugin indent on
syntax on
set hidden

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd
 
" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" search incrementally as you enter characters
set incsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines
set cmdheight=2

" Display line numbers on the left -- hybrid of absolute and relative numbers
set number relativenumber

" Revert to absolute numbers in insert mode and when buffer loses focus
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup end

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

" Always show at least one line above or below cursor.
set scrolloff=3

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=2
set softtabstop=2
set expandtab

autocmd Filetype hs setlocal tabstop=2

 
set colorcolumn=80

set fileformat=unix
"------------------------------------------------------------
" Packages
"
"packadd! matchit

"------------------------------------------------------------
" Mappings 
" 
" set map leader
let mapleader=" "

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$
 
" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <leader>l :nohl<CR><C-L>

" toggle nerdtree with control-n
noremap <C-n> :NERDTreeToggle<CR>

" tab completion with shift-tab
inoremap <S-Tab> <C-n>

" undo gitgutter hunk with control-u
noremap <C-u> :GitGutterUndoHunk<CR>

" move panes with Ctrl-<direction> instead of Ctrl-W + <direction>
noremap <C-h> <C-W>h
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-l> <C-W>l
 
" cancel a search with escape
"nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
" ^^ This is commented out because causes vim to start in REPLACE mode ^^

