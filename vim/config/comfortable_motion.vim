let g:comfortable_motion_no_default_key_mappings = 1

noremap <silent> J :call comfortable_motion#flick(50)<CR>
noremap <silent> K :call comfortable_motion#flick(-50)<CR>
