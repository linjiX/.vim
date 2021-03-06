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

let g:gitgutter_preview_win_floating = 1

function s:SetPopupWinColor() abort
    if has('nvim')
        return
    endif
    let l:pos = getpos('.')[1:2]
    let l:screenpos = screenpos(win_getid(), l:pos[0], l:pos[1])
    let l:popup_id = popup_locate(l:screenpos.row + 1, l:screenpos.col)
    call popup_setoptions(l:popup_id, {'highlight': 'NormalFloat'})
endfunction

nnoremap <silent> <leader>gl :GitGutter<CR>
nnoremap <silent> <leader>gF :GitGutterFold<CR>
nnoremap <silent> <leader>gq :GitGutterQuickFix<CR>:belowright copen<CR>
nmap <silent> <leader>gp <Plug>(GitGutterPreviewHunk):call <SID>SetPopupWinColor()<CR>
nmap <silent> <leader>ga <Plug>(GitGutterStageHunk)
nmap <silent> <leader>gu <Plug>(GitGutterUndoHunk)

omap ig <Plug>(GitGutterTextObjectInnerPending)
omap ag <Plug>(GitGutterTextObjectOuterPending)
xmap ig <Plug>(GitGutterTextObjectInnerVisual)
xmap ag <Plug>(GitGutterTextObjectOuterVisual)

nnoremap [rg :GitGutterEnable<CR>
nnoremap ]rg :GitGutterDisable<CR>
nnoremap yrg :GitGutterToggle<CR>

nnoremap [rG :GitGutterBufferEnable<CR>
nnoremap ]rG :GitGutterBufferDisable<CR>
nnoremap yrG :GitGutterBufferToggle<CR>
