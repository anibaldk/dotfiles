"Vim package manager, install with:
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')
	Plug 'SirVer/ultisnips'
	Plug 'altercation/vim-colors-solarized'
	Plug 'nvie/vim-flake8'
	Plug 'terryma/vim-multiple-cursors'
	Plug 'tpope/vim-fugitive'
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'alfredodeza/pytest.vim'
	Plug 'integralist/vim-mypy'
call plug#end()

" Jump to the next field
let g:UltiSnipsExpandTrigger="<tab>" " better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=[$HOME."/dotfiles/snippets"]

"set color scheme to solarized
syntax on
let g:solarized_termcolors=16
let g:solarized_contrast="high"
set t_Co=16
set background=dark
colorscheme solarized

" Settings for multiple cursors
let g:multi_cursor_exit_from_insert_mode=0

" File settings
au BufRead,BufNewFile *.{py} setl number tw=79 tabstop=4 softtabstop=4 expandtab smarttab shiftwidth=4
au BufRead,BufNewFile *.{snippets} setl spell tabstop=4 softtabstop=4 smarttab shiftwidth=4
au BufRead,BufNewFile *.{md} setl tw=79 spell 
au BufRead,BufNewFile *.{html} setl tabstop=2 softtabstop=2 expandtab smarttab shiftwidth=2 
au BufRead,BufNewFile make setl noexpandtab 
au BufRead,BufNewFile * setl spell tabstop=4 softtabstop=4 shiftwidth=4

" Automatically remove trailing white spaces
autocmd BufWritePre *.py %s/\s\+$//e

"Practice to not use arrows
nnoremap <Left> :echo "No left for you!"<CR>
vnoremap <Left> :<C-u>echo "No left for you!"<CR>
inoremap <Left> <C-o>:echo "No left for you!"<CR>
nnoremap <Right> :echo "No right for you!"<CR>
vnoremap <Right> :<C-u>echo "No right for you!"<CR>
inoremap <Right> <C-o>:echo "No right for you!"<CR>
nnoremap <Up> :echo "No up for you!"<CR>
vnoremap <Up> :<C-u>echo "No up for you!"<CR>
inoremap <Up> <C-o>:echo "No up for you!"<CR>
nnoremap <Down> :echo "No down for you!"<CR>
vnoremap <Down> :<C-u>echo "No down for you!"<CR>
inoremap <Down> <C-o>:echo "No down for you!"<CR>

" disables error sounds
set visualbell

" Map capitals to lower case
:command WQ wq
:command Wq wq
:command W w
:command Q q

" Rest of line to next line enter
map <F2> i<CR><ESC>

" Set docstring guide to Numpy 
let g:ultisnips_python_style="numpy"
let g:ultisnips_python_quoting_style="double"

" Toggle paste modus
set pastetoggle=<F3>

" Vertical split is preferred
set diffopt+=vertical

" Short cuts for git (vim fugititve)
nnoremap <space>gs :Gstatus<CR>

" Save with `w!!` when 'readonly' is set
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Pytest
nmap <silent><Leader>tg :Pytest file<CR>
nmap <silent><Leader>tf :Pytest function<CR>
nmap <silent><Leader>tc :Pytest class<CR>
nmap <silent><Leader>tm :Pytest method<CR>
