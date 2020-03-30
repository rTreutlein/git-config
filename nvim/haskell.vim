" My Configs for Haskell

let NERDTreeIgnore = ['\.o$','\.hi$']

" Proper Fold Color
hi Folded ctermbg=Grey

" easily run the code in ghci/cabal repl
map <leader>sr <C-l>:r<CR>
map <leader>sb <C-l>stack build<CR>
map <leader>sg <C-l>stack ghci<CR>

map <leader>c :GhcModCheckAsync<CR>
map <leader>l :GhcModLintAsync<CR>
map <leader>t :w<CR>:GhcModType<CR>
map <leader>T :w<CR>:GhcModTypeInsert<CR>
map <leader>h :GhcModTypeClear<CR>

nmap <leader>k i--<esc>
vmap <leader>k S}vi{S-

autocmd BufWritePost,FileWritePost *.hs call GhcModCheckAsyncIfOpen()

function! GhcModCheckAsyncIfOpen()
   if exists("g:qfix_win")
      GhcModCheckAsync
   endif
endfunction

" used to track the quickfix window
augroup QFixToggle
 autocmd!
 autocmd BufWinEnter,BufEnter quickfix let g:qfix_win = bufnr("$")
 autocmd BufWinLeave * if exists("g:qfix_win") && expand("<abuf>") == g:qfix_win | unlet! g:qfix_win | endif
augroup END

set makeprg=stack\ build
