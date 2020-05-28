"                           _
"                    _   __(_)___ ___  __________
"                   | | / / / __ `__ \/ ___/ ___/
"                   | |/ / / / / / / / /  / /__
"                   |___/_/_/ /_/ /_/_/   \___/
"

" Vim-Plug Install
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
    Plug 'junegunn/vim-plug'
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-commentary'
    Plug 'justinmk/vim-syntax-extra'
    Plug 'vimwiki/vimwiki'
    Plug 'junegunn/gv.vim'
    Plug 'itchyny/lightline.vim'
    Plug 'junegunn/vim-easy-align'
call plug#end()

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

cnoremap vsp :rightb vsp

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>' use 4 spaces width
set shiftwidth=4
" On pressing tab, insert above number of spaces
set expandtab

" create the command MakeTags, which generates a tag file
command! MakeTags !ctags -R .

" show line number in current line and relative numbers in other lines
set number relativenumber

" switch to relative number only when in focus
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" sets recursive searching when using :find
set path+=**

" opens menu showing options when tab completing with multiple matching
set wildmenu
set completeopt+=menuone

" netrw:
let g:netrw_browse_split=4 " Open file in previous buffer
let g:netrw_liststyle=3 " tree view
let g:netrw_altv=1 " open splits to the right
let g:netrw_banner=0 " hide banner
let g:netrw_list_hide=netrw_gitignore#Hide() " hide annoying files

" scroll starts n lines from top or bottom line
set scrolloff=10

colorscheme PaperColor
set background=dark

" vim lightline features
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveStatusline'
      \ },
      \ }

" turn on syntax highlighting
syntax on

" turn on cursor blinking
set guicursor=n-v-c:-blinkwait175-blinkoff150-blinkon175
set guicursor=a:block-Cursor

" highlights 80th column
highlight ColorColumn ctermbg=236 guibg=#303030
set colorcolumn=81

" set highlighting of search term while typing
set incsearch

" automatically remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e


" highlight the line the cursor is on
set cursorline

" set font and allow mouse clicks
set mouse=a

set showcmd
set ignorecase smartcase
set laststatus=2
