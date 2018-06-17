
  "_________              __  .__                       
 "/   _____/____    _____/  |_|__|____     ____   ____  
 "\_____  \\__  \  /    \   __\  \__  \   / ___\ /  _ \ 
 "/        \/ __ \|   |  \  | |  |/ __ \_/ /_/  >  <_> )
"/_______  (____  /___|  /__| |__(____  /\___  / \____/ 
        "\/     \/     \/             \//_____/         
       ".__                         __                  
 "___  _|__| _____     ______ _____/  |_ __ ________    
 "\  \/ /  |/     \   /  ___// __ \   __\  |  \____ \   
  "\   /|  |  Y Y  \  \___ \\  ___/|  | |  |  /  |_> >  
   "\_/ |__|__|_|  / /____  >\___  >__| |____/|   __/   
                "\/       \/     \/           |__|      


source $HOME/.config/nvim/config/plugins.vim
source $HOME/.config/nvim/config/basics.vim
source $HOME/.config/nvim/config/maps.vim
source $HOME/.config/nvim/config/airline.vim
source $HOME/.config/nvim/config/nerdtree.vim
"source $HOME/.config/nvim/config/tagbar.vim
source $HOME/.config/nvim/config/fzf.vim
source $HOME/.config/nvim/config/deoplete.vim
source $HOME/.config/nvim/config/ale.vim
source $HOME/.config/nvim/config/ctags.vim


command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)

function! s:RunShellCommand(cmdline)
  "echo a:cmdline
  let expanded_cmdline = a:cmdline

  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  "call setline(1, 'You entered:    ' . a:cmdline)
  "call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  "call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  normal ggdd
  setlocal nomodifiable
  "1
endfunction
