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
call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

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

" Custom options for Denite
"   auto_resize             - Auto resize the Denite window height automatically.
"   prompt                  - Customize denite prompt
"   direction               - Specify Denite window direction as directly below current pane
"   winminheight            - Specify min height for Denite window
"   highlight_mode_insert   - Specify h1-CursorLine in insert mode
"   prompt_highlight        - Specify color of prompt
"   highlight_matched_char  - Matched characters highlight
"   highlight_matched_range - matched range highlight
let s:denite_options = {'default' : {
\ 'split': 'floating',
\ 'start_filter': 1,
\ 'auto_resize': 1,
\ 'source_names': 'short',
\ 'prompt': '',
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

"set winbl=10


" === Denite shorcuts === "
"   ;         - Browser currently open buffers
"   <leader>t - Browse list of files in current directory
"   <leader>g - Search current directory for occurences of given term and close window if no results
"   <leader>j - Search current directory for occurences of word under cursor
"
nmap <c-k> :Denite buffer<CR>
nmap <c-j> :DeniteProjectDir file/rec<CR>
nnoremap <leader>t :Denite outline<CR>
"nnoremap <leader>T :Denite tag<CR>

"nmap <leader>p :DeniteProjectDir file/rec<CR>
nnoremap <leader>g :<C-u>Denite grep:. -no-empty<CR>
nnoremap <leader>j :<C-u>DeniteCursorWord grep:.<CR>


" Define mappings while in 'filter' mode
"   <C-o>         - Switch to normal mode inside of search results
"   <Esc>         - Exit denite window in any mode
"   <CR>          - Open currently selected file in any mode
"   <C-t>         - Open currently selected file in a new tab
"   <C-v>         - Open currently selected file a vertical split
"   <C-h>         - Open currently selected file in a horizontal split
autocmd FileType denite-filter call s:denite_filter_my_settings()

function! s:denite_filter_my_settings() abort

  imap <silent><buffer> <C-j> <Plug>(denite_filter_quit)
  "inoremap <silent><buffer><expr> <Esc> denite#do_map('quit')
  "nnoremap <silent><buffer><expr> <Esc> denite#do_map('quit')
  inoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
  "inoremap <silent><buffer><expr> <C-t> denite#do_map('do_action', 'tabopen')
  "inoremap <silent><buffer><expr> <C-v> denite#do_map('do_action', 'vsplit')
  "inoremap <silent><buffer><expr> <C-h> denite#do_map('do_action', 'split')
  inoremap <silent><buffer><expr> <c-c> denite#do_map('quit')
  nnoremap <silent><buffer><expr> <c-c> denite#do_map('quit')

  setlocal cursorline
  "setlocal winbl=10
  hi! link CursorLine DeniteCursorLine
  hi TagbarHighlight guibg=NONE
endfunction


" Define mappings while in denite window
"   <CR>        - Opens currently selected file
"   q or <Esc>  - Quit Denite window
"   d           - Delete currenly selected file
"   p           - Preview currently selected file
"   <C-o> or i  - Switch to insert mode inside of filter prompt
"   <C-t>       - Open currently selected file in a new tab
"   <C-v>       - Open currently selected file a vertical split
"   <C-h>       - Open currently selected file in a horizontal split
autocmd FileType denite call s:denite_my_settings()

function! s:denite_my_settings() abort

  nmap <silent><buffer> <C-j> j
  nmap <silent><buffer> <C-k> k
  nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
  "nnoremap <silent><buffer><expr> q denite#do_map('quit')
  "nnoremap <silent><buffer><expr> <Esc> denite#do_map('quit')
  "nnoremap <silent><buffer><expr> d denite#do_map('do_action', 'delete')
  "nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
  "nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
  "nnoremap <silent><buffer><expr> <C-o> denite#do_map('open_filter_buffer')
  "nnoremap <silent><buffer><expr> <C-t> denite#do_map('do_action', 'tabopen')
  "nnoremap <silent><buffer><expr> <C-v> denite#do_map('do_action', 'vsplit')
  "nnoremap <silent><buffer><expr> <C-h> denite#do_map('do_action', 'split')
  inoremap <silent><buffer><expr> <c-c> denite#do_map('quit')
  nnoremap <silent><buffer><expr> <c-c> denite#do_map('quit')

  setlocal cursorline
  "setlocal winbl=10
  hi! link CursorLine DeniteCursorLine
  hi TagbarHighlight guibg=NONE
endfunction

