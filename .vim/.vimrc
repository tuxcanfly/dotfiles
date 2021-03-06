set nocompatible
set hidden
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
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-sensible'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'sebdah/vim-delve'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'ternjs/tern_for_vim'
Plug 'w0rp/ale'
Plug 'francoiscabrol/ranger.vim'
Plug 'int3/vim-extradite'
Plug 'moll/vim-node'
Plug 'dhruvasagar/vim-table-mode'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'Chiel92/vim-autoformat'
Plug 'skwp/greplace.vim'
Plug 'andymass/vim-matchup'
Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'
Plug 'idbrii/vim-remarkjs'
Plug 'jacoborus/tender.vim'
Plug 'wellle/targets.vim'
Plug 'sodapopcan/vim-twiggy'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/gv.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'ajmwagar/vim-deus'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'haya14busa/incsearch.vim'
Plug 'Shougo/denite.nvim'
Plug 'tomlion/vim-solidity'
Plug 'jpalardy/vim-slime'
call plug#end()

syntax on
filetype plugin on
filetype plugin indent on

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
set completeopt     =noinsert,menuone,noselect
set background      =dark
set guicursor       =
set noshowmode
set termguicolors

let g:closetag_default_xml              = 1
let g:surround_{char2nr("r")}           ="_(u\r)"
let g:go_bin_path                       = expand("~/.bin")
let g:go_snippet_engine                 = "neosnippet"
let g:go_doc_keywordprg_enabled         = 0
let g:go_fmt_command                    = "goimports"
let g:tern_show_argument_hints          = "on_move"
let g:tern_map_keys                     = 1

highlight Comment cterm=italic

colorscheme base16-default-dark

if filereadable(expand("~/.vim/colorscheme.vim"))
  source ~/.vim/colorscheme.vim
endif

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

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" :terminal
tnoremap <Esc> <C-\><C-n>
tnoremap <A-[> <Esc>
tnoremap <C-v><Esc> <Esc
" Terminal mode:
tnoremap <M-h> <c-\><c-n><c-w>h
tnoremap <M-j> <c-\><c-n><c-w>j
tnoremap <M-k> <c-\><c-n><c-w>k
tnoremap <M-l> <c-\><c-n><c-w>l
" Insert mode:
inoremap <M-h> <Esc><c-w>h
inoremap <M-j> <Esc><c-w>j
inoremap <M-k> <Esc><c-w>k
inoremap <M-l> <Esc><c-w>l
" Visual mode:
vnoremap <M-h> <Esc><c-w>h
vnoremap <M-j> <Esc><c-w>j
vnoremap <M-k> <Esc><c-w>k
vnoremap <M-l> <Esc><c-w>l
" Normal mode:
nnoremap <M-h> <c-w>h
nnoremap <M-j> <c-w>j
nnoremap <M-k> <c-w>k
nnoremap <M-l> <c-w>l

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

" Denite
call denite#custom#var('file/rec', 'command', ['rg', '--hidden', '--files', '--glob', '!.git'])
"
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts', ['--smart-case', '--follow', '--hidden', '--vimgrep', '--heading'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

call denite#custom#map(
	      \ 'insert',
	      \ '<Down>',
	      \ '<denite:move_to_next_line>',
	      \ 'noremap'
	      \)
call denite#custom#map(
	      \ 'insert',
	      \ '<Up>',
	      \ '<denite:move_to_previous_line>',
	      \ 'noremap'
	      \)

" Remove date from buffer list
call denite#custom#var('buffer', 'date_format', '')

" Custom options for Denite
"   auto_resize             - Auto resize the Denite window height automatically.
"   prompt                  - Customize denite prompt
"   direction               - Specify Denite window direction as directly below current pane
"   winminheight            - Specify min height for Denite window
"   highlight_mode_insert   - Specify h1-CursorLine in insert mode
"   prompt_highlight        - Specify color of prompt
"   highlight_matched_char  - Matched characters highlight
"   highlight_matched_range - matched range highlight
let s:denite_options = {'default' : {
\ 'auto_resize': 1,
\ 'direction': 'rightbelow',
\ 'winminheight': '10',
\ 'highlight_mode_insert': 'Visual',
\ 'highlight_mode_normal': 'Visual',
\ 'prompt_highlight': 'Function',
\ 'highlight_matched_char': 'Function',
\ 'highlight_matched_range': 'Normal'
\ }}

" Loop through denite options and enable them
function! s:profile(opts) abort
  for l:fname in keys(a:opts)
    for l:dopt in keys(a:opts[l:fname])
      call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
    endfor
  endfor
endfunction

call s:profile(s:denite_options)

nmap _ :DeniteProjectDir -split=floating -winrow=1 file/rec grep:::!<CR>

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

let g:gitgutter_sign_added='┃'
let g:gitgutter_sign_modified='┃'
let g:gitgutter_sign_removed='◢'
let g:gitgutter_sign_removed_first_line='◥'
let g:gitgutter_sign_modified_removed='◢'

let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

let g:delve_new_command	 = 'new'
source ~/.vim/.lightlinerc

let g:slime_target = "tmux"
let g:slime_target = "neovim"

source ~/.vim/coc.vim
