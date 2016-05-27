"
" File Name   : .vimrc
" Author      : Ravindra Apte
" Description : Vim Configuration
"
set nocompatible

filetype indent plugin on

syntax on

set hidden
set lazyredraw
set timeoutlen=500
set showmode

if has("wildmenu")
    set wildmenu
    set wildmode=longest,list
    " Ignore stuff (for TAB autocompletion)
    set wildignore+=*.a,*.o,*.obj,*.exe
    set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
    set wildignore+=.DS_Store,.git,.hg,.svn
    set wildignore+=*~,*.swp,*.tmp
endif

set backspace=indent,eol,start

set scrolloff=3

set autoindent
set cpoptions+=$
set cryptmethod=blowfish2 " set the crypt method

"------------------------------------------------------------------------------
" Search options {{{1
set incsearch      " search as you type
set hlsearch       " highlight search results
set wrapscan       " searches wrap around the end of the file
set ignorecase     " ignore case when searching
set smartcase      " ignore the 'ignorecase' option if the search pattern
                   "contains upper case characters

" Search the current file for what's currently in the search register and display matches
nmap <silent> ,gs
         \ :vimgrep /<C-r>// %<CR>:ccl<CR>:cwin<CR><C-W>J:set nohls<CR>

" Search the current file for the word under the cursor and display matches
nmap <silent> ,gw
         \ :vimgrep /<C-r><C-w>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:set nohls<CR>

" Search the current file for the WORD under the cursor and display matches
nmap <silent> ,gW
         \ :vimgrep /<C-r><C-a>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:set nohls<CR>

"------------------------------------------------------------------------------
" Edit and source vim {{{1
nmap <silent> ,ev :e $MYVIMRC<cr>
nmap <silent> ,sv :so $MYVIMRC<cr>
if has("autocmd")
   autocmd! bufwritepost .vimrc so $MYVIMRC
endif

"------------------------------------------------------------------------------
" Status Line and height of command bar {{{1
set laststatus=2                                           " display the status line
set statusline+=%f\                                        " filename
set statusline+=%h%m%r%w                                   " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}]               " file type
set statusline+=\[%{&ff}]                                  " file format
                                                           " file encoding with bomb option
set statusline+=\%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}
"set statusline+=\[%{strlen(&fenc)?&fenc:&enc}]            " file encoding
"set statusline+=\[%{(&bomb?\",BOM\":\"\")}]               " file encoding for bomb
                                                           " show last modified timestamp
set statusline+=\ Time:\[%{strftime(\"%H:%M:%S\ %d/%m/%Y\",getftime(expand(\"%:p\")))}]
set statusline+=%=                                         " right align remainder
set statusline+=\ Buf:\[%-3.3n\]                           " buffer number
set statusline+=\ Line:[%-7(%l/%L\ \|\ %p%%]\ Col:[%c%V%)] " line-position-character
set statusline+=\ Hex:[0x%-8B]                             " character value
set statusline+=\ Position:[%<%P]                          " file position
set cmdheight=2                                            " the commandbar is 2 lines high

"------------------------------------------------------------------------------
" Key mapping to toggle the display of status line for the last window {{{1
nmap <silent> ,sl :if &laststatus == 1<bar>
         \set laststatus=2<bar>
         \echo<bar>
         \else<bar>
         \set laststatus=1<bar>
         \endif<CR>

"------------------------------------------------------------------------------
" Key mapping to toggle the virtual edit {{{1
map <silent> ,ve :if &virtualedit == 'all'<bar>
         \set virtualedit =<bar>
         \else <bar>
         \set virtualedit =all<bar>
         \endif<CR>

"------------------------------------------------------------------------------
" Key mapping to toggle the colorcolumn at column 80 {{{1
map <silent> ,co :if &colorcolumn == ""<bar>
         \set colorcolumn=80<bar>
         \else <bar>
         \set colorcolumn=<bar>
         \endif<CR>

"------------------------------------------------------------------------------
" toggle unprintable characters {{{1
set listchars=tab:>-,trail:·,eol:$
nmap <silent> ,le :setlocal list!<cr>

"------------------------------------------------------------------------------
" auto commands {{{1
au FileType c setl tabstop=4 shiftwidth=4 softtabstop=4 expandtab
au FileType make, gitconfig setl ts=8 sts=8 sw=8 noet

"------------------------------------------------------------------------------
" Mode Line {{{1
" vim: fdm=marker ts=8 nowrap
