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

" and a deep sha256 of the resulting package (without version control
" information) and validate it and that thing

" it works so it can stay.

" for greater consistency with evil mode, removing <space> and <c-space>
" mapping.
" also for some freaking reason c-space does not work at all in iterm or
" terminal. possible good question in there?
"
" also I need to add an org-modey thing to this vim config to improve it

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
" might be novisualbell
set visualbell
set t_vb=
set tm=500
" custom stuff sorta
set tabstop=4
set smarttab
set expandtab
set shiftwidth=4

" show last command
set showcmd

" recommendation for python et al
filetype plugin indent on
" nerdtree show hidden files
let g:NERDTreeShowHidden=1
" df key chord for insert mode,
" call arpeggio#map('i', '', 0, 'df', '<Esc>')
" jj key chord for return
" call arpeggio#map('i', '', 0, 'jk', '<cr>')
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
" that is a lie actually.
" in tmux, for whatever reason elflord does
" not have visible visual blocks at least in the 
" default xfce terminal or whatever I'm using right now
colorscheme koehler 


"for whatever reason noremap does not seem to work very well
"here
"interim colorstepper keys
nmap <F6> <Plug>ColorstepPrev
nmap <F7> <Plug>ColorstepNext
nmap <S-F7> <Plug>ColorstepReload
" include colorstepping in insert mode as well
imap <F6> <Plug>ColorstepPrev
imap <F7> <Plug>ColorstepNext
imap <S-F7> <Plug>ColorstepReload


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
noremap <leader>tn :tabnew<cr>
noremap <leader>to :tabonly<cr>
noremap <leader>tc :tabclose<cr>
noremap <leader>tm :tabmove
noremap <leader>tf :tabfirst<cr>
noremap <leader>tl :tablast<cr>
noremap <leader>o :BufExplorer<cr>
noremap <leader>qa :qa!<cr>
noremap <leader>wq :wq<cr>
noremap <leader>n :NERDTree<cr>
" collapse vertically split window
" todo uncollapse
noremap <leader>d :resize 0<cr>
" close enough to uncollapse right?
" also C-w _ uncollapses 
noremap <leader>D <c-w>_<cr>
" Shell command to scratch buffer
" note this line intentionally ends in a space
noremap <leader>s :Shell<space>
"fzf opens with no files for some reason
"map <leader>f :FZF<cr>
noremap <silent> <leader><cr> :noh<cr><esc>

" remapping space is convenient and ^space doesn't work at all.
" so my terminal sends ^@ which is nul apparently?
noremap <space> /
" note this is intended to be C-Space
" for various terminal reasons, C-2 and C-@ map to the same thing.
noremap <NUL> ?
noremap gc /
noremap gv ? 
" noremap <C-space> <esc>
" inoremap <C-space> <esc> 
" vnoremap <C-space> <esc> 
" nnoremap <C-space> <esc>
" doesn't work in / searches whatever.
noremap <c-l> <esc>
noremap! <c-l> <esc>
" escape from command-line like things
" seems not to work in macvim. oh well.
" or for fzf (work on this)
cnoremap <c-l> <c-c>
" cnoremap <C-Space> <esc>
" convenient save
nnoremap <leader>w :w!<cr>
" semicolon and color are hard to insert with remaps
" inoremap <M-j> ;
" inoremap <M-k> :

" function shell command to new buffer
ca shell Shell
" stolen from http://vim.wikia.com/wiki/Display_output_of_shell_commands_in_new_window
" uses the command alias Shell and modifies it for some reason.
function! s:ExecuteInShell(command)
  let command = join(map(split(a:command), 'expand(v:val)'))
  let winnr = bufwinnr('^' . command . '$')
  silent! execute  winnr < 0 ? 'botright new ' . fnameescape(command) : winnr . 'wincmd w'
  setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap number
  echo 'Execute ' . command . '...'
  silent! execute 'silent %!'. command
  silent! execute 'resize ' . line('$')
  silent! redraw
  silent! execute 'au BufUnload <buffer> execute bufwinnr(' . bufnr('#') . ') . ''wincmd w'''
  silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . command . ''')<CR>'
  echo 'Shell command ' . command . ' executed.'
endfunction
command! -complete=shellcmd -nargs=+ Shell call s:ExecuteInShell(<q-args>)

" shell command to new tab
" function! s:ExecuteInShellOtherWindow(command)
"    let command =
"
"    make leader key leadier
" let g:fml_all_sources=1

set cursorline

" recommendation to make c-u and c-w undoable in insert mode
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

"set the grep program
set grepprg=ag\ --vimgrep
set grepformat=%f:%l:%c:%m

" disable visual bell in gvim as well
au GuiEnter * set visualbell t_vb=
