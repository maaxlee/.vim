
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"                                                                              "
"                       __   _ _ _ __ ___  _ __ ___                            "
"                       \ \ / / | '_ ` _ \| '__/ __|                           "
"                        \ V /| | | | | | | | | (__                            "
"                         \_/ |_|_| |_| |_|_|  \___|                           "
"                                                                              "
"                                                                              "
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

"let $vimhome=fnamemodify(resolve(expand("~/.vimrc")), ':p:h')
"let $vundle=$vimhome."/bundle/Vundle.vim"
set rtp+=~/.vim/bundle/Vundle.vim

" Be iMproved
set nocompatible

"=====================================================
"" Vundle settings
"=====================================================
filetype off
set rtp+=$vundle
call vundle#begin()

    Plugin 'VundleVim/Vundle.vim'               " let Vundle manage Vundle, required

    "-------------------=== Code/Project navigation ===-------------
    Plugin 'scrooloose/nerdtree'                " Project and file navigation
    Plugin 'majutsushi/tagbar'                  " Class/module browser
    Plugin 'kien/ctrlp.vim'                     " Fast transitions on project files
    Plugin 'tmhedberg/SimpylFold'               " Code folding improve

    "-------------------=== Other ===-------------------------------
    Plugin 'bling/vim-airline'                  " Lean & mean status/tnmap ,t :tabnew<CR>abline for vim
    Plugin 'vim-airline/vim-airline-themes'     " Themes for airline
    Plugin 'tpope/vim-surround'                 " Parentheses, brackets, quotes, XML tags, and more
    Plugin 'flazz/vim-colorschemes'             " Colorschemes

    "-------------------=== Python  ===-----------------------------
    Plugin 'davidhalter/jedi-vim'               " Jedi-vim autocomplete plugin
    Plugin 'scrooloose/syntastic'               " Syntax checking plugin for Vim
    Plugin 'mfukar/robotframework-vim'          " Robotframework support
    Plugin 'airblade/vim-gitgutter'             " Shows diff for Git
    Plugin 'jmcantrell/vim-virtualenv'          " Virtualenv support
    Plugin 'hdima/python-syntax'                " Better python syntax highlight

    " misc
    Plugin 'mileszs/ack.vim'                    " Grep find throug the project
    " Plugin 'ervandew/supertab'                  " Use TAB for autocomplete fo jedi-vim
    Plugin 'tomtom/tcomment_vim'                " Comment/uncomment by block
    Plugin 'jiangmiao/auto-pairs'               " Double qutes/braces etc
    Plugin 'szw/vim-tags'                       " Automaticially generate ctags on file save

call vundle#end()                           " required
filetype on
filetype plugin on
filetype plugin indent on

"=====================================================
"" General settings
"=====================================================
syntax enable                               " syntax highlight
let python_highlight_all=1

"set t_Co=256                                " set 256 colors
" below is to allow 24bit colours
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif
"colorscheme wombat256mod                    " set color scheme
"
" https://github.com/joshdick/onedark.vim
colorscheme onedark                    " set color scheme

"colorscheme molokai                         " set color scheme


set number                                  " show line numbers
set relativenumber             " Show relative line numbers"
set ruler
set ttyfast                                 " terminal acceleration
set hidden                                  " switch to other buffer without saving

set tabstop=4                               " 4 whitespaces for tabs visual presentation
set shiftwidth=4                            " shift lines by 4 spaces
set smarttab                                " set tabs for a shifttabs logic
set expandtab                               " expand tabs into spaces
set autoindent                              " indent when moving to the next line while writing code
set ignorecase                              " Ignore case when searching

set cursorline                              " shows line under the cursor's line
set showmatch                               " shows matching part of bracket pairs (), [], {}

set enc=utf-8	                            " utf-8 by default

set nobackup 	                            " no backup files
set nowritebackup                           " only in case you don't want a backup file while editing
set noswapfile 	                            " no swap files

set backspace=indent,eol,start              " backspace removes all (indents, EOLs, start) What is start?

set scrolloff=10                            " let 10 lines before/after cursor during scroll

set clipboard=unnamed                       " use system clipboard
set mouse=a                                 " add mouse support

"=====================================================
"" Tabs / Buffers settings
"=====================================================
tab sball
set switchbuf=useopen
set laststatus=2
" nmap <F9> :bprev<CR>
" nmap <F10> :bnext<CR>
nmap <silent> <leader>q :SyntasticCheck # <CR> :bp <BAR> bd #<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

vnoremap <Leader>s :sort<CR> " Sort selecter rows by alphovite

" better move blocks of code
vnoremap < <gv 
vnoremap > >gv 

"" Search settings
"=====================================================
set incsearch	                            " incremental search
set hlsearch	                            " highlight search results
nnoremap <F3> :set hlsearch!<CR>

"=====================================================
"" AirLine settings
"=====================================================
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline_powerline_fonts=1

"=====================================================
"" TagBar settings
"=====================================================
let g:tagbar_autofocus=0
let g:tagbar_width=32
nmap <F6> :TagbarToggle<CR>
" autocmd BufEnter *.py :call tagbar#autoopen(0)
autocmd BufWinLeave *.py :TagbarClose

"=====================================================
"" NERDTree settings
"=====================================================
let NERDTreeIgnore=['\.pyc$', '\.pyo$']     " Ignore files in NERDTree
let NERDTreeWinSize=40
autocmd VimEnter * if !argc() | NERDTree | endif  " Load NERDTree only if vim is run without arguments
nmap <F5> :NERDTreeToggle<CR>

"=====================================================
"" SnipMate settings
"=====================================================
" let g:snippets_dir='~/.vim/vim-snippets/snippets'
" snippets remap
" imap <C-Tab> <Plug>snipMateNextOrTrigger
" smap <C-Tab> <Plug>snipMateNextOrTrigger


"=====================================================
"" CtrlP settings
"=====================================================
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|pyc|html|log|txt)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_root_markers = ['.p4ignore', '.gitignore']
"=====================================================
"" Riv.vim settings
"=====================================================
"let g:riv_disable_folding=1

"=====================================================
"" Python settings
"=====================================================
"
" Enable folding
set foldmethod=indent
set foldlevel=99
autocmd FileType python nnoremap <buffer> <F2> :exec '!python' shellescape(@%, 1)<cr>

" Preview docstring when folded
let g:SimpylFold_docstring_preview=1

" omnicomplete
set completeopt-=preview                    " remove omnicompletion dropdown

" virtualenv settings
let g:virtualenv_directory = '~/venv'

" python executables for different plugins
let g:syntastic_python_python_exec='python3'
let g:jedi#force_py_version=3

" supertab to work with Jedi-vim autocomletion
" autocmd FileType python let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
" let g:SuperTabDefaultCompletionType = "context"

" highlight 'long' lines (>= 80 symbols) in python files
" augroup vimrc_autocmds
"     autocmd!
"     autocmd FileType python,rst highlight Excess ctermbg=DarkGrey guibg=Black
"     autocmd FileType python,rst match Excess /\%79v.*/
"     autocmd FileType python,rst set nowrap
" augroup END

" Highlight self in python
augroup python_syntax_extra
  autocmd!
  autocmd! Syntax python :syn keyword Keyword self
augroup END

" jedi-vim
let g:jedi#popup_select_first=0             " Disable choose first option on autocomplete
let g:jedi#show_call_signatures=1           " Show call signatures
let g:jedi#popup_on_dot=1                   " Enable autocomplete on dot
let g:jedi#use_splits_not_buffers = "top"

" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_signs=1
let g:syntastic_check_on_wq=0
let g:syntastic_aggregate_errors=1
let g:syntastic_loc_list_height=5
let g:syntastic_error_symbol='X'
let g:syntastic_style_error_symbol='X'
let g:syntastic_warning_symbol='x'
let g:syntastic_style_warning_symbol='x'
let g:syntastic_python_checkers=['flake8', 'pydocstyle', 'python']


"  ACK search options
noremap <Leader>a :Ack! <cword><cr>

" close buffer on C-x
nmap <C-x> :bd<CR>

"  Tab switch
nmap <F9> :tabp<CR>
nmap <F10> :tabn<CR>
nmap <C-F9> :bp<CR>
nmap <C-F10> :bn<CR>
"nmap <C-c> :q<CR>

" <F7> Копировать в буфер обмена иксов
vmap <F7> "+y
" " <F8> Вставить из буфера обмена иксов<
vmap <F8> "+p
nmap <F8> "+p
imap <F8> <Esc>"+pi"

