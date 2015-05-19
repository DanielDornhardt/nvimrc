" my own .nvimrc.
" 
" It's time to vim again! 2015-05-20 - starting a fresh .nvimrc - using old manually configured .vimrc as base.
" When .nvimrc is edited, reload it
autocmd! bufwritepost .nvimrc source ~/.nvimrc

" New awesome ideas & tips from:
" http://amix.dk/vim/vimrc.html " With a map leader it's possible to do extra key combinations " like <leader>w saves the current file
let mapleader = ";"
let g:mapleader = ";"

"remap tag navigation
nmap <leader>z <C-]>
nmap <leader>x <C-T>

" Start pathogen plugin management
call pathogen#infect()

" Map previous buffer switching to 2xleader
nmap <leader><leader> :b#<cr>

" Map search to space key
map <space> /
map <c-space> ?

" Stamp - replace the current word or selection (in visual mode)
" with the last yanked text
nnoremap S diw"0P
vnoremap S "_d"0P

" Fast saving
nmap <leader>w :w!<cr>

" Fast editing of the .vimrc
" map <leader>e :e! ~/.vimrc<cr>
map <leader>e :vsplit! ~/.nvimrc<cr><C-w>L

" Get there in style
if ! has("gui_running")
    set t_Co=256
endif

" feel free to choose :set background=light for a different style
set background=light
"set background=dark
" colors synic_dd
" colors peaksea 
" colors torte
" colors darkspectrum
" colors denim
" colors inkpot

let solarized_contrast = "high"
"colors solarized
"colors ir_black
"colors vividchalk

" highlight current line
"set cursorline
" make it a nice grey
highlight CursorLine  term=underline  guibg=#2d2d2d  cterm=underline
"#23232C
autocmd WinEnter * setlocal cursorline
autocmd WinEnter * hi CursorLine guibg=#2d2d2d
autocmd WinLeave * setlocal nocursorline

" Get that filetype stuff happening
filetype on
filetype plugin on
filetype indent on

" Turn on that syntax highlighting
syntax on

" Wanna see line numbers!
set number

" Why is this not a default
set hidden

" Don't update the display while executing macros
set lazyredraw

" At least let yourself know what mode you're in
set showmode

" Enable enhanced command-line completion. Presumes you have compiled
" with +wildmenu.  See :help 'wildmenu'
set wildmenu
set wildmode=list:longest

filetype plugin on

" Set tab default to 4 spaces;
" ALSO overwritten by _vimrc_local.vim's from here ($HOME)
" all the way down to the current buffers' directory.
set expandtab
set tabstop=4
set shiftwidth=4

"Indentation
set ai "Auto indent
set si "Smart indet
autocmd FileType javascript,html,css,php set sw=4
autocmd FileType javascript,html,css,php set ts=4
autocmd FileType javascript,html,css,php set sts=4

au BufNewFile,BufRead *.yaml,*.yml set et ts=2 sw=2

" Set word wrapping
set nowrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0

" highlight search matches
set hlsearch

"Ignore case when searching
set ignorecase
set smartcase

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile

"Persistent undo
try
    if MySys() == "windows"
      set undodir=C:\Windows\Temp
    else
      set undodir=~/.nvim/undo
    endif

    set undofile
catch
endtry

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings by derek wyatt, http://www.derekwyatt.org/

" Move the cursor to the window left of the current one
noremap <silent> <leader>h :wincmd h<cr>

" Move the cursor to the window below the current one
noremap <silent> <leader>j :wincmd j<cr>

" Move the cursor to the window above the current one
noremap <silent> <leader>k :wincmd k<cr>

" Move the cursor to the window right of the current one
noremap <silent> <leader>l :wincmd l<cr>

" Close the window below this one
noremap <silent> <leader>cj :wincmd j<cr>:close<cr>

" Close the window above this one
noremap <silent> <leader>ck :wincmd k<cr>:close<cr>

" Close the window to the left of this one
noremap <silent> <leader>ch :wincmd h<cr>:close<cr>

" Close the window to the right of this one
noremap <silent> <leader>cl :wincmd l<cr>:close<cr>

" Close the current window
" - conflicts with NerdCommenter
"noremap <silent> ,cc :close<cr>

" Move the current window to the right of the main Vim window
noremap <silent> <leader>ml <C-W>L

" Move the current window to the top of the main Vim window
noremap <silent> <leader>mk <C-W>K

" Move the current window to the left of the main Vim window
noremap <silent> <leader>mh <C-W>H

" Move the current window to the bottom of the main Vim window
noremap <silent> <leader>mj <C-W>J

" Daniel's first custom mappings? make control + direction move 5 steps
" instead of one
noremap <silent> <C-h> 5h
vnoremap <silent> <C-j> 5j
vnoremap <silent> <C-k> 5k
noremap <silent> <C-l> 5l

nnoremap <silent> <C-j> 5j
nnoremap <silent> <C-k> 5k

"nnoremap <silent> <c-j> :call DelayedFunc("normal! jzz", 1)<cr> 
"nnoremap <silent> <c-k> :call DelayedFunc("normal! kzz", 1)<cr> 
" make ctrl+cursor keys move cursor in normal mode

inoremap <C-h> <Left>
"inoremap <C-j> <Down>
"inoremap <C-k> <Up>
inoremap <C-l> <Right>

" test: Showcmd to see what I'm actually doing
set showcmd

" Show whitespace with <leader>s!
set listchars=tab:>-,trail:~,eol:$
nmap <silent> <leader>S :set nolist!<CR>

" Remove some unneccessary prompts
set shortmess=atI

" Set the search scan to wrap around the file
set wrapscan

" Set the forward slash to be the slash of note.  Backslashes suck
" This is really only applicable to Windows but I like to have a vimrc
" that works no matter what OS I'm currently on
set shellslash

" Make command line two lines high
set ch=2

" set visual bell -- I hate that damned beeping
set vb

" Allow backspacing over indent, eol, and the start of an insert
set backspace=2

" See :help 'cpoptions' for these ones.  'cpoptions' has a huge
" set of possible options
set cpoptions=ces$


" Set the status line the way I like it
if has("statusline")
    "set stl=%f\ %{fugitive#statusline()}\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]\ %{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}
    set stl=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]\ %{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}
endif

" tell Vim to always put a status line in, even if there is only one
" window
set laststatus=2

" Hide the mouse pointer while typing
set mousehide

" The GUI (i.e. the 'g' in 'gvim') is fantastic, but let's not be
" silly about it :)  The GUI is fantastic, but it's fantastic for
" its fonts and its colours, not for its toolbar and its menus -
" those just steal screen real estate
set guioptions=acr

" This is the timeout used while waiting for user input on a
" multi-keyed macro or while just sitting and waiting for another
" key to be pressed measured in milliseconds.
"
" i.e. for the ",d" command, there is a "timeoutlen" wait
"      period between the "," key and the "d" key.  If the
"      "d" key isn't pressed before the timeout expires,
"      one of two things happens: The "," command is executed
"      if there is one (which there isn't) or the command aborts.
"
" The idea here is that if you have two commands, say ",dv" and
" ",d" that it will take 'timeoutlen' milliseconds to recognize
" that you're going for ",d" instead of ",dv"
"
" In general you should endeavour to avoid that type of
" situation because waiting 'timeoutlen' milliseconds is
" like an eternity.
" 
" set timeoutlen=500

" Too stressful for me, I want no timeout!
set notimeout

" Keep some stuff in the history
set history=700

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" When the page starts to scroll, keep the cursor 8 lines from
" the top and 8 lines from the bottom
" DD: Try keeping the cursor in the middle of the screen for now
set scrolloff=12
"set scrolloff=666

" Allow the cursor to go in to "invalid" places
set virtualedit=all

" For how *I* code these are the best types of settings for
" completion but I get rid of some neat things that you might
" like
" set complete=.,w,b,t

" Incrementally match the search.  I orignally hated this
" but someone forced me to live with it for a while and told
" me that I would grow to love it after getting used to it...
" turns out he was right :)
set incsearch

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=8192


" Make shifting indent in visual mode not removing the visual selection
vnoremap > >gv
vnoremap < <gv

" let vim automatically change its working directory to the current file at
" all times
" if exists('+autochdir')
"   set autochdir
" else
"  autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
" endif

" cd to the directory containing the file in the buffer
nmap  <leader>cd :lcd %:h<cr>:pwd<cr>

"Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>
au BufRead,BufNewFile ~/buffer iab <buffer> xh1 ===========================================

"Quickly open notes.txt
map <leader>Q :e ~/notes.txt<cr>
au BufRead,BufNewFile ~/notes.txt iab <buffer> xh1 ===========================================

" GRB: use fancy buffer closing that doesn't close the split
cnoremap <expr> bd (getcmdtype() == ':' ? 'Kwbd' : 'bd')
" Add a hotkey for that, too!
nmap <silent> <leader>c :bd<CR>

" According to some folks on the internet,
" this should make the . operator (repeat the last action)
" to return the cursor to its original position after it made
" the changes.
nmap . .'[
" ...and it does :)


" move lines with alt+dir
nnoremap <D-j> :m+<CR>==
nnoremap <D-k> :m-2<CR>==
inoremap <D-j> <Esc>:m+<CR>==gi
inoremap <D-k> <Esc>:m-2<CR>==gi
vnoremap <D-j> :m'>+<CR>gv=gv
vnoremap <D-k> :m-2<CR>gv=gv
                                               
" resize windows with Meta - left and right
nnoremap <leader>< 20<C-w><
nnoremap <leader>> 20<C-w>>
"inoremap <leader> <C-w>< 
"inoremap <leader> <C-w>> 
vnoremap <leader>< 20<C-w><
vnoremap <leader>> 20<C-w>> 

" sudo write file
com! -nargs=* Sudow w !sudo tee >/dev/null %

" open in marked
:nnoremap <leader>p :silent !open -a Marked.app '%:p'<cr>


