"
" forces vim to source .vimrc file if it is present in working directory
set exrc
" might be security hole -> enable security option (restrict some commands)
set secure

" A plugin installation tool
" https://github.com/tpope/vim-pathogen
execute pathogen#infect()


" VUNDLE BEGIN ----------------
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

Plugin 'scrooloose/nerdtree' " https://github.com/scrooloose/nerdtree
Bundle 'Valloric/YouCompleteMe'
Plugin 'alvan/vim-closetag' " https://github.com/alvan/vim-closetag
Plugin 'Valloric/MatchTagAlways' " https://github.com/valloric/MatchTagAlways

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" VUNDLE END ----------------

" Setting the Colorscheme
set t_Co=256   " This is may or may not needed.
set background=dark
colorscheme gruvbox


" enable syntax highlighting
syntax on

" show line numbers
" disable via set nonumber
set number
set relativenumber

" show a visual line under the cursor's current line
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" display whitespaces
set listchars=tab:>-,trail:~,extends:>,precedes:<
set list

" highlight search results
set hlsearch
" highlight search result while typing
set incsearch

" default to wrapped lines broken at wohle words
:set wrap linebreak
" move in wrapped lines
" map j gj
" map k gk

" leader
:let mapleader = ","
" indent all lines and jump back to last position
:nnoremap <leader>f gg=G<C-O>
" toggle nerdtree
nmap <leader>n :NERDTreeToggle<cr>

" easier split navigation (get rid of <C-W>
" nnoremap <C-J> <C-W><C-J> " interferes with <++>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" more natural split opening
set splitbelow
set splitright

" hard-mode options
" no arrows
nnoremap <buffer> <Left> <Esc>
nnoremap <buffer> <Right> <Esc>
nnoremap <buffer> <Up> <Esc>
nnoremap <buffer> <Down> <Esc>

inoremap <buffer> <Left> <Esc>
inoremap <buffer> <Right> <Esc>
inoremap <buffer> <Up> <Esc>
inoremap <buffer> <Down> <Esc>

vnoremap <buffer> <Left> <Esc>
vnoremap <buffer> <Right> <Esc>
vnoremap <buffer> <Up> <Esc>
vnoremap <buffer> <Down> <Esc>

" define BadWhitespace before using in a match
" highlight BadWhitespace ctermbg=red guibg=darkred
" mark extra whitespace as bad, and probably color it red
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" python intendation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" html intendation
au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set expandtab |
    \ set smarttab

au BufNewFile,BufRead *.h,*.hpp,*.cpp
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |
    \ set smarttab

" Octave syntax  ----------------------------------------
augroup filetypedetect 
  au! BufRead,BufNewFile *.m,*.oct set filetype=octave 
augroup END 

" Latex stuff --------------------------------------------
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a single file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
