nmap <silent> <c-k> :Clap buffers<CR>
nmap <silent> <c-j> :Clap!! files<CR>

let g:clap_layout = {'relative': 'window', 'width': '76%', 'height': '33%', 'row': '5%', 'col': '12%'}
let g:clap_open_preview = 'never'
let g:clap_preview_direction = 'UD'
let g:clap_search_box_border_style = 'nil'
let g:clap_fuzzy_match_hl_groups = [
  \ [118 , '#FFFFFF'] ,
  \ [82  , '#FFFFFF'] ,
  \ [46  , '#FFFFFF'] ,
  \ [47  , '#FFFFFF'] ,
  \ [48  , '#FFFFFF'] ,
  \ [49  , '#FFFFFF'] ,
  \ [50  , '#FFFFFF'] ,
  \ [51  , '#FFFFFF'] ,
  \ [87  , '#FFFFFF'] ,
  \ [123 , '#FFFFFF'] ,
  \ [159 , '#FFFFFF'] ,
  \ [195 , '#FFFFFF'] ,
\ ]

let g:clap_project_root_markers = ['.root']
let g:clap_provider_coc_blink = [0, 0]

