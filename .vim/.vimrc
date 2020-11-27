"General settings

set nocompatible

set incsearch               "Find as you type
set ignorecase              "Ignore case in search
set scrolloff=2             "Number of lines to keep above/below cursor
set smartcase               "Only ignore case when all letters are lowercase
set number                  "Show line numbers
set wildmode=longest,list   "Complete longest string, then list alternatives
set pastetoggle=<F2>        "Toggle paste mode
set fileformats=unix        "Use Unix line endings
set smartindent             "Smart autoindenting on new line
set smarttab                "Respect space/tab settings
set history=300             "Number of commands to remember
set showmode                "Show whether in Visual, Replace, or Insert Mode
set showmatch               "Show matching brackets/parentheses
set backspace=2             "Use standard backspace behavior
set hlsearch                "Highlight matches in search
set formatoptions=1         "Don't wrap text after a one-letter word
set shellcmdflag=-ic         "Interactive shell loads my aliases"
set list                    "show invisible characters
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set splitbelow              "new horizontal splits go below
set splitright              "new vertical splits go to the right

syntax on " syntax highting
filetype on " Enable filetype detection
filetype plugin indent on " enable loading indent file for filetypes


" Vim jump to the last position when reopening a file
if has("autocmd")
 au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
 \| exe "normal! g'\"" | endif
endif


"NerdTree
map <C-\> :NERDTreeToggle<CR>

" Open Nerdtree in a new vim session unless a file was specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

