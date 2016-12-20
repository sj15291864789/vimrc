
" Vundle initialization
" Avoid modify this section, unless you are very sure of what you are doing

" no vi-compatible
set nocompatible

" Setting up Vundle - the best vim plugin manager
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle..."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle
  let iCanHazVundle=0
endif

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Plugins
Plugin 'gmarik/vundle'

" ============================================================================
" Active plugins
" You can disable or add new ones here:
" Plugins from github repos:

" Better file browser
Plugin 'scrooloose/nerdtree'
" Markdown syntastic highlight
Plugin 'plasticboy/vim-markdown'
Plugin 'suan/vim-instant-markdown'
" Maybe the best Git integration
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
" Tab list panel
Plugin 'kien/tabman.vim'
" indent object
Plugin 'michaeljsmith/vim-indent-object'
" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Pending tasks list
Plugin 'fisadev/FixedTaskList.vim'
" Surround
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
" Autoclose
Plugin 'Townk/vim-autoclose'
" Python mode (indentation, doc, refactor, lints, code checking, motion and
" operators, highlighting, run and ipdb breakpoints)
Plugin 'klen/python-mode'
" Golang Plugins
Plugin 'fatih/vim-go'
Plugin 'pangloss/vim-javascript'
Plugin 'vim-ruby/vim-ruby'
" JSX syntax highlight.
Plugin 'mxw/vim-jsx'
" Handlebars syntax highlighting
Plugin 'mustache/vim-mustache-handlebars'
" Vue.js syntax and highlighting
Plugin 'tao12345666333/vim-vue'
Plugin 'MarcWeber/vim-addon-mw-utils'

" Better autocompletion
Plugin 'Shougo/neocomplete.vim'
" Snippets manager (SnipMate), dependencies, and snippets repo
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'
Plugin 'garbas/vim-snipmate'
" Drag visual blocks arround
Plugin 'fisadev/dragvisuals.vim'
" Python and other languages code checker
Plugin 'scrooloose/syntastic'
" Paint css colors with the real color
Plugin 'lilydjwg/colorizer'
" Search results counter
Plugin 'IndexedSearch'
" XML/HTML tags navigation
Plugin 'matchit.zip'
" Yank history navigation
Plugin 'YankRing.vim'
" javascript complete after install the plugin, you must cd the install
" directory and run `npm install`, then add a .tern-project config file
" the doc at http://ternjs.net/doc/manual.html#vim
Plugin 'marijnh/tern_for_vim'
" Automatically sort python imports
Plugin 'fisadev/vim-isort'

Plugin 'kien/ctrlp.vim'
Plugin 'elzr/vim-json'
Plugin 'altercation/vim-colors-solarized'
Plugin 'sjl/gundo.vim'
Plugin 'terryma/vim-multiple-cursors'
" ============================================================================
" Install plugins the first time vim runs

if iCanHazVundle == 0
  echo "Installing Plugins, please ignore key map error messages"
  echo ""
  :PluginInstall
endif

" ============================================================================
" Vim settings and mappings
" You can edit them as you wish
set splitright
set splitbelow
:let g:NERDTreeWinSize=30

" allow plugins by file type (required for plugins!)
filetype plugin on
filetype indent on
" NERDTree
" auto open or close NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <F3> :NERDTreeToggle<CR>
nmap ,t :NERDTreeFind<CR>
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" TabMan ------------------------------
" mappings to toggle display, and to focus on it
let g:tabman_toggle = 'tl'
let g:tabman_focus  = 'tf'
let g:tabman_side = 'right'

" Airline ------------------------------
let g:airline_powerline_fonts = 1
let g:airline_theme = 'bubblegum'
let g:airline#extensions#whitespace#enabled = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Tasklist ------------------------------
map <F2> :TaskList<CR>

" Autoclose ------------------------------
" Fix to let ESC work as espected with Autoclose plugin
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}

" Neocomplete --------------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" Plugin key-mappings.
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()
" sharing clipboard
set clipboard=unnamed
let g:ctrlp_map = '<C-l>'
" tabs and spaces handling
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
" highlight cursor line and column
set cursorline
set cursorcolumn
" auto read and write
set autowrite
set autoread
" when deal with unsaved files ask what to do
set confirm
" no backup files
set nobackup
" always show status bar
set laststatus=2
" incremental search
set incsearch
" highlighted search results
set hlsearch
" search ignore case
set ignorecase
" syntax highlight on
syntax on
" show line numbers
set nu
" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3
" autocompletion of files and commands behaves like zsh
" (autocomplete menu)
set wildmenu
set wildmode=full
" better backup, swap and undos storage
set directory=~/.vim/dirs/tmp     " directory to place swap files in
set undofile                      " persistent undos - undo after you re-open the file
set undodir=~/.vim/dirs/undos
set viminfo+=n~/.vim/dirs/viminfo
" other settings 
set mouse=a
set whichwrap+=<,>,h,l,[,]
set background=dark
set encoding=utf-8


" tab length exceptions on some file types
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" tab navigation mappings
map tn :tabn<CR>
map tp :tabp<CR>
map tm :tabm 
map tt :tabnew 
map ts :tab split<CR>
colorscheme solarized

" store yankring history file there too
let g:yankring_history_dir = '~/.vim/dirs/'

" create needed directories if they don't exist
if !isdirectory(&directory)
  call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
  call mkdir(&undodir, "p")
endif


" file finder mapping
let g:ctrlp_map = ',e'
" hidden some types files
let g:ctrlp_show_hidden = 1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.png,*.jpg,*.gif           "Linux
" general code finder in all files mapping
nmap ,f :CtrlPLine<CR>
" recent files finder mapping
nmap ,m :CtrlPMRUFiles<CR>

" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227

" Vim-jsx ------------------------------
" if you use JSX syntax in .js file, please enable it.
let g:jsx_ext_required = 0
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap  <Leader>= :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap  <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap  <Leader>1 :exe "vertical resize -15"<CR>
nnoremap  <Leader>2 :exe "vertical resize +15"<CR>
nnoremap  <Leader>= :exe "resize " . (winheight(0) * 3/2)<CR>
let mapleader=";"
nnoremap ß :exec "lefta 25vs"
nnoremap ç :exec "bel 16split"
