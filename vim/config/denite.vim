call denite#custom#var('file/rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#option('default', 'prompt', 'λ')
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#source('file_rec', 'sorters', ['sorter_sublime'])
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
      \ [ '.git/', '.ropeproject/', '__pycache__/*', '*.pyc', 'node_modules/',
      \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/', '*.png'])

"nmap <LEADER>p :Denite -start-filter file/rec<CR>
"nmap <LEADER>b :Denite buffer<CR>



" ag
"call denite#custom#var('file/rec', 'command',
  "\ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

  "call denite#custom#var('grep', {
    "\ 'command': ['ag'],
    "\ 'default_opts': ['-i', '--vimgrep'],
    "\ 'recursive_opts': [],
    "\ 'pattern_opt': [],
    "\ 'separator': ['--'],
    "\ 'final_opts': [],
    "\ })

" ripgrep
"call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])
"call denite#custom#var('grep', 'command', ['rg'])
"call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])
"call denite#custom#var('grep', 'recursive_opts', [])
"call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
"call denite#custom#var('grep', 'separator', ['--'])
"call denite#custom#var('grep', 'final_opts', [])

	"call denite#custom#var('grep', {
		"\ 'command': ['rg'])
		"\ 'default_opts': ['-i', '--vimgrep', '--no-heading'],
		"\ 'recursive_opts': [],
		"\ 'pattern_opt': ['--regexp'],
		"\ 'separator': ['--'],
		"\ 'final_opts': [],
		"\ })

" Remove date from buffer list
call denite#custom#var('buffer', 'date_format', '')

let s:denite_options = {'default' : {
\ 'split': 'floating',
\ 'start_filter': 1,
\ 'auto_resize': 1,
\ 'source_names': 'short',
\ 'prompt': ' ',
\ 'highlight_matched_char': 'DeniteMatchedString',
\ 'highlight_matched_range': 'DeniteMatchedRange',
\ 'highlight_preview_line': 'DeniteNormal',
\ 'highlight_prompt': 'DenitePrompt',
\ 'highlight_window_background': 'DeniteNormal',
\ 'highlight_filter_background': 'DeniteNormal',
\ 'highlight_mode_normal': 'GitGutterAdd',
\ 'highlight_mode_insert': 'GitGutterAdd',
\ 'winrow': 1,
\ 'vertical_preview': 1
\ }}

" Loop through denite options and enable them
function! s:profile(opts) abort
  for l:fname in keys(a:opts)
    for l:dopt in keys(a:opts[l:fname])
      call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
    endfor
  endfor
endfunction

call s:profile(s:denite_options)


" === Denite shorcuts === "
nmap <c-k> :Denite buffer<CR><space>
nmap <c-j> :DeniteProjectDir file/rec<CR><space>
nnoremap <leader>t :Denite outline<CR><space>

" Define mappings while in 'filter' mode
autocmd FileType denite-filter call s:denite_filter_my_settings()

function! s:denite_filter_my_settings() abort

  imap <silent><buffer> <tab> <Plug>(denite_filter_quit)
  inoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
  inoremap <silent><buffer><expr> <c-c> denite#do_map('quit')
  nnoremap <silent><buffer><expr> <c-c> denite#do_map('quit')

  setlocal cursorline
  "setlocal winbl=10
  hi! link CursorLine DeniteCursorLine
  hi TagbarHighlight guibg=NONE
endfunction


" Define mappings while in denite window
autocmd FileType denite call s:denite_my_settings()

function! s:denite_my_settings() abort

  nmap <silent><buffer> <tab> j
  nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
  inoremap <silent><buffer><expr> <c-c> denite#do_map('quit')
  nnoremap <silent><buffer><expr> <c-c> denite#do_map('quit')

  setlocal cursorline
  "setlocal winbl=10
  hi! link CursorLine DeniteCursorLine
  hi TagbarHighlight guibg=NONE
endfunction

