" Glorious Mostly Stolen Vim Config
" This vim config is cobbled together from a bunch of different sources
" The following behavior is weird.
" space now searches forward, ctrl-space used to search backwards
" now ctrl-k searches backwards (because you don't use it for anything in
" normal mode)
" ctrl-space is escape now because it is easy ergonomically and I don't have
" to deal with remapping capslock (or a Truly Ergonomic Keyboard caps lock is
" just as inconvenient as escape anyway)
" I could go through and patch ctrl-p so as to honor ctrl-space as the exiting
" command, but then I would have to fork it and bother to keep it synced with
" the upstream, also ctrl-c quits it anyway so that's kind of nice (almost
" like a command line tool!)
" The setup script is written in (appallingly poor) ruby because that is
" enabled by default in the version of vim that OS X ships with for some
" reason.
" That is not the desired end state. Eventually I will write a package
" gatherer thing (like pip? sort of?) in perl that can take a number of urls
" and a deep sha256 of the resulting package (without version control
" information) and validate it and that thing
" will completely replace the stupid ruby setup script. for the moment though
" it works so it can stay.

" pathogen runtime manager
execute pathogen#infect()
" run sensible stuff first
" keep the number column blue, tpope's stuff first.
runtime! plugin/sensible.vim
" try to get ctrl-p to honor <C-space> as escape
" runtime! plugin/ctrlp.vim 
" extended with useful tips from http://amix.dk/vim/vimrc.html
" make vim remember more history or something
set history=700
" reload file when it's changed underneath you
set autoread
" set comma to leader key
let mapleader=","
let g:mapleader=","
"set backup directory to .backup, current folder, or tmp
"depending on what is writeable
set backupdir=./.backup,.,/tmp
set directory=.,./.backup,/tmp
"show more of file as you move cursor
set so=7
" show position on line
set ruler
" height of command bar
set cmdheight=2
" hide buffer when abandoned
set hid
" backspace change from ultimate vim config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
"ignore case while searching
set ignorecase
" be smart about case stuff
set smartcase
" highlight search results
set hlsearch
" incremental search!
set incsearch
" no redraw while executing macros
set lazyredraw
" lots of regex magic
set magic
" highlight matching brackets
set showmatch
" tenths of second to blink while showing matching bracket
set mat=2
" misc config stuff for bells
set noerrorbells
set novisualbell
set t_vb=
set tm=500
" custom stuff sorta
set tabstop=4
set smarttab
set expandtab
set shiftwidth=4
" recommendation for python et al
filetype plugin indent on
" nerdtree show hidden files
let g:NERDTreeShowHidden=1
" df key chord for insert mode,
call arpeggio#map('i', '', 0, 'df', '<Esc>')
" jj key chord for return
call arpeggio#map('i', '', 0, 'jk', '<cr>')
" <c-k> for insert mode
" inoremap <c-k> <Esc>
" for some reason modelines are not enabled by default in my current setup
set modelines=10
"backspace bug fix
"set backspace=2 " make backspace work like most other apps
" default tab stop
set tabstop=4
"use system clipboard by default
set clipboard^=unnamed "adds unnamed to existing values
" syntax highlighting
syntax on
" that menu thing?
set wildmenu
" line numbers
set number
" code folding sux
set nofoldenable
" elflord is an excellent default color scheme
colorscheme elflord
"interim colorstepper keys
nmap <F6> <Plug>ColorstepPrev
nmap <F7> <Plug>ColorstepNext
nmap <S-F7> <Plug>ColorstepReload
" in order to keep cool stuff like the column number blue, you gotta
" define an exit hook for vim-colorstepper (which I patched)
function! g:StepColorExitHook()
        " white text on a black background
        " highlight Normal ctermbg=black ctermfg=white
        " line number column is dark blue with white text.
        highlight LineNr ctermbg=darkblue ctermfg=white
endfunction
" define a way of modifying the colorscheme so as to apply the 
" blue column
function! g:ColumnBlue()
        " white text on a black background
        highlight Normal ctermbg=black ctermfg=white
        " line number column is dark blue with white text.
        highlight LineNr ctermbg=darkblue ctermfg=white
endfunction
" actually enable the cool color scheme by default
call g:StepColorExitHook()
" keymaps
" leader key section
" some leader keys are invisibly set in nerdcommenter
" but they all begin with <leader>c .
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>o :BufExplorer<cr>
map <leader>qa :qa!<cr>
map <leader>n :NERDTree<cr>
map <silent> <leader><cr> :noh<cr><esc>
map <space> /
map <C-space> ?
" noremap <C-space> <esc>
" inoremap <C-space> <esc> 
" vnoremap <C-space> <esc> 
" nnoremap <C-space> <esc>
" doesn't work in / searches whatever.
noremap <c-l> <esc>
noremap! <c-l> <esc>
" escape from command-line like things
cnoremap <c-l> <c-c>
" cnoremap <c-space> <esc>
" convenient save
nmap <leader>w :w!<cr>
