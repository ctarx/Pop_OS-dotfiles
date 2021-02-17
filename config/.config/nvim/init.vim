""
""  _       _ _         _
"" (_)_ __ (_) |___   _(_)_ __ ___
"" | | '_ \| | __\ \ / / | '_ ` _ \
"" | | | | | | |_ \ V /| | | | | | |
"" |_|_| |_|_|\__(_)_/ |_|_| |_| |_|
""
""
" Install vim-plug if not already installed
if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

" Plugins List
call plug#begin('~/.config/nvim/plugged')

" UI related
  Plug 'morhetz/gruvbox'
  Plug 'itchyny/lightline.vim'
  Plug 'mengelbrecht/lightline-bufferline'
  Plug 'scrooloose/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'mhinz/vim-startify'
  Plug 'ctrlpvim/ctrlp.vim'

" Better Visual Guide
  Plug 'Yggdroot/indentLine'      " displaying thin vertical lines at each indentation level
  Plug 'ap/vim-css-color'         " Preview colors
  Plug 'AndrewRadev/tagalong.vim' " automatically rename closing tags
  Plug 'tpope/vim-surround'       " surround an element with another one

" Autocomplete
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Formater
  Plug 'preservim/nerdcommenter'  " commenting function
  Plug 'mattn/emmet-vim'          " expanding abbreviations
  Plug 'alvan/vim-closetag'

  Plug 'sheerun/vim-polyglot'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if &compatible
    set nocompatible               " Be iMproved
endif

  syntax enable
  nnoremap <SPACE> <Nop>
  let mapleader = " "             " Use SPACE as leader
  filetype plugin indent on       " Alow sensing the filetype

  colorscheme gruvbox             " gruvbox colorscheme
  let g:gruvbox_contrast_dark = 'hard'
  if exists('+termguicolors')
      let &t_8f = "\<Esc>[38;2;%lu;%lum]"
      let &t_8b = "<Esc>[48;2;%lu;%lu;%lum]"
  endif
  let g:gruvbox_invert_selection='0'
  set background=dark             " Use dark background

  set noshowmode                  " because I use a lightline
  set clipboard=unnamedplus       " Clipboard integration
  set laststatus=2                " Always show status line
  set showtabline=2               " buffers in tabline lightline-bufferline
  set encoding=utf-8              " Set default encoding to UTF-8
  set autoread                    " Automatically reread changed files without asking anything
  set autoindent                  " Automatically indent new lines
  set smartindent
  set backspace=indent,eol,start  " Makes backspace key more powerful.
  set incsearch                   " Shows the match while typing
  set hlsearch                    " Highlight found searches
  set scrolloff=5                 " scroll 5 lines
  set mouse=a
  set cursorline                  " Highlit cursor line
  set guicursor=i:ver1            " enable vertical cursor when in insert mode
  set guicursor=a:blinkon1        " enable cursor blinking
  set number relativenumber       " Show relative and actual line number
  set wrap linebreak nolist
  set colorcolumn=80
  highlight Normal guibg=none
  set pumheight=10                " Makes popup menu smaller

" Tab and Indent configuration
  set tabstop=2 softtabstop=4     " Insert 2 spaces for a tab
  set shiftwidth=4
  set smarttab                    " Makes tabbing smarter will realize you have 2 vs 4
  set expandtab                   " Converts tabs to spaces

  autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
  autocmd FileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2
  autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2

" more risky but cleaner
  set nobackup
  set noswapfile
  set nowritebackup

  set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup

" Better display for messages
  set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
  set updatetime=50

" don't give |ins-completion-menu| messages.
  set shortmess+=c

" always show signcolumns
  set signcolumn=yes

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
  set splitbelow splitright

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree
  let NERDTreeQuitOnOpen=1
  nmap <F9> :NERDTreeToggle<CR>
  let NERDTreeShowHidden=1
  let g:NERDTreeWinSize = 35

" devicons
  let g:webdevicons_enable_nerdtree = 1             " adding to NERDTree
  let g:webdevicons_enable_airline_statusline = 1   " adding to vim-airline's statusline

" Shortcutting split navigation, saving a keypress:
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l

" TAB in general mode will move to text buffer
  nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
  nnoremap <S-TAB> :bprevious<CR>

" Tabs shortcuts navigation
  nnoremap <C-Left> :tabprevious<CR>
  nnoremap <C-Right> :tabnext<CR>
  nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
  nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

" Mappings to move lines
  nnoremap <A-j> :m .+1<CR>==
  nnoremap <A-k> :m .-2<CR>==
  inoremap <A-j> <Esc>:m .+1<CR>==gi
  inoremap <A-k> <Esc>:m .-2<CR>==gi
  vnoremap <A-j> :m '>+1<CR>gv=gv
  vnoremap <A-k> :m '<-2<CR>gv=gv

" Automatically deletes all trailing whitespace on save.
  autocmd BufWritePre * %s/\s\+$//e
  autocmd BufWritepre * %s/\n\+\%$//e

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Spell-check set to F6:
  map <F6> :setlocal spell! spelllang=en_gb<CR>

" NERDCommenter CTRL+/
  nmap <C-_> <Plug>NERDCommenterToggle
  vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

" Enable Emmet just for html/css
  let g:user_emmet_install_global = 0
  autocmd FileType html,css EmmetInstall
  let g:user_emmet_leader_key=','

" indentLine color and symbols
  let g:indentLine_color_term = 239
  let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" tagalong
let g:tagalong_verbose = 1

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-emmet',
  \ 'coc-json',
  \ 'coc-css',
  \ 'coc-html',
  \ 'coc-pyright'
  \ ]

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" lightline abd buffers
let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[No Name]'

let g:lightline                  = {'colorscheme': 'gruvbox'}
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
