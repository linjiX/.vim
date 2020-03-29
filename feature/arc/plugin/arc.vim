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

augroup myArc
    autocmd!
    autocmd BufNewFile,BufRead .arc*,*.book setlocal filetype=json
    autocmd BufNewFile,BufRead new-commit,differential-update-comments setlocal filetype=arcdiff
    autocmd BufNewFile,BufRead *.diviner setlocal filetype=markdown

    autocmd FileType arcdiff setlocal colorcolumn=72 | setlocal commentstring=#%s
augroup END