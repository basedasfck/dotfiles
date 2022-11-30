call plug#begin('~/.local/share/nvim/site/autoload/')
Plug 'cocopon/iceberg.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'yggdroot/indentline'
call plug#end()

filetype plugin indent on
syntax on

" Appearance
colorscheme iceberg
set cursorline
set mouse=a
set noshowmode
set number
set relativenumber
set ruler
set showmatch
set termguicolors
set title
set showtabline=2

" Data
set clipboard+=unnamedplus
set nobackup
set noswapfile
set nowritebackup

" Searching
set hlsearch
set ignorecase
set incsearch
set smartcase

" Tab control
set autoindent
set expandtab
set shiftround
set shiftwidth=4
set smarttab
set softtabstop=4
set tabstop=4

" vim-airline
let g:airline_theme = 'term'
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_z = '%2p%% → %2l/%#__accent_bold#%L'

" fzf
let g:fzf_layout = { 'down': '50%' }
nnoremap <C-b> :Buffers<CR>
nnoremap <C-f> :Files<CR>
nnoremap <C-g> :GFiles<CR>
nnoremap <C-r> :Rg<CR>

" NERDTree
let g:NERDTreeShowHidden = 1
nnoremap <C-t> :NERDTreeToggle<CR>

" vim-hexokinase
let g:Hexokinase_highlighters = ['backgroundfull']

" indentLine
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '.'
let g:indentLine_color_gui = '#1b365d'
