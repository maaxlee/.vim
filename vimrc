call plug#begin('~/.vim/plugged')
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
    "-------------------=== Code/Project navigation ===-------------
    Plug 'scrooloose/nerdtree'                " Project and file navigation
    " Plug 'kien/ctrlp.vim'                     " Fast transitions on project files
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

    "-------------------=== Other ===-------------------------------
    Plug 'bling/vim-airline'                  " Lean & mean status/tnmap ,t :tabnew<CR>abline for vim
    Plug 'vim-airline/vim-airline-themes'     " Themes for airline
    Plug 'tpope/vim-surround'                 " Parentheses, brackets, quotes, XML tags, and more
    Plug 'rakr/vim-one'
    Plug 'hdima/python-syntax'                " Better python sysntax highlight


    Plug 'mfukar/robotframework-vim'          " Robotframework support
    Plug 'airblade/vim-gitgutter'             " Shows diff for Git
    Plug 'tpope/vim-fugitive'                 " Git support

    " misc
    Plug 'mileszs/ack.vim'                    " Grep find throug the project
    Plug 'tomtom/tcomment_vim'                " Comment/uncomment by block
    Plug 'jiangmiao/auto-pairs'               " Double qutes/braces etc
    Plug 'jeetsukumaran/vim-buffergator'      " Navigating between buffers
    " Plug 'fatih/vim-go'

call plug#end()

filetype on
filetype plugin on
filetype plugin indent on
syntax enable                               " syntax highlight

if (empty($TMUX))
   if (has("nvim"))
     "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
     let $NVIM_TUI_ENABLE_TRUE_COLOR=1
   endif
   if (has("termguicolors"))
       set termguicolors
   endif
endif

if has('gui_running')
    set background=dark
    colorscheme solarized                    " set color scheme
    set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12
else
    " colorscheme onedark                    " set color scheme
    set background=dark
    colorscheme one  " set color scheme
endif

" remove toolbars from gvim
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar

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

" remove trailing whitespaces
autocmd BufWritePre * %s/\s\+$//e
" better move blocks of code
vnoremap < <gv
vnoremap > >gv

"" Search settings
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
"" NERDTree settings
"=====================================================
let NERDTreeIgnore=['\.pyc$', '\.pyo$']     " Ignore files in NERDTree
let NERDTreeWinSize=40
autocmd VimEnter * if !argc() | NERDTree | endif  " Load NERDTree only if vim is run without arguments
nmap <F5> :NERDTreeToggle<CR>


"=====================================================
"" Searcg (fzf and Ack)
"=====================================================
" Map FZF to ctrl p
noremap <silent> <C-p> :FZF<CR>
"  ACK search options
noremap <Leader>a :Ack! <cword><cr>

" close buffer on C-x
nmap <C-x> :bd<CR>

"  Tab switch
if has('gui_running')
    nmap <F9> :bp<CR>
    nmap <F10> :bn<CR>
else
    nmap <F9> :bprevious<CR>
    nmap <F10> :bnext<CR>
endif

" <F7> Копировать в буфер обмена иксов
vmap <F7> "+y
" " <F8> Вставить из буфера обмена иксов<
vmap <F8> "+p
nmap <F8> "+p
imap <F8> <Esc>"+pi"

" Bufferigator
let g:buffergator_suppress_keymaps=1
nnoremap <silent> <s-tab> :BuffergatorOpen<CR>

" Highlight self in python
augroup python_syntax_extra
  autocmd!
  autocmd! Syntax python :syn keyword Keyword self
augroup END  noremap <silent> <s-tab> :BuffergatorOpen<CR>



"=====================================================
"" Language Server settings
"=====================================================
" o if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
" set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add diagnostic info for https://github.com/itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }


" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
