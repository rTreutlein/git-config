"General Settings
"Tab Settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set smartindent

set wrap
set linebreak
"Use Undofile
set undofile
set undodir=$HOME/.config/nvim/undo
"Hidde Buffers with Changes instead of Closing them
set hidden
"For Scrolling in Xterm
set mouse=a

set backspace=indent,eol,start

"Show Syntax and load filetype specific config
filetype plugin indent on
syntax enable

"Show Line Numbers
set number
set relativenumber

" Set to auto read when a file is changed from the outside
set autoread

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb

"Color
set background=dark
if (has("termguicolors"))
      "let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
      "let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
      set termguicolors
  endif
hi Folded ctermbg=10

" use sytem clipboard
set clipboard=unnamedplus

"Enable typing during Omni Complete
set completeopt=longest,menuone

"Easier movment in File
map J }
map K {

"Move through wrapped lines
inoremap <C-k> k
inoremap <C-j> j
map <silent> j gj
map <silent> k gk

"Move easly between windows
map <C-j> <C-w>j
map <C-h> <C-w>h
map <C-k> <C-w>k
map <C-l> <C-w>l
map <leader>j <C-j>
map <leader>h <C-h>
map <leader>k <C-k>
map <leader>l <C-l>
"Movement in Terminal
tmap <C-j> <C-\><C-n><C-w>j
tmap <C-h> <C-\><C-n><C-w>h
tmap <C-k> <C-\><C-n><C-w>k
tmap <C-l> <C-\><C-n><C-w>l

tnoremap <expr> <Esc> ((stridx(bufname(),"lazygit") > -1)?("\<Esc>"):("\<C-\>\<C-n>"))

"Auto Enter insert Mode in Terminal
:au BufWinEnter,BufEnter * if &buftype == 'terminal' | :startinsert | else | :stopinsert | endif

"Replace Word with Copied/Delted
nnoremap S diw"0P

"Copie till end of line
map Y y$

"Make 80th colum visible
if (exists('+colorcolumn'))
   set colorcolumn=80
   highlight ColorColumn ctermbg=9
endif

"Set Filetype for .cxxtest
autocmd BufNewFile,BufRead *.cxxtest set syntax=cpp

" Status line
set laststatus=2

" Format the status line
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
set statusline+=:%c

" On Startup configre windows correctly
if &diff || exists("g:git")
else
    autocmd VimEnter * NERDTree
    autocmd VimEnter * wincmd l
    "if exists("g:Vertical")
    "    autocmd VimEnter * :split
    "    autocmd VimEnter * wincmd j
    "    autocmd VimEnter * :terminal
    "    autocmd VimEnter * call feedkeys("\<Esc>")
    "    autocmd VimEnter * :set nobuflisted
    "    autocmd VimEnter * wincmd k
    "    autocmd VimEnter * :vertical resize 90
    "    autocmd VimEnter * call feedkeys("\<Esc>")
    "else
    "    autocmd VimEnter * :vs
    "    autocmd VimEnter * wincmd l
    "    autocmd VimEnter * :terminal
    "    autocmd VimEnter * call feedkeys("\<Esc>")
    "    autocmd VimEnter * :set nobuflisted
    "    autocmd VimEnter * :vertical resize 80
    "    autocmd VimEnter * wincmd h
    "    autocmd VimEnter * :vertical resize 90
    "    autocmd VimEnter * call feedkeys("\<Esc>")
    "endif
endif

"Set Leader to Space
let mapleader = "\<Space>"

"Change Terminal format
nmap <leader>p iexport PS1=">"<CR>

nnoremap <leader>j J

"Save
map <leader>w :w<CR>

" Spell checking
map <leader>ss :setlocal spell!<cr>

"Quicklyresize the Splits
nnoremap <Leader>+ :exe "vertical resize " . (winwidth(0) * 10/9)<CR>
nnoremap <Leader>- :exe "vertical resize " . (winwidth(0) * 9/10)<CR>

"shell exec current line
nmap <leader>! :silent exec 'r!' . getline(".")<CR>

"Silent Make
nmap <silent> <leader>m :silent make<CR>

"Close Buffer
map <leader>q :bd<CR>

"Plugins

call plug#begin('~/.config/nvim/plugged')

"svelte
Plug 'leafOfTree/vim-svelte-plugin'

"Tex
Plug 'donRaphaco/neotex', { 'for': 'tex' }

"Git
Plug 'lewis6991/gitsigns.nvim'
Plug 'kdheepak/lazygit.nvim'

"Cmake
Plug 'Shatur/neovim-tasks'

"General

Plug 'scrooloose/nerdtree' "File Explorer
Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*'}

Plug 'airblade/vim-rooter' "Auto Set Root Folder
Plug 'voldikss/vim-floaterm'
Plug 'psliwka/vim-smoothie' "Smooth Scroling with C-D C-F or PageUpDown

Plug 'nvim-lua/plenary.nvim' "Depency for other things

"LSP
Plug 'williamboman/mason.nvim' "Install LSP-Servers
Plug 'williamboman/mason-lspconfig.nvim' "bridge gap
Plug 'neovim/nvim-lspconfig' "Default Configs

"Autocomplete
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'} "Fast Autocomplete
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'} "Snipets
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}

"Formatting
Plug 'jlesquembre/rst-tables.nvim', {'do': ':UpdateRemotePlugins'} "Create Tables
Plug 'ntpeters/vim-better-whitespace' "Show trailing whitespace and remvoe
Plug 'junegunn/vim-easy-align' "Align Text simply

"Finding Stuff
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } "fzf program
Plug 'junegunn/fzf.vim' "fzf plugin

"Visual
Plug 'ryanoasis/vim-devicons'
Plug 'iCyMind/NeoSolarized' "Color Scheme
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"Movement
Plug 'farmergreg/vim-lastplace' "Open File at last edit location
Plug 'easymotion/vim-easymotion' "Show possible Search Targets to Jump to


call plug#end()

colorscheme NeoSolarized

let g:coq_settings = {"auto_start": "shut-up","keymap":{"jump_to_mark": "<c-n>", "recommended": v:false}}

ino <silent><expr> <Esc>   pumvisible() ? "\<C-e><Esc>" : "\<Esc>"
ino <silent><expr> <C-c>   pumvisible() ? "\<C-e><C-c>" : "\<C-c>"
ino <silent><expr> <BS>    pumvisible() ? "\<C-e><BS>"  : "\<BS>"
ino <silent><expr> <CR>    pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"
ino <silent><expr> <C-j>   pumvisible() ? "\<C-n>" : "\<C-j>"
ino <silent><expr> <C-k>   pumvisible() ? "\<C-p>" : "\<C-k>"

"bufferline
"lspconifg
lua << EOF
require("bufferline").setup{}

require("nvim-treesitter.configs").setup{
    ensure_installed = {"c","cpp","lua","vim","help","python","yaml"},
    highlight = {
        enable = true
    },
    indent = {enable = true},
}


local Path = require('plenary.path')
require('tasks').setup{
    default_params = {
        cmake = {
            build_dir = "Build/Intermediate/Shore300_Linux_x64_gcc9_ModelTrainer"
        }
    }
}

require("mason").setup()
require("mason-lspconfig").setup()

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")

    local bufopts = { noremap = true, silent = true, buffer=bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
end

require("lspconfig").lua_ls.setup{
    on_attach = on_attach
}
require("lspconfig").vimls.setup{
    on_attach = on_attach
}
require("lspconfig").clangd.setup{
    on_attach = on_attach,
    cmd = {
        "clangd",
        "--background-index",
        }
}
require("lspconfig").pyright.setup{
    on_attach = on_attach
}
require("lspconfig").hls.setup{
    on_attach = on_attach
}
EOF

nmap <leader>ss :ClangdSwitchSourceHeader<CR>

"LazyGit
nnoremap <silent> <leader>gg :LazyGit<CR>

"easymotion
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1

"fugitive
nnoremap <silent> <leader>gs :Git<CR>
nnoremap <silent> <leader>gp :Git push<CR>

"Easy align interactive
vnoremap <silent> <Enter> :EasyAlign<cr>

"Better Whitespacs
map <leader>sw :StripWhitespace<CR>

"FZF fuzzy finder
let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }
let $FZF_DEFAULT_OPTS="--reverse" "top to bottom

" floating fzf window with borders
function! CreateCenteredFloatingWindow()
    let width = min([&columns - 4, max([80, &columns - 20])])
    let height = min([&lines - 4, max([20, &lines - 10])])
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
endfunction

nmap <leader>o :FZF<cr>
nmap <leader>f :Rg<cr>
nmap <leader>b :Buffers<cr>

"Table creating update
nmap <leader>tc :TableRstFormat<CR>
nmap <leader>tt :TableRstReflow<CR>

"Floaterm
nmap <leader>tt :FloatermToggle<CR>
nmap <leader>tn :FloatermNew<CR>

nmap <expr> <TAB> (&buftype == 'terminal' ? ':FloatermNext' : ':bnext')."\<CR>"
nmap <expr> <S-TAB> (&buftype == 'terminal' ? ':FloatermPrev' : ':bprevious')."\<CR>"

let g:floaterm_position = 'center'
let g:floaterm_width = 0.9
let g:floaterm_height = 0.9

let g:floaterm_borderchars = ['─','│','─','│','╭','╮','╯','╰']
hi link FloatermNF Floating
hi link FloatermBorderNF Floating

"svelte
let g:vim_svelte_plugin_use_typescript = 1
