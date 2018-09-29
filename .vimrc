call plug#begin('~/.vim/plugged')
    Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
    "Plug 'junegunn/vim-peekaboo',
    "Plug 'vimwiki/vimwiki',
    "Plug 'ervandew/supertab',
    "Plug 'ludovicchabant/vim-gutentags',
    "Plug 'xolox/vim-misc',
    "Plug 'majutsushi/tagbar'
    "Plug 'xolox/vim-easytags',
    "Plug 'tpope/vim-unimpaired',
    Plug 'jreybert/vimagit',
    Plug 'junegunn/goyo.vim', {'on': 'Goyo'}
    Plug 'junegunn/gv.vim',
    Plug 'gregsexton/gitv',

    Plug 'luochen1990/rainbow',

    " Linters
    "Plug 'scrooloose/syntastic',
    Plug 'w0rp/ale',

    Plug 'mhinz/vim-startify',
    Plug 'ntpeters/vim-better-whitespace',
    Plug 'tpope/vim-surround',

    " auto close pairs (brackets, parens, etc.)
    Plug 'raimondi/delimitmate',
    "Plug 'jiangmiao/auto-pairs',
    Plug 'tpope/vim-fugitive',
    Plug 'airblade/vim-gitgutter',
    "Plug 'kien/ctrlp.vim',
    "Plug 'junegunn/fzf.vim',
    Plug 'scrooloose/nerdcommenter',
    Plug 'bling/vim-airline',
    Plug 'vim-airline/vim-airline-themes',
    "Plug 'godlygeek/tabular',
    Plug 'tpope/vim-repeat',
    Plug 'easymotion/vim-easymotion',
    Plug 'flazz/vim-colorschemes',
    Plug 'shougo/unite.vim',
    Plug 'metakirby5/codi.vim',
    Plug 'yuttie/comfortable-motion.vim',
    Plug 'bling/vim-bufferline',
    "Plug 'sjl/gundo.vim',
    Plug 'simnalamburt/vim-mundo',
    Plug 'terryma/vim-multiple-cursors',

    Plug 'vim-scripts/a.vim',

    Plug 'kana/vim-operator-user',
    Plug 'haya14busa/vim-operator-flashy'
call plug#end()

colorscheme Tomorrow-Night

let g:rainbow_active = 0

" Flashy yank
map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$

" Enable persistent undo so that undo history persists across vim sessions
set undofile
set undodir=~/.vim/undo

" Mundo preferences
let g:mundo_right = 1
let g:mundo_width = 50

" Toggles
nnoremap <F5> :MundoToggle<CR>
map <C-o> :NERDTreeToggle<CR>

let g:airline_theme='dracula'
let g:airline_powerline_fonts = 1

syntax on
set relativenumber
set number
set ruler
set mouse+=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

set tabstop=4               " number of visual spaces per TAB
set shiftwidth=4
set softtabstop=4           " number of spaces in tab when editing
set expandtab               " tabs = spaces
set smarttab
set autoindent
set backspace=2
set backspace=indent,eol,start

set showcmd                 " show command in statusline

filetype indent on          " load filetype indent files
set wildmenu                " enable visual autocomplete in commands
set showmatch               " highlight matching breackets etc

set incsearch               " search during entry
set hlsearch                " highlight search matches

set lazyredraw              " stop all the redrawin

" <Ctrl-l> redraws the screen and removes any search highlighting.
nmap <silent> ; :nohl<CR>

" No more 'this isn't a command' bullshit anymore
":command WQ wq
":command Wq wq
":command W w
":command Q q

" Easier split pane navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <Space> @q

nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
