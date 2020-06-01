syntax match ClapBuffersNumberBracket  /\[\|\]/ contained
syntax match ClapBuffersNumber /^\[\d\+\]/ contains=ClapBuffersNumberBracket
syntax match ClapBuffersFsize  /\(\d\|\.\)\+\(K\|B\|G\)/
syntax match ClapBuffersLnum   /line \d\+/ contained
syntax match ClapBuffersExtra   /\[\(+\|#\)\]/ contained
syntax match ClapBuffersFname   /line.*$/ contains=ClapBuffersLnum,ClapBuffersExtra

hi! default link ClapBuffersNumberBracket ClapDisplay
hi! default link ClapBuffersNumber        ClapDisplay
hi! default link ClapBuffersFsize         ClapDisplay
hi! default link ClapBuffersLnum          ClapDisplay
hi! default link ClapBuffersExtra         ClapDisplay
hi! default link ClapBuffersFname         ClapDisplay
