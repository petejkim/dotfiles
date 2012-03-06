"==============================================================================
" Vundle
"
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
"------------------------------------------------------------------------------

Bundle 'gmarik/vundle'

Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/nerdtree'
"Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'mileszs/ack.vim'
Bundle 'wincent/Command-T'
Bundle 'fholgado/minibufexpl.vim'

Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'ervandew/supertab'
Bundle 'vim-scripts/ZoomWin'
Bundle 'vim-scripts/Rename2'

"Bundle 'sjl/gundo.vim'
"Bundle 'garbas/vim-snipmate'
"Bundle 'honza/snipmate-snippets'

Bundle 'nathanaelkane/vim-indent-guides'

" languages

Bundle 'tpope/vim-git'

Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'skwp/vim-rspec'
Bundle 'tpope/vim-cucumber'

Bundle 'pangloss/vim-javascript'
Bundle 'mmalecki/vim-node.js'
Bundle 'kchmck/vim-coffee-script'
Bundle 'nono/jquery.vim'
Bundle 'briancollins/vim-jst'

Bundle 'othree/html5.vim'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'ap/vim-css-color'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'groenewege/vim-less'
Bundle 'wavded/vim-stylus'
Bundle 'tpope/vim-haml'
Bundle 'digitaltoad/vim-jade'
Bundle 'nono/vim-handlebars'
Bundle 'tpope/vim-liquid'

Bundle 'msanders/cocoa.vim'
"Bundle 'Rip-Rip/clang_complete'

"Bundle 'github.com/ajf/puppet-vim'
Bundle 'bdd/vim-scala'
"Bundle 'vim-scripts/Arduino-syntax-file'

Bundle 'tpope/vim-markdown'
Bundle 'timcharper/textile.vim'

Bundle 'vim-scripts/csv.vim'

"------------------------------------------------------------------------------
filetype plugin indent on
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

"------------------------------------------------------------------------------
" basic
"
set number
set ruler          " show line and column number
syntax enable
set encoding=utf-8
set visualbell     " shut vim up
set noerrorbells
set nobackup
"set mouse=a

"------------------------------------------------------------------------------
" editing
"
"set showmatch      " Show matching brackets
"set matchtime=5    " bracket blinking
set showcmd        " show incomplete commands in lower right hand corner
set hidden         " current buffer can be put to the background without writing to disk

"------------------------------------------------------------------------------
" whitespaces
"
set nowrap       " don't wrap lines
set textwidth=0
set tabstop=2    " a tab is two spaces
set shiftwidth=2 " autoindent is two spaces
set expandtab    " use spaces, not tabs
set smarttab     " smarter tab levels
set backspace=indent,eol,start " backspace through everything

set list
set listchars=""          " reset listchars
set listchars=tab:‣\      " display tabs with a sign
set listchars+=trail:·    " display trailing whitespaces with a dot
set listchars+=extends:»  " right wrap
set listchars+=precedes:« " left wrap

"------------------------------------------------------------------------------
" searching
"
set hlsearch   " highlight searches
set incsearch  " incremental searching
set ignorecase " searches are case insensitive
set smartcase  " unless there is one capital letter

"------------------------------------------------------------------------------
" wild
"
set wildmode=longest,list
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*,*/vendor/bundle/*
set wildignore+=*.swp,*~,._*

"------------------------------------------------------------------------------
" backup & swap
"
set backupdir=~/.vim/_backup// " backup
set directory=~/.vim/_temp//   " swap

"------------------------------------------------------------------------------
" filetypes
" https://raw.github.com/carlhuda/janus/master/janus/vim/core/before/plugin/filetypes.vim
"
function! s:setupWrapping()
  set wrap
  set linebreak
  set textwidth=72
  set nolist
endfunction

filetype plugin indent on " Turn on filetype plugins (:help filetype-plugin)

if has("autocmd")
  " In Makefiles, use real tabs, not tabs expanded to spaces
  au FileType make set noexpandtab

  " make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
  au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

  " Remember last location in file, but not for commit messages.
  " see :help last-position-jump
  au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif

  au BufNewFile,BufRead *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown | call s:setupWrapping()
  au BufNewFile,BufRead *.json set ft=javascript
  au BufNewFile,BufRead Podfile,*.podspec set filetype=ruby
  au BufNewFile,BufRead *.hamlc set filetype=haml
endif

"------------------------------------------------------------------------------
" status line
" https://raw.github.com/carlhuda/janus/master/janus/vim/core/before/plugin/statuline.vim
"
if has("statusline") && !&cp
  set laststatus=2  " always show the status bar

  " Without setting this, ZoomWin restores windows in a way that causes
  " equalalways behavior to be triggered the next time CommandT is used.
  " This is likely a bludgeon to solve some other issue, but it works
  set noequalalways

  " Start the status line
  set statusline=%f\ %m\ %r

  " fugitive
  set statusline+=%{fugitive#statusline()}

  " syntastic
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  " Finish the statusline
  set statusline+=Line:%l/%L[%p%%]
  set statusline+=Col:%v
  set statusline+=Buf:#%n
  set statusline+=[%b][0x%B]
endif

"------------------------------------------------------------------------------
" other settings
"
"
" https://github.com/carlhuda/janus/blob/master/janus/vim/tools/janus/after/plugin/syntastic.vim
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=0
let g:syntastic_auto_loc_list=2

let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.rbo$', '\.class$', '\.o', '\~$']
let g:nerdtree_tabs_open_on_gui_startup = 0

if has("autocmd")
  autocmd VimEnter * silent! lcd %:p:h
endif

"------------------------------------------------------------------------------
" mappings
" https://raw.github.com/carlhuda/janus/master/janus/vim/core/before/plugin/mappings.vim
"
let mapleader=","

map <C-c> <ESC>

map <leader>] :tabn<CR>
map <leader>[ :tabp<CR>

nmap <leader>; :bp<CR>
nmap <leader>' :bn<CR>

" much more natural cursor movement when wrapping lines are present
map j gj
map k gk
map <Down> gj
map <Up> gk

" Toggle hlsearch
nmap <leader>. :set hlsearch! hlsearch?<cr>

" use :w!! to write to a file using sudo if you forgot to 'sudo vim file'
cmap w!! %!sudo tee > /dev/null %

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" upper/lower first char of word
nmap <leader>U mQgewvU`Q
nmap <leader>L mQgewvu`Q

" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>

" Create the directory containing the file in the buffer
nmap <silent> <leader>md :!mkdir -p %:p:h<CR>

" Some helpers to edit mode
" http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Swap two words
nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" Underline the current line with '='
nmap <silent> <leader>ul :t.\|s/./=/g\|:nohls<cr>

" set text wrapping toggles
nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" Adjust viewports to the same size
map <Leader>= <C-w>=

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" Insert the current directory into a command-line path
cmap <C-P> <C-R>=expand("%:p:h") . "/"<CR>

" command-t
map <C-t> :CommandT<CR>
imap <C-t> <ESC>:CommandT<CR>
let CommandTMaxHeight=10

" fugitive
nmap <leader>gb :Gblame<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gl :Glog<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Git push<CR>

" unimpaired
" Bubble single lines
nmap <C-k> [e
nmap <C-j> ]e

" Bubble multiple lines
vmap <C-k> [egv
vmap <C-j> ]egv

" nerd tree
map <leader>n :NERDTreeToggle<CR>

" nerd commenter
map <leader>/ <plug>NERDCommenterToggle<CR>

