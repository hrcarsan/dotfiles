" Files + devicons
function! g:Fzf_dev()
  "let l:fzf_files_options = '--preview "rougify {2..-1} | head -'.&lines.'"'
  let l:fzf_files_options = '-m --prompt "  " --color'

  function! s:files()
    let l:files = split(system($FZF_DEFAULT_COMMAND), '\n')
    "return s:prepend_icon(l:files)
    return l:files
  endfunction

  function! s:prepend_icon(candidates)
    let l:result = []
    for l:candidate in a:candidates
      let l:filename = fnamemodify(l:candidate, ':p:t')
      let l:icon = WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
      call add(l:result, printf('%s %s', l:icon, l:candidate))
    endfor

    return l:result
  endfunction

  function! s:edit_file(item)
    let l:pos = stridx(a:item, ' ')
    let l:file_path = a:item[pos+1:-1]
    execute 'silent e' l:file_path
  endfunction

  call fzf#run({
        \ 'source': <sid>files(),
        \ 'sink':   function('s:edit_file'),
        \ 'options': ' ' . l:fzf_files_options,
        \ 'window': 'call FloatingFZF()' })
  "\ 'window': { 'width': 0.5, 'height': 0.6 }})
  "\ 'down':    '40%' })
endfunction


let $FZF_DEFAULT_COMMAND = 'rg --files --smart-case'
let $FZF_DEFAULT_OPTS = '--reverse'

"let g:fzf_layout = { 'down': '10' }
"let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

function! FloatingFZF()
echo 'hey'
  let width = float2nr(&columns * 0.6)
  let height = float2nr(&lines * 0.6)
  let opts = { 'relative': 'editor',
             \ 'row': 1,
             \ 'col': (&columns - width) / 2,
             \ 'width': width,
             \ 'height': height }

  call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
endfunction

let g:fzf_layout = { 'window': 'call FloatingFZF()' }

"noremap <c-k> :Buffers<cr>
"noremap <c-j> :History<cr>
"noremap <c-j> :Files<cr>

"noremap <leader>t :BTags<cr>
"noremap <leader>T :Tags<cr>

"nnoremap <leader>d :call fzf#vim#tags("'".expand('<cword>'))<cr>

"command! -bang -nargs=? -complete=dir Files
    "\ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']}, <bang>0)

autocmd FileType * hi! link Pmenu NONE
autocmd FileType fzf call s:fzf_settings()

function! s:fzf_settings() abort
  ""inoremap <c-o> <esc>:
  ""inoremap <c-c> <esc>
  "tnoremap <c-c> <esc>

  hi! link Pmenu DeniteNormal
  setlocal signcolumn=no
endfunction

