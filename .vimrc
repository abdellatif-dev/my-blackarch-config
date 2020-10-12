set relativenumber

filetype plugin on

set tabstop=4 softtabstop=4 expandtab
set shiftwidth=4

set nu

set noswapfile
set encoding=utf-8
set nobackup

set spell

set incsearch

set nowritebackup

filetype on
filetype plugin on
filetype plugin indent on
set ttyfast
set scrolloff=10  
set exrc
set secure


set shortmess+=c

let g:material_terminal_italics = 1
let g:material_terminal_italics = 1
let g:material_theme_style = 'ocean-community'

colorscheme material

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'


let g:compete_enable = v:true
let g:compete_completeopt= 'menu,menuone,noinsert'
let g:compete_fuzzy = v:true

" add here
let g:snippets_dir='~/.vim/vim-snippets/snippets'
let g:riv_disable_folding=1

let g:pymode_python='python'
let g:syntastic_python_python_exec='python'

let g:pymode_rope=1
let g:pymode_rope_completion=1
let g:pymode_rope_complete_on_dot=1
let g:pymode_rope_auto_project=0
let g:pymode_rope_enable_autoimport=0
let g:pymode_rope_autoimport_generate=0
let g:pymode_rope_guess_project=0
let g:pymode_syntax=1
let g:pymode_syntax_slow_sync=1
let g:pymode_syntax_all=1
let g:pymode_syntax_print_as_function=g:pymode_syntax_all
let g:pymode_syntax_highlight_async_await=g:pymode_syntax_all
let g:pymode_syntax_highlight_equal_operator=g:pymode_syntax_all
let g:pymode_syntax_highlight_stars_operator=g:pymode_syntax_all
let g:pymode_syntax_highlight_self=g:pymode_syntax_all
let g:pymode_syntax_indent_errors=g:pymode_syntax_all
let g:pymode_syntax_string_formatting=g:pymode_syntax_all
let g:pymode_syntax_space_errors=g:pymode_syntax_all
let g:pymode_syntax_string_format=g:pymode_syntax_all
let g:pymode_syntax_string_templates=g:pymode_syntax_all
let g:pymode_syntax_doctests=g:pymode_syntax_all
let g:pymode_syntax_builtin_objs=g:pymode_syntax_all
let g:pymode_syntax_builtin_types=g:pymode_syntax_all
let g:pymode_syntax_highlight_exceptions=g:pymode_syntax_all
let g:pymode_syntax_docstrings=g:pymode_syntax_all

augroup vimrc_autocmds
    autocmd!
    autocmd FileType python,rst,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python,rst,c,cpp match Excess /\%81v.*/
    autocmd FileType python,rst,c,cpp set nowrap
    autocmd FileType python,rst,c,cpp set colorcolumn=80
augroup END

" stop here

let g:cpp_no_function_highlight = 1
let g:cpp_simple_highlight = 1
let g:cpp_named_requirements_highlight = 1

autocmd BufReadPre *.asm let g:asmsyntax = "fasm"


set mouse=a
let g:is_mouse_enabled = 1
noremap <silent> <Leader>m :call ToggleMouse()<CR>
function ToggleMouse()
    if g:is_mouse_enabled == 1
        echo "Mouse OFF"
        set mouse=
        let g:is_mouse_enabled = 0
    else
        echo "Mouse ON"
        set mouse=a
        let g:is_mouse_enabled = 1
    endif
endfunction

set foldmethod=indent
set foldlevel=99

syntax on
set hlsearch

let NERDTreeHijackNetrw=1
let NERDTreeShowHidden=1

function! ToggleNERDTree()
 NERDTreeToggle
  silent NERDTreeMirror
endfunction

let mapleader = "\<Space>"

nmap <leader>r :source ~/.vimrc<CR>

nmap <leader>n :call ToggleNERDTree()<CR>
nmap <leader>s :w <CR>
nmap <leader>q :x <CR>
nmap <leader>f :Lines <CR>
nmap <leader>o :Files <CR>
nmap <leader>co :Commits <CR>
nmap <leader>h :help key-notation<CR>

nmap <S-Right> <C-w>l
nmap <S-Left> <C-w>h
nmap <S-Up> <C-w>k
nmap <S-Down> <c-w>j

nmap <leader>z :undo<CR>
nmap <leader>u :UndotreeShow<CR>

nnoremap <C-Up> :resize +2<CR>
nnoremap <C-Down> :resize -2<CR>
nnoremap <C-Left> :vertical resize +2<CR>
nnoremap <C-Right> :vertical resize -2<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

if (has('nvim'))
      let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

if (has('termguicolors'))
    set termguicolors
endif
  
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
"add ============================
Plug 'garbas/vim-snipmate'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'honza/vim-snippets'
Plug 'mbbill/undotree'
Plug 'Townk/vim-autoclose'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
"== add 2 =======================================
Plug 'tpope/vim-commentary'
Plug 'mitsuhiko/vim-sparkup'
Plug 'Rykka/riv.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-scripts/AutoComplPop'
call plug#end()
