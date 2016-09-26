" VIM config file
" U 9/11/2016

" Added Packages
" git (required dependency)
" Vundle- git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim 

" Vundle Setup
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" All packages should be between vundle#begin and end.
" To install a new plugin run :PluginInstall after putting it's info here
Plugin 'VundleVim/Vundle.vim'
Plugin 'L9'
Plugin 'whatyouhide/vim-gotham'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Bundle 'tomasr/molokai'
Plugin 'chriskempson/base16-vim'
call vundle#end()
filetype plugin indent on

" Color Settings
colorscheme molokai
syntax on

" Airline settings
set laststatus=2 " Allows the powerline to run whether there are tabs or not.
let g:airline_powerline_fonts = 1 " This line only works with a Powerline
let g:airline#extensions#tabline#enabled = 1 " This line creates the bufferline up top
let g:airline_theme='base16' " This is the theme for airline
set t_Co=256 "Makes everything look better

" Tab settings
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent

" Misc Settings & Custom modes

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
