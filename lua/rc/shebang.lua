vim.cmd([[
  autocmd BufWritePost * :call AddExecmod()
  function AddExecmod()
      let line = getline(1)
      if strpart(line, 0, 2) == "#!"
          call system("chmod +x ". expand("%"))
      endif
  endfunction

  fun! s:DetectDeno()
    if getline(1) == '#!/usr/bin/env -S deno run --allow-all'
        set ft=javascript
    endif
  endfun

  autocmd BufNewFile,BufRead * call s:DetectDeno()
]])
