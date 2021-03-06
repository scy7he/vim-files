call pathogen#infect()

au BufWritePost .vimrc so ~/.vimrc " automatically reload vimrc when it's saved

"" Some general editor stuff
"set clipboard=unnamed           " send yanks to the OS clipboard
set nocompatible                " choose no compatibility with legacy vi
set nobackup                    " Do not keep a backup file
set encoding=utf-8
set showcmd                     " display incomplete commands
set scrolloff=7                 " Never scroll to the edge of the window
set history=50                  " Keep the last 50 commands
set t_ti= t_te=                 " Do not clear the screen when exiting vim, and preserve the window
au FocusLost * :silent! wall    " Autosave on losing focus (works in iTerms2 and tmux using VITality plugin)
syntax enable
filetype plugin indent on       " load file type plugins + indentation

" Store temporary files in a central spot
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

"" Folding
"set nofoldenable
"set fdl=0
"set foldmethod=indent

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set shiftround                  " Always indent/outdent to nearest tabstop
set backspace=indent,eol,start  " backspace through everything in insert mode
set pastetoggle=<leader>pt      " "Set  to toggle paste on and off.

"" Searching
"set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set gdefault                    " Make global search and replace the default (use /g to make it singular)
set wildmenu
set wildignore+=*/.hg/*,*/.svn/*,*.swp,*.swo

"" Editor window dressing
colorscheme molokai
"colorscheme solarized
set t_Co=256                    " 256 colours
set cursorline                  " Highlight current line
set ruler                       " Show a ruler
"set number                      " Show line numbers
set relativenumber              " Show lines numbers relative to where you are
au InsertEnter * :set nu        " absolute line numbers in insert mode,
au InsertLeave * :set rnu       " relative otherwise for easy movement
set showmatch                   " Show matching brackets
"set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
set guifont=Envy\ Code\ R\ 11
"set bg=dark                     " Dark background
set bg=light                    " Light background
"set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮ " Make the list chars less hideous (and more like textmate)
set listchars=trail:␣,tab:›\ ,extends:>,precedes:<,nbsp:·
set showbreak=↪

function! CurDir()
  let curdir = substitute(getcwd(), '/home/gabrielf/', "~/", "g")
  return curdir
endfunction
set laststatus=2                " Show statusline on second last line
set statusline=\ [%F%m%r%h\ %w]\ \ \ [CWD:%r%{CurDir()}%h]\ \ \ [Type=%Y]\ \ \ %{fugitive#statusline()}\ \ \ [Line:%l/%L:%c\ %p%%]\ 

"" Tab shortcuts
map <leader>tn :tabnew 
map <leader>tm :tabmove 
map <leader>te :tabe 
map <leader>tc :tabclose<cr>    " Close
map <leader><right> :tabn<cr>   " Select tab to the right
map <leader><left> :tabp<cr>    " Select tab to the left
map <leader>k :tabn<cr>         " Select tab to the right using k
map <leader>j :tabp<cr>         " Select tab to the left using j

"" Split window shortcuts
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

"" Be clever about pasting from somewhere into the terminal
"" This detects a paste from the pasteboard and will temporarily
"" set pastetoggle
"" Doesn't work with things like tmux and screen
if &term =~ "xterm.*"
    let &t_ti = &t_ti . "\e[?2004h"
    let &t_te = "\e[?2004l" . &t_te
    function XTermPasteBegin(ret)
        set pastetoggle=<Esc>[201~
        set paste
        return a:ret
    endfunction
    map <expr> <Esc>[200~ XTermPasteBegin("i")
    imap <expr> <Esc>[200~ XTermPasteBegin("")
    cmap <Esc>[200~ <nop>
    cmap <Esc>[201~ <nop>
endif

"" Make vim jump to the last known line
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

"" Fix silly typos to DWIM, not DWIS
cmap W w
cmap Q q

"" Load up bundle specfic configuration
""  -- doesn't clutter up the rest of the vimrc this way.
runtime! bundle_config/*.vim

""" Highlight trailing whitespace
"highlight TrailWhitespace ctermbg=red guibg=red
"match TrailWhitespace /\s\+$\| \+\ze\t/
let Powerline_symbols = 'fancy'
