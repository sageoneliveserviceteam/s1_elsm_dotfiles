" Preamble ---------------------------------------------------------------- {{{
"
" ~/.vimrc

if  has('vim_starting')
  set nocompatible  " be iMproved (MUST be first)
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Use NeoBundle for installing / managing Vim scripts
call neobundle#rc(expand('~/.vim/bundle/'))

" }}}


" Bundles ----------------------------------------------------------------- {{{

" Let NeoBundle manage NeoBundle (ooh how meta)
NeoBundleFetch 'Shougo/neobundle.vim'

" Tools
NeoBundle 'tpope/vim-git'
NeoBundle 'tpope/vim-fugitive'

" Colour schemes
NeoBundle 'vim-scripts/Colour-Sampler-Pack'

" }}}


" Basic settings ---------------------------------------------------------- {{{

filetype plugin indent on " Required! Enable detection, plugins and indenting
NeoBundleCheck            " Installation check
set number                " Show line number
set ruler                 " Show line and column numbers
syntax enable             " Turn on syntax highlighting
set termencoding=utf-8    " Set term encoding to UTF-*
set encoding=utf-8        " Set default encoding to UTF-8
let mapleader=","         " Change leader key from \ to ,
let maplocalleader="\\"   " Set local leader to \\
set hidden                " Hide buffers instead of closing
set showmatch             " Show matching parantesis
set nrformats=            " Treat all numerals as decimals
set nobackup              " Don't keep backup files, it's 70's style cluttering
set noswapfile            " Don't write annoying intermediate swap files,
                          "   who did ever restore from swap files anyway?
set undofile              " Persistent undos
set undodir=$HOME/.vim/undo " Where to save undo histories
set undolevels=1000       " How many undos
set undoreload=10000      " Number of lines to save for undo
set viminfo='20,\"80      " Read / Write a .viminfo file, don't store more
                          "   than 80 lines of registers
set title                 " Change the terminal's title
set visualbell            " Don't beep
set noerrorbells          " Don't beep
set showcmd               " Show (partial) command in the last line of the
                          "   screen this also shows visual selection info
set nomodeline            " Disable mode lines (security measure)
set cursorline            " Underline the current line, for quick orientation
set history=1000          " Remember more commands and search history
set undolevels=1000       " Use many muchos levels of undo
set scrolloff=4           " Keep 4 lines off the edges of the screen when
                          "   scrolling
set splitbelow            " Open horizontal splits on bottom (more natural)
set splitright            " Open vertical splits on right (more natural)
set colorcolumn=80        " Colour column 80 as a visual guide
set lazyredraw            " Don't update the display while executing macros
set laststatus=2          "   tell VIM to always put a status line in, even
                          "   if there is only one window
set cmdheight=2           " Use a status bar that is 2 rows high
set pastetoggle=<F2>      " When in insert mode, press <F2> to go to
                          "   paste mode, where you can paste mass data that
                          "   won't be autoindented
au VimResized * :wincmd = " Resize splits when Vim is resized
set spelllang=en_gb       " Let's use real English
set spellfile=~/.vim/spell/en.utf-8.add   " Custom dictionary
set omnifunc=syntaxcomplete#Complete

set t_Co=256              " Pretty colours
set background=dark       " Setting background to dark

colorscheme inkpot        " Setting a colourscheme

" }}}


" Whitespace -------------------------------------------------------------- {{{

set nowrap                        " Don't wrap lines
set tabstop=2                     " A tab is 2 spaces
set shiftwidth=2                  " An autoindent is 2 spaces
set expandtab                     " Use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " Backspace through everything in insert mode
set autoindent                    " Always autoindent
set copyindent                    " Copy previous indentation on autoindenting
set shiftround                    " use multiple of shiftwidth when indenting
                                  "   with '<' and '>'
set smarttab                      " Insert tabs on start of line according to
                                  "   shiftwidth, not tabstop

" List chars
set listchars=""            " Reset the listchars
set listchars=tab:\ \       " a tab should display as "  ",
                            "   trailing whitespace as "."
set listchars+=trail:.      " show trailing spaces as dots
set listchars+=extends:>    " The character to show in the last column when
                            "   wrap is off and the line continues beyond the
                            "   right of the screen
set listchars+=precedes:<   " The character to show in the last column when
                            "   wrap is off and the line continues beyond the
                            "   left of the screen

" }}}

" Searching --------------------------------------------------------------- {{{

set hlsearch                " highlight matches
set incsearch               " incremental searching
set ignorecase              " searches are case insensitive...
set smartcase               " ... unless they contain at least one capital

" }}}


" Wild settings ----------------------------------------------------------- {{{

set wildmenu            " make tab completion for files/buffers act like bash
set wildmode=list:full  " show a list when pressing tab and complete
                        "   first full match

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Ignore rails temporary asset caches
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*

" }}}


" Navigation -------------------------------------------------------------- {{{

" Remap j and k to act as expected when used on long, wrapped, lines
nnoremap j gj
nnoremap k gk

" Speed up scrolling of viewport (move 3 lines at a time instead of 1)
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Easy window navigation (instead of ctrl-w then j it's just ctrl-j)
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" }}}

" Key Mappings ------------------------------------------------------------ {{{

"Remap Ctrl-C to go back to normal mode
inoremap <C-c> <Esc>

" Toggle show/hide invisible chars
nnoremap <leader>i :set list!<cr>

" Toggle line numbers
nnoremap <leader>N :setlocal number!<cr>

" Clears the search register
nnoremap <silent> <leader>/ :nohlsearch<CR>

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" Strip all trailing whitespace from a file, using ,W
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR>

" Fugitive:
nmap <leader>gb :Gblame<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gl :Glog<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Git push<CR>

" }}}
