function! wipeout#wipeout(bang)
  let l:cmd = get(g:, 'wipeout_command', 'bw')
  if a:bang
    let l:cmd .= '!'
  endif

  " figure out which buffers are visible in any tab
  let l:visible = {}
  for l:t in range(1, tabpagenr('$'))
    for l:b in tabpagebuflist(l:t)
      let l:visible[l:b] = 1
    endfor
  endfor

  " wipeout any buffer that are exists but not visible
  let l:del = 0
  for l:b in range(1, bufnr('$'))
    if !bufexists(l:b)
      continue
    endif
    if !a:bang
      if has_key(l:visible, l:b)
        continue
      endif
      if getbufvar(l:b, "&mod")
        continue
      endif
    endif
    let l:del += 1
    execute l:cmd . ' ' . l:b
  endfor
  echo "Deleted " . l:del . " buffer" . (l:del == 1 ? "" : "s")
endfunction
