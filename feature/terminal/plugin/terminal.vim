"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    https://github.com/linjiX/.vim                           "
"     _  _          _  _ __  __    __        _                "
"    | |(_) _ __   (_)(_)\ \/ /   / /__   __(_) _ __ ___      "
"    | || || '_ \  | || | \  /   / / \ \ / /| || '_ ` _ \     "
"    | || || | | | | || | /  \  / /_  \ V / | || | | | | |    "
"    |_||_||_| |_|_/ ||_|/_/\_\/_/(_)  \_/  |_||_| |_| |_|    "
"                |__/                                         "
"                                                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup myTerminal
    autocmd!
    if has('nvim')
        autocmd TermOpen * call terminal#AutoCmdTerminal()
        autocmd TermClose * quit
        autocmd BufEnter term://* call terminal#AutoCmdNavigate()
    else
        autocmd TerminalOpen * call terminal#AutoCmdTerminal()
        autocmd QuitPre * call terminal#AutoCmdWipeTerminal()
    endif
augroup END

nnoremap <silent> <C-n> :call terminal#SmartOpen('bash')<CR>
nnoremap <silent> <leader>ei :call terminal#SmartOpen('ipython')<CR>
nnoremap <silent> <leader>eb :call terminal#SmartOpen('bpython')<CR>
nnoremap <silent> <leader>et :call terminal#SmartOpen('ptpython')<CR>
nnoremap <silent> <leader>eh :call terminal#SmartOpen('htop')<CR>

tnoremap <ESC><ESC> <C-\><C-n>
if has('nvim')
    tmap <expr><silent> <C-h> terminal#Navigate("\<C-h>")
    tmap <expr><silent> <C-j> terminal#Navigate("\<C-j>")
    tmap <expr><silent> <C-k> terminal#Navigate("\<C-k>")
    tmap <expr><silent> <C-l> terminal#Navigate("\<C-k>")
else
    set termwinkey=<C-v>
    if has_key(g:plugs, 'vim-tmux-navigator')
        tnoremap <silent> <C-h> <C-v>:TmuxNavigateLeft<CR>
        tnoremap <silent> <C-j> <C-v>:TmuxNavigateDown<CR>
        tnoremap <silent> <C-k> <C-v>:TmuxNavigateUp<CR>
        tnoremap <silent> <C-l> <C-v>:TmuxNavigateRight<CR>
    else
        tnoremap <C-h> <C-v>h
        tnoremap <C-j> <C-v>j
        tnoremap <C-k> <C-v>k
        tnoremap <C-l> <C-v>l
    endif
endif