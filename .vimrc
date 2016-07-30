"dein Scripts-----------------------------
if &compatible
	set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=.vim/Plugins/dein//repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('.vim/Plugins/dein/'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/deoplete.nvim')
call dein#add('tpope/vim-fugitive')
call dein#add('scrooloose/syntastic')
call dein#add('tpope/vim-surround')
call dein#add('scrooloose/nerdcommenter')
call dein#add('airblade/vim-gitgutter')
call dein#add('easymotion/vim-easymotion')
call dein#add('tpope/vim-repeat')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('sjl/gundo.vim')
call dein#add('jiangmiao/auto-pairs')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('haya14busa/incsearch.vim')
call dein#add('haya14busa/incsearch-easymotion.vim')
call dein#add('shougo/unite.vim')

" You can specify revision/branch/tag.
" call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

map <Leader> <Plug>(easymotion-prefix)
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map z/ <Plug>(incsearch-easymotion-/)
map z? <Plug>(incsearch-easymotion-?)
map zg/ <Plug>(incsearch-easymotion-stay)
nnoremap <Leader>u :Unite -silent -start-insert buffer file file_rec<CR>

syntax on
set number
set ruler
set mouse=a

set tabstop=4               " number of visual spaces per TAB
set shiftwidth=4
set softtabstop=4           " number of spaces in tab when editing
"set expandtab               " tabs = spaces
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
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Inter-buffer copy and paste with ','
vmap <silent> ,y y:new<CR>:call setline(1,getregtype())<CR>o<Esc>P:wq! ~/reg.txt<CR>
nmap <silent> ,y :new<CR>:call setline(1,getregtype())<CR>o<Esc>P:wq! ~/reg.txt<CR>
map <silent> ,p :sview ~/reg.txt<CR>"zdddG:q!<CR>:call setreg('"', @", @z)<CR>p
map <silent> ,P :sview ~/reg.txt<CR>"zdddG:q!<CR>:call setreg('"', @", @z)<CR>P

nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

function! AddSubtract(char, back)
  let pattern = &nrformats =~ 'alpha' ? '[[:alpha:][:digit:]]' : '[[:digit:]]'
  call search(pattern, 'cw' . a:back)
  execute 'normal! ' . v:count1 . a:char
  silent! call repeat#set(":\<C-u>call AddSubtract('" .a:char. "', '" .a:back. "')\<CR>")
endfunction
nnoremap <silent>         <C-a> :<C-u>call AddSubtract("\<C-a>", '')<CR>
nnoremap <silent> <Leader><C-a> :<C-u>call AddSubtract("\<C-a>", 'b')<CR>
nnoremap <silent>         <C-x> :<C-u>call AddSubtract("\<C-x>", '')<CR>
nnoremap <silent> <Leader><C-x> :<C-u>call AddSubtract("\<C-x>", 'b')<CR>
