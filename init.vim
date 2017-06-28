"dein Scripts-----------------------------
" Required:
set runtimepath+=/home/ildar/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/ildar/.config/nvim/dein/')
  call dein#begin('/home/ildar/.config/nvim/dein/')

  " Let dein manage dein
  " Required:
  call dein#add('/home/ildar/.config/nvim/dein//repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/vimproc.vim', {'build': 'make'})
  call dein#add('vim-airline/vim-airline')

  call dein#add('altercation/vim-colors-solarized')
  call dein#add('tomasr/molokai')
  call dein#add('vim-airline/vim-airline-themes')

  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 }) 
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })

  call dein#add('christoomey/vim-tmux-navigator')

  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/unite-outline')

  call dein#add('tpope/vim-fugitive')
  call dein#add('junegunn/gv.vim')
  call dein#add('jreybert/vimagit')

  call dein#add('Shougo/deoplete.nvim')
  " pip2 install jedi
  call dein#add('zchee/deoplete-jedi')

  call dein#add('tpope/vim-sleuth')
  call dein#add('tpope/vim-unimpaired')
  call dein#add('tpope/vim-repeat')
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-endwise')
  call dein#add('tpope/vim-rsi')
  call dein#add('tpope/vim-obsession')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------


" Copy from neovim to system clipboard
set clipboard+=unnamedplus

" display a bar instead of a block in insert mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile     "no swap files

let mapleader = "\<Space>"
let maplocalleader = ","

" Ctrol-Tab to switch between 2 last buffers
nmap <leader><Tab> :b#<cr>

nmap <leader>w :w<cr>

colorscheme molokai
set background=dark

let g:airline_powerline_fonts = 1
augroup Fix_airline_with_unite
    autocmd FileType unite AirlineRefresh
    autocmd FileType vimfiler AirlineRefresh
augroup END
let g:airline_theme='molokai' " dark simple badwolf solarized solarized2
let g:airline#extensions#tabline#enabled = 1

set noshowmode

nmap <leader>ff :Files<cr>

nmap <leader>o :Unite -no-split -buffer-name=outline -start-insert outline<cr>

if executable("ag") && ('' == $FZF_DEFAULT_COMMAND)
  let $FZF_DEFAULT_COMMAND = "ag --follow --nocolor --nogroup -g ''"
endif

" deoplete
call deoplete#enable()
autocmd CompleteDone * pclose " To close preview window of deoplete automagically
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#auto_completion_start_length = 3
let g:deoplete#sources#jedi#python_path = '/usr/bin/python2'
