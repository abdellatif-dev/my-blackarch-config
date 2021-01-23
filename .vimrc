" Vundle -----------------------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/nerdtree-project-plugin'

Plugin 'xavierd/clang_complete'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'RRethy/vim-illuminate'

Plugin 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}
Plugin 'junegunn/fzf.vim' " needed for previews
Plugin 'fatih/vim-go'
Plugin 'ap/vim-css-color'
Plugin 'stsewd/fzf-checkout.vim'
Plugin 'kaicataldo/material.vim', { 'branch': 'main' }
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'lambdalisue/gina.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'machakann/vim-sandwich'
Plugin 'honza/vim-snippets'
Plugin 'mbbill/undotree'
Plugin 'Townk/vim-autoclose'
" rust
Plugin 'rust-lang/rust.vim'
Plugin 'rhysd/rust-doc.vim'
Plugin 'arzg/vim-rust-syntax-ext'
" coc-nvim
Plugin 'neoclide/coc.nvim', {'branch': 'release'}


call vundle#end()            " required
" Vundle -----------------------------------------------------------------------

" file type and syntax highliting on
filetype plugin indent on
syntax on

let g:coc_global_extensions=[ 'coc-omnisharp' ]

" whitespaces
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
highlight ExtraWhitespace ctermbg=cyan guibg=cyan
autocmd InsertLeave * redraw!
match ExtraWhitespace /\s\+$\| \+\ze\t/
autocmd BufWritePre * :%s/\s\+$//e

let NERDTreeHijackNetrw=1
let NERDTreeShowHidden=1

function! ToggleNERDTree()
 NERDTreeToggle
  silent NERDTreeMirror
endfunction

function! ToggleUndoTree()
    UndotreeShow
  silent UndotreeFocus
 endfunction

" sessions
let mapleader = "\<Space>"
noremap <F1> :mksession! .vim.session <cr>
noremap <F2> :source .vim.session <cr>
noremap <F3> :! rm .vim.session <cr>

nnoremap <C-k> :resize +2<CR>
nnoremap <C-j> :resize -2<CR>
nnoremap <C-h> :vertical resize +2<CR>
nnoremap <C-l> :vertical resize -2<CR>
nmap <leader>n :call ToggleNERDTree()<CR>

nmap <S-l> <C-w>l
nmap <S-h> <C-w>h
nmap <S-k> <C-w>k
nmap <S-j> <c-w>j


nmap <leader>z :undo<CR>
nmap <leader>u :call ToggleUndoTree()<CR>

nmap <leader>o :Files <CR>
nmap <leader>f :Lines <CR>
nmap <leader>b :Buffers <CR>
nmap <leader>co :Commits <CR>

map <leader>h :split <CR>
map <leader>v :vsplit <CR>

nmap <leader>he :help key-notation<CR>
nmap <leader>r :source ~/.config/nvim/init.vim<CR>
nmap <leader>s :w <CR>
nmap <leader>q :x <CR>

" for autoread to auto load
au FocusGained,BufEnter * :silent! !
au FocusLost,WinLeave * :silent! w
" mouse control
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

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1

" specific settings
set fo+=t
set t_Co=256
set nocursorline
set title
set relativenumber
set autoread
set autowriteall
set bs=2
set autoindent
set ruler
set shortmess=aoOTI
set nocompatible
set showmode
set splitbelow
set splitright
set showcmd
set completeopt+=preview
set showmatch
set tabstop=4
set shiftwidth=4
set expandtab
set cinoptions=(0,m1,:1
set tw=80
set formatoptions=tcqro2
set smartindent
set laststatus=2
set softtabstop=2
set showtabline=1
set sidescroll=5
set scrolloff=4
set hlsearch
set incsearch
set ignorecase
set smartcase
set foldmethod=marker
set ttyfast
set history=10000
set hidden
set complete=.,w,b,u,t
set completeopt=longest,menuone,preview
set noswapfile
set foldlevelstart=0
set wildmenu
set wildmode=list:longest,full
set nowrap
set statusline=%{getcwd()}\/\%f%=%-14.(%l,%c%V%)\ %P
set hidden
set autoread
set conceallevel=2
set diffopt+=vertical
set concealcursor=vin

" backup
set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//

" make directories automatically if they don't already exist
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

" close brackets
:inoremap ( ()<Esc>i
:inoremap < <><Esc>i
:inoremap { {}<Esc>i
:inoremap [ []<Esc>i
:inoremap " ""<Esc>i
:inoremap ' ''<Esc>i
:inoremap ` ``<Esc>i


noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>


" cursorline
au WinLeave * set nocursorline
au WinEnter * set cursorline
set cursorline

" clang stuff
let g:clang_library_path='/usr/lib/'
let g:clang_user_options='|| exit 0'
let g:clang_complete_auto = 1
let g:clang_compelte_macros=1
let g:clang_complete_copen = 1
let g:clang_debug = 1
let g:clang_snippets=1
let g:clang_conceal_snippets=1
let g:clang_snippets_engine='clang_complete'
colorscheme material

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

augroup folding
  autocmd FileType vim setlocal foldmethod=marker
  autocmd FileType vim execute "normal! zM"
augroup END

au BufRead,BufNewFile .eslintrc set filetype=json

autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

autocmd FileType scss setl iskeyword+=@-@
autocmd CursorHold * silent call CocActionAsync('highlight')

" python
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

" stop here
let g:cpp_no_function_highlight = 1
let g:cpp_simple_highlight = 1
let g:cpp_named_requirements_highlight = 1

autocmd BufReadPre *.asm let g:asmsyntax = "fasm"

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! s:find_selection()
  let selection = s:get_visual_selection()
  execute 'Ag '.s:get_visual_selection()
endfunction

function! s:get_visual_selection()
  " why is this not a built-in vim script function?!
  let [line_start, column_start] = getpos("'<")[1:2]
  let [line_end, column_end] = getpos("'>")[1:2]
  let lines = getline(line_start, line_end)
  if len(lines) == 0
    return ''
  endif
  let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][column_start - 1:]
  return join(lines, "\n")
endfunction
"
" }}}

if (has('nvim'))
      let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

