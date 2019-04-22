" n/VIM config file
" U 4/22/2019

" Replaced Vundle with vim-plug since vundle has been abandoned
" To install vim-plug:
" 1. Download plug.vim from github.com/junegunn/vim-plug
" 2. Place plug.vim in .vim/autoload (vim8)
" 2. Place plug.vim in appdata/local/nvim/autoload (nvim, win) 
" 2. place plug.vim in .local/share/nvim/site/autoload (nvim, linux)

" Basic settings
set nocompatible
filetype off

" vim-plug Setup
call plug#begin('~/.vim/plugged')
" To install a new plugin run :PluginInstall after putting it's info here
Plug 'vim-scripts/L9'
Plug 'whatyouhide/vim-gotham'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasr/molokai'
Plug 'chriskempson/base16-vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
" Following config thanks to Adam at:
" https://adam.garrett-harris.com/how-to-switch-from-vundle-to-vim-plug/
function! BuildYCM(info)
    if a:info.status == 'installed' || a:info.force
        !./python install.py
    endif
endfunction
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
call plug#end()
filetype plugin indent on

" NERDTree settings
autocmd VimEnter * NERDTree
map <silent> <C-n> :NERDTreeFocus<CR>

" YouCompleteMe settings
set encoding=utf-8

" Backspace fix
set backspace=2

" Color Settings
colorscheme molokai
syntax on

" Airline settings
set laststatus=2 " Allows the powerline to run whether there are tabs or not.
let g:airline_powerline_fonts = 0 " This line only works with a Powerline
let g:airline#extensions#tabline#enabled = 0 " This line creates the bufferline up top, disable for nvim gui
let g:airline#extensions#tabline#buffer_nr_show = 1 " Shows numbers in tabline
let g:airline_theme='base16' " This is the theme for airline
" set t_Co=256 "Makes everything look better

" Tab settings
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent

" Misc Settings & Custom modes

" Map escape to C-;
inoremap <C-;> <Esc>

" Makes line numbers on by default
set number

" Adds a 'Word Processor' mode for taking notes.
func! WordProcessorMode()
    setlocal smartindent
    setlocal spell spelllang=en_us
    setlocal noexpandtab
endfu
" Sets a call for the word processor mode
com! WP call WordProcessorMode()

" Folds all functions in a large text file
func! FoldAllFunctions()
    set foldmethod=syntax
endfu
" Sets a call for the function
com! F call FoldAllFunctions()

" Inserts the date
func! InsertDate()
    r!date "+\%Y-\%m-\%d"
endfu
" Makes a call
com! D call InsertDate()

" Sets the working directory 
:cd $userprofile\Documents\projects
:e vimtemp.txt
