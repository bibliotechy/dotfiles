set nu



"NerdTree
map <C-\> :NERDTreeToggle<CR>

" Open Nerdtree in a new vim session unless a file was specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
