command! -bang Wipeout :call wipeout#wipeout(<bang>0)
nnoremap <silent> <plug>(wipeout) :<c-u>call wipeout#wipeout(0)<cr>
nnoremap <silent> <plug>(wipeout-all) :<c-u>call wipeout#wipeout(1)<cr>
