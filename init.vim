set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=2               " number of columns occupied by a tab 
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=2            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set ttyfast                 " Speed up scrolling in Vim
set backupdir=~/.cache/vim " Directory to store backup files.

call plug#begin("~/.config/nvim/plugged")

" Lightline statusbar
Plug 'itchyny/lightline.vim'

" LSP Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

" Autocomplete using LSP
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" LuaSnip snippet engine
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" Colorscheme
Plug 'ghifarit53/tokyonight-vim'

" File tree
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

" Nvim telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Nvim treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

" Lightline configuration
let g:lightline = { "colorscheme": "tokyonight" }

" Colorscheme configuration
set termguicolors
let g:tokyonight_style = "night"
let g:tokyonight_enable_italic = 1
colorscheme tokyonight

" Telescope keymaps
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>

" LSP server and autocomple configuration
source ~/.config/nvim/lua/lsp.lua

" File tree configuration
source ~/.config/nvim/lua/nvimtree.lua

" Treesitter syntax highlighting config
source ~/.config/nvim/lua/treesitter.lua

