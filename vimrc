set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" --- Motion utilities
Bundle "vim-scripts/matchit.zip"
Bundle "haya14busa/incsearch.vim"
Bundle "easymotion/vim-easymotion"
Bundle "haya14busa/incsearch-easymotion.vim"
Bundle "ctrlpvim/ctrlp.vim"
Bundle "terryma/vim-expand-region"

" --- Interface tweaks
Bundle 'mhinz/vim-startify'
Bundle "sjl/vitality.vim"
Bundle "bling/vim-airline"
Bundle 'edkolev/tmuxline.vim'

" --- Colour schemes
Bundle "altercation/vim-colors-solarized"
Bundle 'morhetz/gruvbox'
"Plugin 'reedes/vim-colors-pencil'
"Bundle 'junegunn/seoul258.vim'
"Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
"Bundle 'jgdavey/vim-railscasts'
"Bundle 'tomasr/molokai'
"Bundle 'sjl/badwolf'
"Bundle 'nanotech/jellybeans.vim'
"Bundle 'itchyny/lightline.vim'
Plugin 'dracula/vim'
Plugin 'rakr/vim-one'

" Watch for file updates
Bundle 'gee-forr/vim-watch_for_changes'

" C#
"Bundle 'OmniSharp/omnisharp-vim'
"Bundle 'SirVer/ultisnips'

" --- Ruby utils
Bundle "vim-scripts/ruby-matchit"
Bundle "vim-ruby/vim-ruby"
Bundle "tpope/vim-rails"
Bundle "tpope/vim-endwise"

" --- JS plugins
"Bundle 'sheerun/vim-polyglot'
"Bundle 'kchmck/vim-coffee-script'
"Plugin 'jelera/vim-javascript-syntax'
"Plugin 'pangloss/vim-javascript'
Plugin 'othree/yajs.vim'
Bundle 'mxw/vim-jsx'
Bundle 'jason0x43/vim-js-indent'
Plugin 'isRuslan/vim-es6'
"Plugin 'bigfish/vim-js-context-coloring'

" --- General dev utils
Bundle 'gee-forr/vim-slurper'
Bundle 'EinfachToll/DidYouMean'
Bundle 'dietsche/vim-lastplace'
Bundle "airblade/vim-gitgutter"
Bundle "scrooloose/syntastic"
Bundle "tpope/vim-fugitive"
Bundle "gregsexton/gitv"
Bundle "ervandew/supertab"
Bundle "wellle/tmux-complete.vim"
Bundle "godlygeek/tabular"
Bundle "majutsushi/tagbar"
Bundle "tpope/vim-surround"
Bundle "scrooloose/nerdtree"
"Bundle "jistr/vim-nerdtree-tabs"
Bundle "scrooloose/nerdcommenter"
"Bundle "mileszs/ack.vim"
Bundle "kana/vim-smartinput"
Bundle "Yggdroot/indentLine"
"Bundle 'kien/rainbow_parentheses.vim'       " Colour parens depending on
"nesting
Bundle 'closetag.vim'
Bundle 'chrisbra/Colorizer'

Plugin 'fatih/vim-go'

" Ansible plugins
Bundle "Glench/Vim-Jinja2-Syntax"
Bundle "chase/vim-ansible-yaml"

" Snippet management
"Bundle "MarcWeber/vim-addon-mw-utils"
"Bundle "tomtom/tlib_vim"
"Bundle "garbas/vim-snipmate"

Plugin 'slim-template/vim-slim.git'
Bundle "rking/ag.vim"
Plugin 'mbbill/undotree'

" Vim Dev Icons. Needs to be included last
Bundle "ryanoasis/vim-devicons"


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

au BufWritePost .vimrc so ~/.vimrc " automatically reload vimrc when it's saved

"" Some general editor stuff
"set clipboard=unnamed           " send yanks to the os clipboard
set mouse=a
set nobackup                    " Do not keep a backup file
set showcmd                     " display incomplete commands
set scrolloff=7                 " Never scroll to the edge of the window
set history=50                  " Keep the last 50 commands
set t_ti= t_te=                 " Do not clear the screen when exiting vim, and preserve the window
au FocusLost * :silent! wall    " Autosave on losing focus (works in iTerms2 and tmux using VITality plugin)
syntax enable
filetype plugin indent on       " load file type plugins + indentation

" Leader stuff
let mapleader = "\<space>"
nnoremap <Space> <Nop>
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>w :w<CR>
"nmap <Leader><Leader> V

" nerdtree
noremap <Leader><Tab> :NERDTreeToggle<CR>



" Store temporary files in a central spot
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

"" Folding
set nofoldenable
set foldmethod=indent
set foldlevelstart=20

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2                   " a tab is two spaces (or set this to 4)
set shiftwidth=2
set expandtab                   " use spaces, not tabs (optional)
set shiftround                  " Always indent/outdent to nearest tabstop
set backspace=indent,eol,start  " backspace through everything in insert mode
set pastetoggle=<leader>pt      " "Set  to toggle paste on and off.
set smarttab

"" Searching
set nohlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set gdefault                    " Make global search and replace the default (use /g to make it singular)
set wildmenu
set wildignore+=*/.hg/*,*/.svn/*,*.swp,*.swo

"" Editor window dressing
set bg=dark
let g:gruvbox_contrast_dark='hard'

"colorscheme gruvbox
colorscheme dracula
"colorscheme pencil

set cursorline                  " Highlight current line
set ruler                       " Show a ruler
set relativenumber              " Show lines numbers relative to where you are
au InsertEnter * :set nu        " absolute line numbers in insert mode,
au InsertLeave * :set rnu       " relative otherwise for easy movement
set showmatch                   " Show matching brackets

"set guifont=Inconsolata\ for\ Powerline:h18     "Set the font to Inconsolata at 18pt. (Yes, it's huge)
set guifont=Fira\ Code\ Retina:h14     "Set the font to Inconsolata at 18pt. (Yes, it's huge)
"set bg=light                    " Light background
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮ " Make the list chars less hideous (and more like textmate)
set showbreak=↪

function! CurDir()
  let curdir = substitute(getcwd(), '/home/gabrielf/', "~/", "g")
  return curdir
endfunction
set laststatus=2                " Show statusline on second last line
set statusline=\ [%F%m%r%h\ %w]\ \ \ [CWD:%r%{CurDir()}%h]\ \ \ [Type=%Y]\ \ \ %{fugitive#statusline()}\ \ \ [Line:%l/%L:%c\ %p%%]\

let &t_8f="\e[38;2;%ld;%ld;%ldm"
let &t_8b="\e[48;2;%ld;%ld;%ldm"
set termguicolors

"" Tab shortcuts
map <leader>tn :tabnew
map <leader>tm :tabmove
map <leader>te :tabe
map <leader>tc :tabclose<cr>    " Close
map <leader><right> :tabn<cr>   " Select tab to the right
map <leader><left> :tabp<cr>    " Select tab to the left
map <leader>k :tabn<cr>         " Select tab to the right using k
map <leader>j :tabp<cr>         " Select tab to the left using j
map <leader>l :bn<cr>           " Select tab to the right using k
map <leader>h :bp<cr>           " Select tab to the left using j

"" Split window shortcuts
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

"" Make vim jump to the last known line
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

"" Fix silly typos to DWIM, not DWIS
"cmap W w
"cmap Q q

"" Load up Plugin specfic configuration
""  -- doesn't clutter up the rest of the vimrc this way.
runtime! Plugin_config/*.vim

""" Highlight trailing whitespace
highlight TrailWhitespace ctermbg=red guibg=red
match TrailWhitespace /\s\+$\| \+\ze\t/

" silver searcher
let g:ag_highlight=1
if executable('ag')
	" Use ag over grep
	set grepprg=ag\ --nogroup\ --nocolor

	" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

	" ag is fast enough that CtrlP doesn't need to cache
	let g:ctrlp_use_caching = 0
endif" The Silver Searcher

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

nnoremap \ :Ag<SPACE>



" syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_css_checkers = ['stylelint']

"let g:syntastic_warning_symbol = '<img draggable="false" class="emoji" alt="⚠" src="https://s0.wp.com/wp-content/mu-plugins/wpcom-smileys/twemoji/2/svg/26a0.svg">'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" colorizer
let g:colorizer_auto_filetype='css,sass,less,html'

" unicode symbols
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''

let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:indentLine_enabled = 0

let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '~-'

"NERDTree setup
autocmd StdinReadPre * let s:std_in=2
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"autocmd BufEnter * lcd %:p:h
"NERDTree File highlighting
"function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
"exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
"exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
"endfunction
"        NERDTree setup
"let g:NERDTreeWinSize = 50
let NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden = 1

" Auto change directory
"let NERDTreeChDirMode = 2
map <leader>r :NERDTreeFind<cr>

"call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#263238')
"call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#263238')
"call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#263238')
"call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#263238')
"call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#263238')
"call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#263238')
"call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#263238')
"call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#263238')
"call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#263238')
"call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#263238')
"call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#263238')
"call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#263238')
"call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#263238')
"call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#263238')
"call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#263238')
"call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#263238')
"call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#263238')
"call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#263238')

let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
highlight Comment cterm=italic

