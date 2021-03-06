""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    https://github.com/linjiX/nvim                                "
"     _  _          _  _ __  __    __             _                "
"    | |(_) _ __   (_)(_)\ \/ /   / /_ __ __   __(_) _ __ ___      "
"    | || || '_ \  | || | \  /   / /| '_ \\ \ / /| || '_ ` _ \     "
"    | || || | | | | || | /  \  / / | | | |\ V / | || | | | | |    "
"    |_||_||_| |_|_/ ||_|/_/\_\/_/  |_| |_| \_/  |_||_| |_| |_|    "
"                |__/                                              "
"                                                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function s:AutoCmdFugitive() abort
    setlocal nobuflisted
    nmap <silent><buffer> <leader>q gq
    nmap <silent><buffer> q gq
endfunction

function s:AutoCmdGit() abort
    setlocal nobuflisted
    nnoremap <silent><buffer> <leader>q :q<CR>
    nnoremap <silent><buffer> q :q<CR>
endfunction

let s:script = 'vim-fugitive/autoload/fugitive.vim'

function s:VSplitBlame() abort
    let l:BlameCommit = utility#ScriptFunction('BlameCommit', s:script)
    let l:old_config = utility#SetConfig({'&l:splitbelow': 1})
    try
        execute l:BlameCommit('vsplit')
    finally
        call utility#SetConfig(l:old_config)
    endtry
endfunction

augroup myGit
    autocmd!
    autocmd FileType fugitive,fugitiveblame call s:AutoCmdFugitive()
    autocmd FileType git call s:AutoCmdGit()
    autocmd FileType gitcommit setlocal colorcolumn=72
    autocmd FileType GV setlocal colorcolumn=0 | setlocal nobuflisted
    autocmd BufAdd *fugitiveblame ++once autocmd myGit FileType fugitiveblame
                \ nnoremap <silent><buffer> <CR> :call <SID>VSplitBlame()<CR>
augroup END

command! -bar -bang Gst vertical botright Git<bang>
command! -bar -bang -nargs=* -complete=customlist,fugitive#EditComplete Gd
            \ vertical botright Gdiffsplit<bang> <args>

command! -nargs=? -complete=customlist,fugitive#CommitComplete Gc
            \ vertical botright Git commit -v <args>
command! -nargs=? -complete=customlist,fugitive#CommitComplete Gca
            \ vertical botright Git commit -v -a <args>

command! -nargs=? -complete=customlist,fugitive#PushComplete Gpush
            \  let g:asyncrun_silent_mode = 1 | AsyncRun git push <args>

" Plug 'rhysd/git-messenger.vim'
let g:git_messenger_no_default_mappings = 1
nmap <leader>gm <Plug>(git-messenger)

" Plug 'tpope/vim-rhubarb'
nnoremap gb :.GBrowse<CR>
vnoremap gb :GBrowse<CR>
