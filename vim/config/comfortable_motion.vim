
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key   = "k"

"noremap <silent> <ScrollWheelDown> i<c-o>:call comfortable_motion#flick(100)<CR><esc>
"noremap <silent> <ScrollWheelUp> i<c-o>:call comfortable_motion#flick(-100)<CR><esc>

noremap <silent> J :call comfortable_motion#flick(100)<CR>
noremap <silent> K :call comfortable_motion#flick(-100)<CR>

"noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
"noremap <silent> <ScrollWheelUp> :call comfortable_motion#flick(-40)<CR>
