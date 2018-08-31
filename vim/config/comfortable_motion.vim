
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key   = "k"

noremap <silent> J :call comfortable_motion#flick(100)<CR>
noremap <silent> K :call comfortable_motion#flick(-100)<CR>
