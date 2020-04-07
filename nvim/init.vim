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
set termguicolors
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

tnoremap <C-[> <C-\><C-n>

"Auto Enter insert Mode in Terminal
:au BufWinEnter,BufEnter * if &buftype == 'terminal' | :startinsert | else | :stopinsert | endif

"Motion through AutoCompelte Popup
inoremap <expr> <C-j> ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> <C-k> ((pumvisible())?("\<C-p>"):("k"))

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

"Close Buffer
map <leader>q :MBEbd<CR>
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

"Plugins

call plug#begin('~/.config/nvim/plugged')

"Haskell
Plug 'eagletmt/neco-ghc'
Plug 'eagletmt/ghcmod-vim'

Plug 'merijn/haskellFoldIndent'

Plug 'Twinside/vim-haskellFold'
Plug 'Twinside/vim-hoogle'

Plug 'rTreutlein/haskell-vim'

"Tex
Plug 'donRaphaco/neotex', { 'for': 'tex' }

"Git
Plug 'airblade/vim-gitgutter' "Show Diffs and move to them
Plug 'tpope/vim-fugitive' "Git Commands for Comminting/Pushing...

"CPP
Plug 'octol/vim-cpp-enhanced-highlight' "Better highlight for c++11/14/17

"General

"Plug 'vim-syntastic/syntastic' "Syntax Checker

Plug 'scrooloose/nerdtree' "File Explorer
Plug 'fholgado/minibufexpl.vim' "Buffer List XXX Try to get rid of this

Plug 'Shougo/vimproc.vim' , { 'do': 'make'}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'} "Completion FrameWork
Plug 'Shougo/neosnippet.vim' "Snippet FrameWork
Plug 'Shougo/neosnippet-snippets' "Snippets

Plug 'jlesquembre/rst-tables.nvim', {'do': ':UpdateRemotePlugins'} "Create Tables

Plug 'ntpeters/vim-better-whitespace' "Show trailing whitespace and remvoe

Plug 'ludovicchabant/vim-gutentags' "Automatically update ctags files

Plug 'easymotion/vim-easymotion' "Show possible Search Targets to Jump to

Plug 'Raimondi/delimitMate' "Add closing quotes/brakets/...

Plug 'iCyMind/NeoSolarized' "Color Scheme

Plug 'dpc/vim-smarttabs' "Tabs for indenting , Spaces for Alignmnet

Plug 'junegunn/vim-easy-align' "Align Text simply
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } "fzf program
Plug 'junegunn/fzf.vim' "fzf plugin

Plug 'airblade/vim-rooter' "Auto Set Root Folder

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'voldikss/vim-floaterm'

Plug 'psliwka/vim-smoothie'

"From https://github.com/Blacksuan19/init.nvim/blob/master/init.vim
Plug 'ryanoasis/vim-devicons'
Plug 'farmergreg/vim-lastplace' 

"VimSpector

Plug 'lstephen/vim-hardtime'

call plug#end()

colorscheme NeoSolarized

"deopleate
let g:deoplete#enable_at_startup = 1

"NeoSnippet
imap <C-l> <Plug>(neosnippet_expand_or_jump)
smap <C-l> <Plug>(neosnippet_expand_or_jump)
xmap <C-l> <Plug>(neosnippet_expand_target)

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
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>gr :Gremove<CR>

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
nmap <leader>r :call Fzf_dev()<cr>

"Table creating update
nmap <leader>tc :TableRstFormat<CR>
nmap <leader>tt :TableRstReflow<CR>

"Gutentags
set statusline+=\ %{gutentags#statusline()}

"Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"
"let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

"Airline
let g:airline_powerline_fonts = 0

"MiniBufExpl
"Save and go to next Buffer
"nmap <TAB> :MBEbn<CR>
"nmap <S-TAB> :MBEbp<CR>

let g:miniBufExplCycleArround=1

"Floaterm
nmap <leader>tt :FloatermToggle<CR>
nmap <leader>tn :FloatermNew<CR>

nmap <expr> <TAB> (&buftype == 'terminal' ? ':FloatermNext' : ':MBEbn')."\<CR>"
nmap <expr> <S-TAB> (&buftype == 'terminal' ? ':FloatermPrev' : ':MBEbp')."\<CR>"

let g:floaterm_position = 'center'
let g:floaterm_width = 0.9
let g:floaterm_height = 0.9

let g:floaterm_borderchars = ['─','│','─','│','╭','╮','╯','╰']
hi link FloatermNF Floating
hi link FloatermBorderNF Floating

let g:hardtime_default_on = 1
let g:hardtime_showmsg = 1
let g:hardtime_allow_different_key = 1


