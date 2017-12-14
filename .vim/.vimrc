set nocompatible
filetype off

call plug#begin()
""" ---- Plugins ------
Plug 'jamessan/vim-gnupg'
Plug 'edkolev/tmuxline.vim'
Plug 'fatih/vim-go'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'carlitux/deoplete-ternjs'
Plug 'sebdah/vim-delve'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-sensible'
Plug 'ternjs/tern_for_vim'
Plug 'w0rp/ale'
Plug 'int3/vim-extradite'
Plug 'moll/vim-node'
Plug 'dhruvasagar/vim-table-mode'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'Chiel92/vim-autoformat'
Plug 'skwp/greplace.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
call plug#end()

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
set background      =dark

let g:closetag_default_xml              =1
let g:surround_{char2nr("r")}           ="_(u\r)"
let g:go_bin_path                       = expand("~/.bin")
let g:go_snippet_engine                 = "neosnippet"
let g:go_doc_keywordprg_enabled         = 0
let g:go_fmt_command                    = "goimports"

colorscheme gruvbox

autocmd     FileType            go          setlocal    noexpandtab
autocmd     FileType            go          nmap <F9>   F9:GoCoverageToggle     -short<cr>
autocmd     FileType            go          nmap <F12>  <Plug>(go-def)

""" ---- Keybindings ----

map <silent><leader><Enter> o<Esc>k
nnoremap ; :

map <silent>K                           :tabnext<CR>
map <silent>J                           :tabprevious<CR>
map <silent><leader>s                   :Gstatus<CR>
map <silent><leader>d                   :Gdiff<CR>
map <Leader>T                           :tabnew<CR>
map <leader>g                           :Ggrep <cword>

nmap <leader><space>                    :noh<CR>
nmap <leader>fp                         :Git push<CR>
nmap <leader>fm                         :Git pull<CR>
nmap <leader>fc                         :Gread<CR>
nmap <leader>fw                         :Gwrite<CR>
nmap <C-s>                              :wa<CR>
nmap <C-p>                              :FZF<CR>

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" modify selected text using combining diacritics
command! -range -nargs=0 Overline        call s:CombineSelection(<line1>, <line2>, '0305')
command! -range -nargs=0 Underline       call s:CombineSelection(<line1>, <line2>, '0332')
command! -range -nargs=0 DoubleUnderline call s:CombineSelection(<line1>, <line2>, '0333')
command! -range -nargs=0 Strikethrough   call s:CombineSelection(<line1>, <line2>, '0336')

function! s:CombineSelection(line1, line2, cp)
    execute 'let char = "\u'.a:cp.'"'
    execute a:line1.','.a:line2.'s/\%V[^[:cntrl:]]\%V/&'.char.'/ge'
endfunction

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1
let g:go_auto_type_info = 1
let g:go_snippet_engine = "neosnippet"

let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

let g:deoplete#enable_at_startup = 1
let g:delve_new_command	 = 'new'
