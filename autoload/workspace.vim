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

augroup myWorkspace
    autocmd!
augroup END

function s:HasExplorer() abort
    let l:bufs = map(range(1, winnr('$')), 'winbufnr(v:val)')
    let l:bufs = filter(l:bufs, 'getbufvar(v:val, "&filetype") ==# "coc-explorer"')
    return len(l:bufs) >= 1
endfunction

function s:HasTagbar() abort
    return bufwinnr('__Tagbar__') != -1
endfunction

function s:SetWindowConfig() abort
    let s:tagbar_left_user = get(g:, 'tagbar_left', 0)
    let s:tagbar_autofocus_user = get(g:, 'tagbar_autofocus', 0)
    let s:tagbar_vertical_user = get(g:, 'tagbar_vertical', 0)

    let g:tagbar_left = 0
    let g:tagbar_autofocus = 0
    let g:tagbar_vertical = winheight(0)/2
endfunction

function s:ResetWindowConfig() abort
    let g:tagbar_left = s:tagbar_left_user
    let g:tagbar_autofocus = s:tagbar_autofocus_user
    let g:tagbar_vertical = s:tagbar_vertical_user

    unlet s:tagbar_left_user
    unlet s:tagbar_autofocus_user
    unlet s:tagbar_vertical_user
endfunction

function s:GetWinID() abort
    let s:prev_winid = win_getid()
endfunction

function s:GotoWinID() abort
    if !exists('s:prev_winid')
        return
    endif
    call win_gotoid(s:prev_winid)
    unlet s:prev_winid
endfunction

function workspace#ToggleWorkspace() abort
    let l:has_tagbar = s:HasTagbar()
    let l:has_explorer = s:HasExplorer()

    if l:has_tagbar
        TagbarClose
    endif

    if l:has_explorer
        CocCommand explorer --toggle
    endif

    if l:has_tagbar || l:has_explorer
        return
    endif

    call s:GetWinID()

    autocmd myWorkspace BufWinEnter \[coc-explorer\]* ++once call s:OpenTagbarPre()
    execute 'CocCommand explorer --width '. SiderBarWidth()
endfunction

function workspace#RevealWorkspace() abort
    let l:has_tagbar = s:HasTagbar()

    if !l:has_tagbar
        autocmd myWorkspace BufWinEnter \[coc-explorer\]* ++once call s:OpenTagbarPre()
    endif

    execute 'CocCommand explorer --no-toggle --width '. SiderBarWidth() .' --reveal='. expand('%:p')
endfunction

function s:OpenTagbarPre() abort
    autocmd myWorkspace CursorMoved * ++once call s:OpenTagbar()
endfunction

function s:OpenTagbar() abort
    clearjumps
    call s:SetWindowConfig()
    TagbarOpen
    call s:ResetWindowConfig()
    call s:GotoWinID()
endfunction
