syntax on
set number
set ruler
set mouse=a

set tabstop=4               " number of visual spaces per TAB
set shiftwidth=4
set softtabstop=4           " number of spaces in tab when editing
set expandtab               " tabs = spaces
set smarttab
set autoindent

set showcmd                 " show command in statusline

filetype indent on          " load filetype indent files
set wildmenu                " enable visual autocomplete in commands
set showmatch               " highlight matching breackets etc

set incsearch               " search during entry
set hlsearch                " highlight search matches

set lazyredraw              " stop all the redrawin

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>
