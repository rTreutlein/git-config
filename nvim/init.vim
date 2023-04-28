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

tnoremap <expr> <Esc> ((stridx(bufname(),"lazygit") > -1)?("\<Esc>"):("\<C-\>\<C-n>"))

"Auto Enter insert Mode in Terminal
:au BufWinEnter,BufEnter * if &buftype == 'terminal' | :startinsert | else | :stopinsert | endif

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

lua << EOF

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins')

require('config')

require('leap').add_default_mappings()

require('Comment').setup()

require("nvim-treesitter.configs").setup{
    ensure_installed = {"c","cpp","lua","vim","vimdoc","python","yaml","html"},
    highlight = {
        enable = true
    },
    indent = {enable = true},
    matchup = {enabled = true},
}


local Path = require('plenary.path')
require('tasks').setup{
    default_params = {
        cmake = {
            build_dir = "Build/Intermediate/Shore300_Linux_x64_gcc9_ModelTrainer",
            args = {
                build = { "-j8" },
            },
        }
    }
}

EOF

colorscheme NeoSolarized

"LazyGit
nnoremap <silent> <leader>gg :LazyGit<CR>

"easymotion
"nmap s <Plug>(easymotion-s2)
"nmap t <Plug>(easymotion-t2)

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

"Easy align interactive
vnoremap <silent> <Enter> :EasyAlign<cr>

"Better Whitespacs
map <leader>sw :StripWhitespace<CR>

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

"Tasks
nmap <leader>m :Task start cmake build<CR>
