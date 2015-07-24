set tabstop=4
set expandtab
set shiftwidth=4
" recommendation for python et al
filetype plugin indent on
" pathogen runtime manager
execute pathogen#infect()
" keep the number column blue, tpope's stuff first.
runtime! plugin/sensible.vim
" df key chord for insert mode,
call arpeggio#map('i', '', 0, 'df', '<Esc>')
" <c-k> for insert mode
inoremap <c-k> <Esc>
" for some reason modelines are not enabled by default in my current setup
set modelines=10
"backspace bug fix
set backspace=2 " make backspace work like most other apps
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
        highlight Normal ctermbg=black ctermfg=white
        " line number column is dark blue with white text.
        highlight LineNr ctermbg=darkblue ctermfg=white
endfunction

" actually enable the cool color scheme by default
call g:StepColorExitHook()
