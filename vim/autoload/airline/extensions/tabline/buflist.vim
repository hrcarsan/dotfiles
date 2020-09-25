" MIT License. Copyright (c) 2013-2019 Bailey Ling et al.
" vim: et ts=2 sts=2 sw=2

scriptencoding utf-8

function! airline#extensions#tabline#buflist#invalidate()
  unlet! s:current_buffer_list
endfunction

function! airline#extensions#tabline#buflist#clean()
  call airline#extensions#tabline#buflist#invalidate()
  call airline#extensions#tabline#buffers#invalidate()
endfunction

" paths in excludes list
function! s:ExcludePaths(nr, exclude_paths)
  let bname = bufname(a:nr)
  if empty(bname)
    return 0
  endif
  let bpath = fnamemodify(bname, ":p")
  for f in a:exclude_paths
    if bpath =~# f | return 1 | endif
  endfor
endfunction

" other types to exclude
function! s:ExcludeOther(nr, exclude_preview)
  if (getbufvar(a:nr, 'current_syntax') == 'qf') ||
        \  (a:exclude_preview && getbufvar(a:nr, '&bufhidden') == 'wipe'
        \  && getbufvar(a:nr, '&buftype') == 'nofile')
    return 1 | endif
endfunction

function! airline#extensions#tabline#buflist#list()
  if exists('s:current_buffer_list')
    return s:current_buffer_list
  endif

  let exclude_buffers = get(g:, 'airline#extensions#tabline#exclude_buffers', [])
  let exclude_paths = get(g:, 'airline#extensions#tabline#excludes', [])
  let exclude_preview = get(g:, 'airline#extensions#tabline#exclude_preview', 1)

  let list = (exists('g:did_bufmru') && g:did_bufmru) ? BufMRUList() : range(1, bufnr("$"))

  let buffers = []
  " If this is too slow, we can switch to a different algorithm.
  " Basically branch 535 already does it, but since it relies on
  " BufAdd autocommand, I'd like to avoid this if possible.
  for nr in list
    if buflisted(nr)
      " Do not add to the bufferlist, if either
      " 1) bufnr is exclude_buffers list
      " 2) buffername matches one of exclude_paths patterns
      " 3) buffer is a quickfix buffer
      " 4) when excluding preview windows:
      "     'bufhidden' == wipe
      "     'buftype' == nofile
      " 5) ignore buffers matching airline#extensions#tabline#ignore_bufadd_pat

      " check buffer numbers first
      if index(exclude_buffers, nr) >= 0
        continue
      " check paths second
      elseif !empty(exclude_paths) && s:ExcludePaths(nr, exclude_paths)
        continue
      " ignore buffers matching airline#extensions#tabline#ignore_bufadd_pat
      elseif airline#util#ignore_buf(bufname(nr))
        continue
      " check other types last
      elseif s:ExcludeOther(nr, exclude_preview)
        continue
      endif

      call add(buffers, nr)
    endif
  endfor

  " update buffers in order list
  let g:airline_buffers_order = get(g:, 'airline_buffers_order', [])
  let airline_buffers_order = []

  for buffer in g:airline_buffers_order
    if index(buffers, buffer) >= 0
      call add(airline_buffers_order, buffer)
    endif
  endfor

  for buffer in buffers
    if index(airline_buffers_order, buffer) >= 0
      continue
    endif

    call add(airline_buffers_order, buffer)
  endfor

  let g:airline_buffers_order = airline_buffers_order
  let buffers = airline_buffers_order

  let s:current_buffer_list = buffers
  return buffers
endfunction


function! airline#extensions#tabline#buflist#goto_next()
  let buffers_order = get(g:, 'airline_buffers_order', [])
  let cur_buffer    = bufnr("%")
  let index         = index(buffers_order, cur_buffer)

  if index < 0
    return
  endif

  if index == len(buffers_order) - 1
    execute "buffer ".buffers_order[0]
    return
  endif

  execute "buffer ".(buffers_order[index+1])
endfunction


function! airline#extensions#tabline#buflist#goto_prev()
  let buffers_order = get(g:, 'airline_buffers_order', [])
  let cur_buffer    = bufnr("%")
  let index         = index(buffers_order, cur_buffer)

  if index < 0
    return
  endif

  if index == 0
    execute "buffer ".buffers_order[-1]
    return
  endif

  execute "buffer ".(buffers_order[index-1])
endfunction


function! airline#extensions#tabline#buflist#move_right()
  let buffers_order = get(g:, 'airline_buffers_order', [])
  let cur_buffer    = bufnr("%")
  let cur_index     = index(buffers_order, cur_buffer)

  if cur_index < 0
    return
  endif

  if cur_index == len(buffers_order) - 1
    let buffers_order = [cur_buffer] + buffers_order[:-2]
  else
    let buffers_order[cur_index] = buffers_order[cur_index + 1]
    let buffers_order[cur_index + 1] = cur_buffer
  endif

  let g:airline_buffers_order = buffers_order
  call airline#extensions#tabline#buflist#clean()
  call airline#extensions#tabline#redraw()
endfunction


function! airline#extensions#tabline#buflist#move_left()
  let buffers_order = get(g:, 'airline_buffers_order', [])
  let cur_buffer    = bufnr("%")
  let cur_index     = index(buffers_order, cur_buffer)

  if cur_index < 0
    return
  endif

  if cur_index == 0
    let buffers_order = buffers_order[1:] + [cur_buffer]
  else
    let buffers_order[cur_index] = buffers_order[cur_index - 1]
    let buffers_order[cur_index - 1] = cur_buffer
  endif

  let g:airline_buffers_order = buffers_order
  call airline#extensions#tabline#buflist#clean()
  call airline#extensions#tabline#redraw()
endfunction
