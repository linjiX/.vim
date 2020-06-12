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

nmap <silent> <leader>df <Plug>VimspectorContinue
nmap <silent> <leader>dq <Plug>VimspectorStop
nmap <silent> <leader>dr <Plug>VimspectorRestart
nmap <silent> <leader>dp <Plug>VimspectorPause
nmap <silent> <leader>dd <Plug>VimspectorToggleBreakpoint
nmap <silent> <leader>dD <Plug>VimspectorAddFunctionBreakpoint
nmap <silent> <leader>dj <Plug>VimspectorStepOver
nmap <silent> <leader>di <Plug>VimspectorStepInto
nmap <silent> <leader>do <Plug>VimspectorStepOut

nnoremap <silent> <leader>dc :call vimspector#ClearBreakpoints()<CR>
nnoremap <silent> <leader>dl :call vimspector#ListBreakpoints()<CR>
