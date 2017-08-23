"dein Scripts-----------------------------
if &compatible
	set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=/home/docscratch/.vim/bundles/repos/github.com/Shougo/dein.vim
" Required:
call dein#begin(expand('.vim/Plugins/dein/'))

"Required:
if dein#load_state('/home/docscratch/.vim/bundles/.')
	  call dein#begin('/home/docscratch/.vim/bundles/.')

	" Let dein manage dein
	" Required:
	call dein#add('/home/docscratch/.vim/bundles/./repos/github.com/Shougo/dein.vim')

	" Add or remove your plugins here:
	"call dein#add('valloric/youcompleteme')
	call dein#add('tpope/vim-unimpaired')
    call dein#add('jreybert/vimagit')
    call dein#add('junegunn/goyo.vim')
    call dein#add('junegunn/gv.vim')
    call dein#add('mhinz/vim-startify')
    call dein#add('ntpeters/vim-better-whitespace')
    call dein#add('yuttie/comfortable-motion.vim')
	call dein#add('bling/vim-bufferline')
	call dein#add('sjl/gundo.vim')
	call dein#add('mbbill/undotree')
	call dein#add('vim-airline/vim-airline')
	call dein#add('vim-airline/vim-airline-themes')
	call dein#add('Shougo/neosnippet.vim')
	call dein#add('Shougo/neosnippet-snippets')
	"call dein#add('Shougo/deoplete.nvim')
	call dein#add('Shougo/neocomplete.vim')
	call dein#add('tpope/vim-fugitive')
    call dein#add('godlygeek/tabular')
	call dein#add('scrooloose/syntastic')
	call dein#add('tpope/vim-surround')
	call dein#add('scrooloose/nerdcommenter')
	call dein#add('scrooloose/nerdtree')
	call dein#add('Xuyuanp/nerdtree-git-plugin')
    call dein#add('airblade/vim-gitgutter')
	call dein#add('majutsushi/tagbar')
	call dein#add('airblade/vim-gitgutter')
	call dein#add('easymotion/vim-easymotion')
	call dein#add('tpope/vim-repeat')
	call dein#add('nathanaelkane/vim-indent-guides')
	call dein#add('jiangmiao/auto-pairs')
	call dein#add('terryma/vim-multiple-cursors')
	call dein#add('haya14busa/incsearch.vim')
	call dein#add('haya14busa/incsearch-easymotion.vim')
	call dein#add('shougo/unite.vim')

	" You can specify revision/branch/tag.
	" call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

	" Required:
	call dein#end()
	call dein#save_state()
endif

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

nmap <F5> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F6> :UndotreeToggle<CR>
"nnoremap <F7> :GundoToggle<CR>

map <Leader> <Plug>(easymotion-prefix)
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map z/ <Plug>(incsearch-easymotion-/)
map z? <Plug>(incsearch-easymotion-?)
map zg/ <Plug>(incsearch-easymotion-stay)
nnoremap <Leader>u :Unite -silent -start-insert buffer file file_rec<CR>


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:airline_theme='deus'
let g:airline_powerline_fonts = 1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


syntax on
set relativenumber
set number
set ruler
set mouse=a

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
:command WQ wq
:command Wq wq
:command W w
:command Q q

" Easier split pane navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


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


inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction
