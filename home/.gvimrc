if has("gui_running")
  "------------------------------------------------------------------------------
  " basic settings
  "
  colorscheme railscasts-pete
  set guifont=Meslo\ LG\ L\ DZ:h13
  set guioptions-=T      " remove tool bar
  set clipboard+=unnamed " yanks go to clipboard

  if has("autocmd")
    autocmd VimResized * wincmd =   " resize buffers when window is resized

    if exists("g:autosave_on_blur")
      au FocusLost * silent! wall   " autosave on blur if enabled
    endif
  endif

  if has("gui_macvim")
    macmenu &File.New\ Tab key=<D-s-t>      " remap new tab
    macmenu &File.Open\ Tab\.\.\. key=<nop>

    if exists("g:enable_mvim_shift_arrow")
      let macvim_hig_shift_movement = 1     " mvim shift-arrow-keys
    endif
  endif

  "------------------------------------------------------------------------------
  " mappings
  " https://raw.github.com/carlhuda/janus/master/janus/vim/core/before/plugin/mappings.vim
  "
  vmap <D-]> >gv
  vmap <D-[> <gv

  nmap <D-]> >>
  nmap <D-[> <<

  omap <D-]> >>
  omap <D-[> <<

  imap <D-]> <Esc>>>i
  imap <D-[> <Esc><<i

  " Map Command-# to switch tabs
  map  <D-0> 0gt
  imap <D-0> <Esc>0gt
  map  <D-1> 1gt
  imap <D-1> <Esc>1gt
  map  <D-2> 2gt
  imap <D-2> <Esc>2gt
  map  <D-3> 3gt
  imap <D-3> <Esc>3gt
  map  <D-4> 4gt
  imap <D-4> <Esc>4gt
  map  <D-5> 5gt
  imap <D-5> <Esc>5gt
  map  <D-6> 6gt
  imap <D-6> <Esc>6gt
  map  <D-7> 7gt
  imap <D-7> <Esc>7gt
  map  <D-8> 8gt
  imap <D-8> <Esc>8gt
  map  <D-9> 9gt
  imap <D-8> <Esc>9gt

  " command-t
  map <D-t> :CommandT<CR>
  imap <D-t> <ESC>:CommandT<CR>

  " unimpaired
  " Bubble single lines
  nmap <D-k> [e
  nmap <D-j> ]e

  " Bubble multiple lines
  vmap <D-Up> [egv
  vmap <D-Down> ]egv
  vmap <D-k> [egv
  vmap <D-j> ]egv

  " nerd commenter
  map <D-/> <plug>NERDCommenterToggle<CR>
  imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i
endif

