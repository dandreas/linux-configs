" n/VIM config file
" U 11/17/2020
" Add binding for drilling to open file in NERDTree (C-m)
" Also add NERDTree git plugin, other cosmetic NERDTree changes

" U 8/14/2020
" Add multi cursor, remap tree access to c-h, c-n is now multiselect. altered
" o macro accordingly

" Added remaping for space to insert a single char. Some minor cleanup.

" Replaced Vundle with vim-plug since vundle has been abandoned
" To install vim-plug:
" 1. Download plug.vim from github.com/junegunn/vim-plug
" 2. Place plug.vim in .vim/autoload (vim8)
" 2. Place plug.vim in appdata/local/nvim/autoload (nvim, win) 
" 2. place plug.vim in .local/share/nvim/site/autoload (nvim, linux)
" 3. if on windows, download the latest win32yank from github and paste into
" the bin directory of nvim
" 4. Install python (if windows restart, make sure it is on path)
" 5. run pip3 install pynvim
" 5.5 run pip3 install neovim
" 6. Run vim and run :PlugInstall
" 7. (nvim) run :UpdateRemotePlugins

" Basic settings
set nocompatible
filetype off

" vim-plug Setup
call plug#begin('~/.vim/plugged')
" To install a new plugin run :PlugInstall after putting it's info here
" L9 library, dependency for other vim plugins
Plug 'vim-scripts/L9'
" Gotham workspace/color/airline theme
Plug 'whatyouhide/vim-gotham'
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Molokai text theme
Plug 'tomasr/molokai'
" Base16 airline theme
Plug 'chriskempson/base16-vim'
" NerdTree file sidebar (just hit C-h)
Plug 'preservim/nerdtree'
" NerdTree Git plugin
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'
" Surround 
Plug 'tpope/vim-surround'
" Ctrl-P search utility
Plug 'ctrlpvim/ctrlp.vim'
" Wiki functionality activated with \ww
Plug 'vimwiki/vimwiki'
" Adds calendar functionality into vim?
Plug 'itchyny/calendar.vim'
" Shows the location of a mark in the line number bar
Plug 'kshenoy/vim-signature'
" Rainbow parenthesis activated with :RainbowToggle
Plug 'luochen1990/rainbow'
" Multi cursor (C-n for word select, up/down is c-up or c-down)
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" Autocomplete
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
call plug#end()
filetype plugin indent on


" Macros "
" Macro for inserting templates (MySql)
" Notes: changed jVjjp to jV/'kp and moved it to before :noh
let @i = "ggVGyjgg/call insertjV/'\);kp:noh:wk"
" Macro for inserting templates (Oracle)
" Notes: changed jVjjp to jV/'kp and moved it to before :noh
let @o = "ggVGyjgg/temp_blobnjV/'\);kp:noh:wk"
" Macro for setting up scripts, requires nerdtree. Script top and file list bottom, start in script
let @p = "gg0/v_namef'ldwjgg0ywkhpjddk:nohj"
" Copy all (like Ctrl-A Ctrl-C in anything else)
let @c = "ggVGy"
" Tab in and move down 1
let @t = "I	j"


" Plugin/neovim Settings
" Autosave and autoread
au FocusLost,WinLeave * :silent! wa
au FocusGained,BufEnter * :silent! !

" NERDTree settings
map <silent> <C-h> :NERDTreeFocus<CR>
map <silent> <C-m> :NERDTreeFind<CR>
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Autocomplete settings
" set encoding=utf-8 " YouCompleteMe conf
let g:python3_host_prog = 'python'
let g:deoplete#enable_at_startup = 1 " Deoplete conf
" let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardtrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Backspace fix
set backspace=2

" Color Settings
colorscheme molokai
set termguicolors
syntax on

" Airline settings
set laststatus=2 " Allows the powerline to run whether there are tabs or not.
let g:airline_powerline_fonts = 0 " This line only works with a Powerline
let g:airline#extensions#tabline#enabled = 0 " This line creates the bufferline up top, disable for nvim gui
let g:airline#extensions#tabline#buffer_nr_show = 1 " Shows numbers in tabline
let g:airline_theme='base16' " This is the theme for airline shortlist: raven, base16, violet
set t_Co=256 "Makes everything look better

" Tab settings
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent

" Clipboard fix (doesn't work on neovim-qt for windows as of 5/2019)
set clipboard+=unnamedplus

" Makes line numbers on by default
set number relativenumber

" Set up parenthesis highlights
let g:rainbow_active = 0

" Set up folding 
set foldmethod=indent


" Mappings
" Get rid of search highlights
map <silent> <C-;> :noh<cr>
" Map // to search for clipboard text
noremap // /<C-R>"<CR>
" Map <Space> to insert a single character
noremap <Space> a_<Esc>r
" Map ' to function as `
map ' `
" Map :WO to @p
com! WO @p


" Functions "
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

" Switches to excel
func! SwitchToPivot()
    :cd C:/Git/EDISON_Budget/
endfu
com! P call SwitchToPivot()

" Windows install stuff, comment out on linux. 
" Sets the working directory, start nerdtree on entry
" autocmd VimEnter * NERDTree
:cd $userprofile\Documents\projects
" :e ~/vimwiki/index.wiki
