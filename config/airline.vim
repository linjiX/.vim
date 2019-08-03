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

" Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#ycm#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#gutentags#enabled = 1

let g:airline#extensions#tabline#show_tabs = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1

let g:airline#extensions#tmuxline#enabled = 0
" let g:airline#extensions#tmuxline#color_template = 'insert'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.dirty='*'

nmap <expr> <leader>1 BufferCmd('<Plug>AirlineSelectTab1')
nmap <expr> <leader>2 BufferCmd('<Plug>AirlineSelectTab2')
nmap <expr> <leader>3 BufferCmd('<Plug>AirlineSelectTab3')
nmap <expr> <leader>4 BufferCmd('<Plug>AirlineSelectTab4')
nmap <expr> <leader>5 BufferCmd('<Plug>AirlineSelectTab5')
nmap <expr> <leader>6 BufferCmd('<Plug>AirlineSelectTab6')
nmap <expr> <leader>7 BufferCmd('<Plug>AirlineSelectTab7')
nmap <expr> <leader>8 BufferCmd('<Plug>AirlineSelectTab8')
nmap <expr> <leader>9 BufferCmd('<Plug>AirlineSelectTab9')

" Plug 'edkolev/tmuxline.vim'
 let g:tmuxline_preset = {
      \'a'    : 'Tmux',
      \'b'    : 'Session: #S',
      \'c'    : '',
      \'win'  : '#I.#W#F',
      \'cwin' : '#I.#W#F',
      \'x'    : ['#(whoami)@#H', '%F %a'],
      \'z'    : '%R',
      \'options' : {'status-justify' : 'left', 'status-position' : 'top'}
\ }