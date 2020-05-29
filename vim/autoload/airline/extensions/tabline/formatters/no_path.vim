
function! airline#extensions#tabline#formatters#no_path#format(bufnr, buffers)
  let _ = ''

  let name = bufname(a:bufnr)
  if empty(name)
    let _ .= '[No Name]'
  elseif name =~ 'term://'
    " Neovim Terminal
    let _ = substitute(name, '\(term:\)//.*:\(.*\)', '\1 \2', '')
  else
    let _ .= fnamemodify(name, ':t')
  endif

  return airline#extensions#tabline#formatters#default#wrap_name(a:bufnr, _)
endfunction
