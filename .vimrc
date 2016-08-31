" VIM config file
" U 8/30/16

" Added Packages
" git (required dependency)
" Vundle- git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim 

" Vundle Setup
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" All packages should be between vundle#begin and end.
Plugin 'VundleVim/Vundle.vim'
Plugin 'L9'
call vundle#end()
filetype plugin indent on

" Color Settings
colorscheme molokai

" Tab settings
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent

" Custom Modes

" Adds a 'Word Processor' mode for taking notes.
func! WordProcessorMode()
    setlocal smartindent
    setlocal spell spelllang=en_us
    setlocal noexpandtab
endfu
" Sets a call for the word processor mode
com! WP call WordProcessorMode()
