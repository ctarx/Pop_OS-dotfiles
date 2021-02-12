""
""        _
"" __   _(_)_ __ ___  _ __ ___
"" \ \ / / | '_ ` _ \| '__/ __|
""  \ V /| | | | | | | | | (__
""   \_/ |_|_| |_| |_|_|  \___|
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
  Plug 'scrooloose/nerdtree'
  Plug 'ryanoasis/vim-devicons'

" Better Visual Guide
  Plug 'Yggdroot/indentLine'      " displaying thin vertical lines at each indentation level
  Plug 'ap/vim-css-color'         " Preview colors

" syntax check
  Plug 'w0rp/ale'

" Autocomplete
  Plug 'ncm2/ncm2'
  Plug 'roxma/nvim-yarp'

  Plug 'ncm2/ncm2-bufword'
  Plug 'ncm2/ncm2-path'
  Plug 'ncm2/ncm2-jedi'

" Formater
  Plug 'Chiel92/vim-autoformat'
  Plug 'preservim/nerdcommenter'  " commenting function
  Plug 'mattn/emmet-vim'          " expanding abbreviations

call plug#end()

  syntax enable
  let mapleader = ","             " Use , as leader
  filetype plugin indent on       " Alow sensing the filetype
  set background=dark             " Use dark background
  colorscheme gruvbox             " gruvbox colorscheme
  set noshowmode                  " because I use a lightline
  set clipboard=unnamedplus       " Clipboard integration
  set laststatus=2                " Always show status line
  set encoding=utf-8              " Set default encoding to UTF-8
  set autoread                    " Automatically reread changed files without asking anything
  set autoindent                  " Automatically indent new lines
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
  highlight ColorColumn ctermbg=0 guibg=lightgrey

" Tab and Indent configuration
  set tabstop=4
  set softtabstop=4
  set shiftwidth=4
  set expandtab

" more risky but cleaner
  set nobackup
  set noswapfile
  set nowritebackup


" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
  set splitbelow splitright

" NERDTree
  let NERDTreeQuitOnOpen=1
  nmap <F2> :NERDTreeToggle<CR>
  let NERDTreeShowHidden=1

" devicons
  let g:webdevicons_enable_nerdtree = 1             " adding to NERDTree
  let g:webdevicons_enable_airline_statusline = 1   " adding to vim-airline's statusline

" Shortcutting split navigation, saving a keypress:
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l

" Automatically deletes all trailing whitespace on save.
  autocmd BufWritePre * %s/\s\+$//e
  autocmd BufWritepre * %s/\n\+\%$//e

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Spell-check set to F6:
  map <F6> :setlocal spell! spelllang=en_gb<CR>

" vim-autoformat
  noremap <F3> :Autoformat<CR>

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

" NCM2
augroup NCM2
  autocmd!
  " enable ncm2 for all buffers
  autocmd BufEnter * call ncm2#enable_for_buffer()

  " :help Ncm2PopupOpen for more information
  set complete+=kspell      " look up into dictonary
  set completeopt=noinsert,menuone,noselect

  " When the <Enter> key is pressed while the popup menu is visible, it only
  " hides the menu. Use this mapping to close the menu and also start a new line.
  inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

  " Cancel the complete menu item like CTRL+e would
  inoremap <expr> <Left> (pumvisible() ? "<C-e>" : "<Left>")

  " uncomment this block if you use vimtex for LaTex
  " autocmd Filetype tex call ncm2#register_source({
  "           \ 'name': 'vimtex',
  "           \ 'priority': 8,
  "           \ 'scope': ['tex'],
  "           \ 'mark': 'tex',
  "           \ 'word_pattern': '\w+',
  "           \ 'complete_pattern': g:vimtex#re#ncm2,
  "           \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
  "           \ })
augroup END

" Ale
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['flake8']}
