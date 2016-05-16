set nocompatible

filetype indent plugin on

syntax on

set hidden
set wildmenu
set showcmd

set incsearch
set hlsearch
set ignorecase
set smartcase

set backspace=indent,eol,start

set autoindent
set scrolloff=3

nmap <silent> ,ev :e $MYVIMRC<cr>
nmap <silent> ,sv :so $MYVIMRC<cr>
if has("autocmd")
   autocmd! bufwritepost .vimrc so $MYVIMRC
endif

" Status Line and height of command bar
set laststatus=2                                           " display the status line
set statusline=
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
set cmdheight=2    " the commandbar is 2 lines high

" Key mapping to toggle the display of status line for the last window
nmap <silent> ,sl :if &laststatus == 1<bar>
         \set laststatus=2<bar>
         \echo<bar>
         \else<bar>
         \set laststatus=1<bar>
         \endif<CR>

" Key mapping to toggle the virtual edit {{{3
map <silent> ,ve :if &virtualedit == 'all'<bar>
         \set virtualedit =<bar>
         \else <bar>
         \set virtualedit =all<bar>
         \endif<CR>

" Key mapping to toggle the colorcolumn at column 80 {{{3
map <silent> ,co :if &colorcolumn == ""<bar>
         \set colorcolumn=80<bar>
         \else <bar>
         \set colorcolumn=<bar>
         \endif<CR>

au FileType c setl tabstop=4 shiftwidth=4 softtabstop=4 expandtab
au FileType make, gitconfig setl ts=8 sts=8 sw=8 noet
