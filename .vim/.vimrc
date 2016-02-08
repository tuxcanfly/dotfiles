set nocompatible
filetype off

set runtimepath     +=~/.vim/bundle/vundle/
call vundle#begin()
""" ---- Plugins ------
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-abolish'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Chiel92/vim-autoformat'
Plugin 'skwp/greplace.vim'
call vundle#end()

syntax on
filetype plugin on
filetype plugin indent on

""" ---- Settings ----

set autoindent                                              " always set autoindenting on
set autoread
set autowriteall
set copyindent                                              " copy the previous indentation on autoindenting
set expandtab
set hidden
set hlsearch                                                " highlight search terms
set ignorecase                                              " ignore case when searching
set incsearch                                               " show search matches as you type
set number                                                  " always show line numbers
set shiftround                                              " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch                                               " set show matching parenthesis
set smartcase                                               " ignore case if search pattern is all lowercase, case-sensitive otherwise
set nobackup
set nocompatible
set noic
set noswapfile
set nowrap                                                  " don't wrap lines
set softtabstop     =4
set tabstop         =4                                      " a tab is four spaces
set backspace       =indent,eol,start                       " allow backspacing over everything in insert mode
set shiftwidth      =4                                      " number of spaces to use for autoindenting
set pastetoggle     =<F2>
set t_Co            =256
set wildmode        =full
set wildmenu
set clipboard       =unnamedplus
set path            +=templates
set laststatus      =2
set completeopt     =menu

let g:closetag_default_xml              =1
let g:surround_{char2nr("r")}           ="_(u\r)"
let g:syntastic_python_flake8_args      ='--ignore=E501,E128,E225'
let g:syntastic_mode_map                ={ 'mode': 'passive' }
let g:go_bin_path                       = expand("~/.bin")
let g:go_snippet_engine                 = "neosnippet"
let g:go_doc_keywordprg_enabled         = 0
let g:airline_theme                     ='behelit'


colorscheme behelit


autocmd     FileType            go          setlocal    noexpandtab

""" ---- Keybindings ----

map <silent><leader><Enter> o<Esc>k
nnoremap ; :

map <silent>K                           :tabnext<CR>
map <silent>J                           :tabprevious<CR>
map <leader>w                           :FixWhitespace<CR>
map <silent><leader>s                   :Gstatus<CR>
map <silent><leader>d                   :Gdiff<CR>
map <Leader>T                           :tabnew<CR>
map <leader>g                           :Ggrep <cword>
map <leader>w                           :FixWhitespace<CR>

nmap <leader><space>                    :noh<CR>
nmap <leader>fp                         :Git push<CR>
nmap <leader>fm                         :Git pull<CR>
nmap <leader>fc                         :Gread<CR>
nmap <leader>fw                         :Gwrite<CR>
nmap <C-s>                              :wa<CR>

" modify selected text using combining diacritics
command! -range -nargs=0 Overline        call s:CombineSelection(<line1>, <line2>, '0305')
command! -range -nargs=0 Underline       call s:CombineSelection(<line1>, <line2>, '0332')
command! -range -nargs=0 DoubleUnderline call s:CombineSelection(<line1>, <line2>, '0333')
command! -range -nargs=0 Strikethrough   call s:CombineSelection(<line1>, <line2>, '0336')
