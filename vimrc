" vimrc
" Asif Imran
" covariantmonkey-at-gmail-dot-com
" Last updated: Feb 15, 2013
"
" Relies on vundle
"


"--------------------------------------------------
"1. General
"--------------------------------------------------

set nocompatible          "turn of compatibility with old vi
filetype plugin indent on "enable file stuff
set shortmess+=I          "turn off the annoying intro screen
set vb t_vb=              "get rid off the goddamn beep
set t_Co=256              "bring on the 256 color goodness
set hidden                "dont abonden buffer when de-focused
set laststatus=2          "always display status line
set shiftround
set autoread              "auto reload file when it changes outside
set showbreak=↪
set splitbelow
set splitright
set fillchars=diff:⣿,vert:│
set scrolloff=8           "cursor 8 lines from top and bottom when scrolling
set virtualedit=all       "allow the cursor to go into invalid places
set history=100           "increase history buffer
set number                "show line number
set textwidth=80
set colorcolumn=          "indicate text border
set columns=100
set wildmenu
set ffs=unix
set showcmd               "show current commandline
set timeoutlen=10000      "used while waiting for input in multi-key input [ms]
set notimeout             "timeout on key codes but not mapping-->for terminal
set ttimeout
set ttimeoutlen=10
set ch=3                  "make commandline 2 lines high
set showmode              "show me the mode
set shiftwidth=2
set tabstop=4
set softtabstop=2
set smarttab
set expandtab             "convert tab into spaces, naturally!
set smartindent
set wrap                  "wrap lines
set cinkeys=0{,0},:,0#,;,!<Tab>,!^F,o,O,e   "emacs style indenting
command! -nargs=* Wrap set wrap linebreak nolist
set showmatch             "show matching close paren when typed
set matchtime=1           "how long to show matching paren in [ms]
set backspace=indent,eol,start "allow backspace over everything in insert mode
set list                  "show tab and eol characters
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set lazyredraw            "don't update display while executing macro
set incsearch             "incrementally match search
set ignorecase            "ignore case if all lower but not otherwise
set smartcase
set nobackup
set noswapfile

let mapleader=","


" Only have cursorline in current window and in normal window
augroup cline
  au!
  au WinLeave * set nocursorline
  au WinEnter * set cursorline
  au InsertEnter * set nocursorline
  au InsertLeave * set cursorline
augroup END

" Show trailing whitespace when not in insert mode
augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:⌴
    au InsertLeave * :set listchars+=trail:⌴
augroup END

" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" Delete trailing white space on save, useful for Python
" use :call DeleteTrailingWS() to call the function
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
" Remove trailing WS in python files
autocmd BufWrite *.py :call DeleteTrailingWS()


" Set up the gui cursor to look nice
set guicursor=n-v-c:block-Cursor-blinkon0
set guicursor+=ve:ver35-Cursor
set guicursor+=o:hor50-Cursor
set guicursor+=i-ci:ver25-Cursor
set guicursor+=r-cr:hor20-Cursor
set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" Keep all the key mappings here
nmap <silent> ,n :set invhls<CR>:set hls?<CR>

" Let's make it easy to edit this file (mnemonic for the key sequence is
" 'e'dit 'v'imrc)
nmap <silent> ,ev :e $MYVIMRC<cr>

" And to source this file as well (mnemonic for the key sequence is
" 's'ource 'v'imrc)
nmap <silent> ,sv :so $MYVIMRC<cr>


" cd to the directory containing the file in the buffer
nmap <silent> ,cd :lcd %:h<CR>
nmap <silent> ,md :!mkdir -p %:p:h<CR>

" Insert mode mappings
" emacs style jump to end of line
imap <C-e> <C-o>A
imap <C-a> <C-o>I


" Shortcuts for visual selections
nmap gV `[v`]


" Shortcuts to make it easier to explore wrapped lines
" These come in handy when the following settings are enabled:
"     :set linebreak wrap nolist
vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
vmap <D-0> g^
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g$
nmap <D-6> g^
nmap <D-0> g^

" Allow command line editing like emacs
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>


" Maps to make handling windows a bit easier
noremap <silent> ,h :wincmd h<CR>
noremap <silent> ,j :wincmd j<CR>
noremap <silent> ,k :wincmd k<CR>
noremap <silent> ,l :wincmd l<CR>
noremap <silent> ,sb :wincmd p<CR>
noremap <silent> <C-F9>  :vertical resize -10<CR>
noremap <silent> <C-F10> :resize +10<CR>
noremap <silent> <C-F11> :resize -10<CR>
noremap <silent> <C-F12> :vertical resize +10<CR>
noremap <silent> ,s8 :vertical resize 83<CR>
noremap <silent> ,cj :wincmd j<CR>:close<CR>
noremap <silent> ,ck :wincmd k<CR>:close<CR>
noremap <silent> ,ch :wincmd h<CR>:close<CR>
noremap <silent> ,cl :wincmd l<CR>:close<CR>
noremap <silent> ,cc :close<CR>
noremap <silent> ,cw :cclose<CR>
noremap <silent> ,ml <C-W>L
noremap <silent> ,mk <C-W>K
noremap <silent> ,mh <C-W>H
noremap <silent> ,mj <C-W>J
noremap <silent> <C-7> <C-W> >
noremap <silent> <C-8> <C-W>+
noremap <silent> <C-9> <C-W>-
noremap <silent> <C-0> <C-W> >


" Highlight all instances of the current word under the cursor
"nmap <silent> fw :setl hls<CR>:let @/="<C-r><C-w>"<CR>

" Underline the current line with '='
nmap <silent> ,ul :t.\|s/./=/g\|set nohls<cr>


" autoclose enable/disable -- Or you can use
" <C-V> ( <C-Q> or something like that
nmap <Leader>x <Plug>ToggleAutoCloseMappings



"------------------------------------------------
"2. Custimize packages
"------------------------------------------------

" Makefile Settings
" Makefiles only work if you use actual tab characters.
autocmd FileType make setlocal noet sw=8 sts=8


" C/C++
autocmd FileType cpp setlocal cindent


" Python
" The following line sets the smartindent mode for *.py files. It means that
" after typing lines which start with any of keywords in the list
" (ie. def, class, if, etc) the next line will automatically indent
" itself to the next level of indentation:
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try
autocmd BufRead *.py set smartindent cinwords+=except,finally,def,class
autocmd FileType python setlocal ts=4 tw=79 shiftwidth=4 softtabstop=4
autocmd BufWritePre *.py normal m`:%s/\s\+$//e``


