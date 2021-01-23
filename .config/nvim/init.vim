set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'ryanoasis/vim-devicons'
Plugin 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}
Plugin 'junegunn/fzf.vim'
Plugin 'ap/vim-css-color'
Plugin 'stsewd/fzf-checkout.vim'
Plugin 'mbbill/undotree'
Plugin 'Townk/vim-autoclose'
Plugin 'vim-airline/vim-airline'
Plugin 'rust-lang/rust.vim'
Plugin 'kaicataldo/material.vim', { 'branch': 'main' }
Plugin 'neoclide/coc.nvim', {'branch': 'release'}

call vundle#end()            " required
" Vundle -----------------------------------------------------------------------

" file type and syntax highliting on
filetype plugin indent on
syntax on

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
nmap <leader>u :call ToggleUndoTree()<CR>

nmap <leader>o :Files <CR>
nmap <leader>f :Lines <CR>
nmap <leader>` :Buffers <CR>

map <leader>h :split <CR>
map <leader>v :vsplit <CR>

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

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>


" cursorline
au WinLeave * set nocursorline
au WinEnter * set cursorline
set cursorline

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

augroup folding
  autocmd FileType vim setlocal foldmethod=marker
  autocmd FileType vim execute "normal! zM"
augroup END

au BufRead,BufNewFile .eslintrc set filetype=json

colorscheme material
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd BufReadPre *.asm let g:asmsyntax = "fasm"


if (has('nvim'))
      let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

inoremap <silent><expr> <c-space> coc#refresh()
