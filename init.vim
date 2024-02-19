call plug#begin('~/.config/nvim/plugged')
    "
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'L3MON4D3/LuaSnip'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'ray-x/lsp_signature.nvim'

    "-------------------=== Code/Project navigation ===-------------
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'wookayin/fzf-ripgrep.vim'
    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'

    "-------------------=== Languages ===-------------------------------
    Plug 'mfukar/robotframework-vim'          " Robotframework support
    " Plug 'hdima/python-syntax'                " Better python sysntax highlight
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    "-------------------=== Other ===-------------------------------
    Plug 'bling/vim-airline'                  " Lean & mean status/tnmap ,t :tabnew<CR>abline for vim
    Plug 'vim-airline/vim-airline-themes'     " Themes for airline
    Plug 'tpope/vim-surround'                 " Parentheses, brackets, quotes, XML tags, and more
    Plug 'rakr/vim-one'
    Plug 'airblade/vim-gitgutter'             " Shows diff for Git
    Plug 'tpope/vim-fugitive'                 " Git support
    Plug 'liuchengxu/vista.vim'               " View and search LSP symbols, tags in Vim/NeoVim.

    " misc
    Plug 'tomtom/tcomment_vim'                " Comment/uncomment by block
    Plug 'jiangmiao/auto-pairs'               " Double qutes/braces etc
    Plug 'voldikss/vim-floaterm'
    Plug 'ojroques/vim-oscyank', {'branch': 'main'}  " Plugin to copy anywhere (ssh)

    " colorschemes
    Plug 'tomasr/molokai'
    Plug 'navarasu/onedark.nvim'

    call plug#end()

filetype on
filetype plugin on
filetype plugin indent on
syntax enable                               " syntax highlight

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
" colorscheme one  " set color scheme
colorscheme onedark   " set color scheme

set termguicolors
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


" Add nvim-lsp specific settings in lua format
lua require('lspsettings')

"=====================================================
"" Tabs / Buffers settings
"=====================================================
tab sball
set switchbuf=useopen
set laststatus=2
" nmap <F9> :bprev<CR>
" nmap <F10> :bnext<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

vnoremap <leader>s :sort<CR> " Sort selecter rows by alphovite

" remove trailing whitespaces
autocmd BufWritePre * %s/\s\+$//e
" better move blocks of code
vnoremap < <gv
vnoremap > >gv

"" Search settings
set incsearch	                            " incremental search
set hlsearch	                            " highlight search results
nnoremap <F3> :set hlsearch!<CR>

" Neovim terminal
" set splitbelow
" nnoremap <leader>t :10split term://zsh<CR>
" tnoremap <Esc> <C-\><C-n>

"=====================================================
"" AirLine settings
"=====================================================
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline_powerline_fonts=1
let g:airline#extensions#coc#enabled = 1

function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, 'E' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, 'W' . info['warning'])
  endif
  return join(msgs, ' ') . ' ' . get(g:, 'coc_status', '')
endfunction


"=====================================================
"" Searcg (fzf and Ack)
"=====================================================
" Map FZF to ctrl p
noremap <silent> <C-p> :FZF<CR>
noremap <silent> <C-b> :Buffers<CR>

"Get Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" close buffer on C-x
nmap <C-x> :bd!<CR>

"  Tab switch
if has('gui_running')
    nmap <F9> :bp<CR>
    nmap <F10> :bn<CR>
else
    nmap <F9> :bprevious<CR>
    nmap <F10> :bnext<CR>
endif

" <F7> Копировать в буфер обмена иксов
" vmap <F7> "+y
vnoremap <F7> :OSCYankVisual<CR>
" " <F8> Вставить из буфера обмена иксов<
vmap <F8> "+p
nmap <F8> "+p
imap <F8> <Esc>"+pi"

" Highlight self in python
" augroup python_syntax_extra
"   autocmd!
"   autocmd! Syntax python :syn keyword Keyword self
" augroup END

"=====================================================
"" Floaterm terminal
"=====================================================
let g:floaterm_keymap_toggle = '<leader>t'
let g:floaterm_autoclose=1
let g:floaterm_autoinsert=1

"=====================================================
"" Gitgutter
"=====================================================
nnoremap <leader>hp :GitGutterPreviewHunk<CR>
nnoremap <leader>hn :GitGutterNextHunk<CR>

"=====================================================
"" Vimgo
"=====================================================
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 0
let g:go_fmt_command = "goimports"
let g:go_def_mapping_enabled = 0


autocmd FileType go nmap <leader>rr  <Plug>(go-referrers)
autocmd FileType go nmap <space>m <Plug>(go-metalinter)
autocmd FileType go nmap <leader>rt  <Plug>(go-test-func)

" NERDTree settings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <space>e :NERDTreeToggle<CR>

"=====================================================
"" Vista sympols navigation
"=====================================================
let g:vista_default_executive = 'nvim_lsp'
" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 0

nmap <space>vv :Vista nvim_lsp<CR>
