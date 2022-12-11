" LOGIC FOR QUITTING FILE:
fun! QuitIfEmpty()
    if &filetype == 'netrw'
        exe 'q'
    elseif line("$") == 1 && match(getline('.'), "^\\s*$") == 0 
        exe "q!"
    elseif line("$") < 5 && empty(&filetype)
        exe "q!"
    elseif index(['css','html','javascript','python','vim','php','vb','sql','java','text','markdown'], &filetype) >= 0
        exe "wq"
    elseif &filetype == 'help' && &readonly == 0
        exe "wq"
    else
        exe "q"
    endif
endfun

" CYCLE FILES:
function! OpenNextFile(direction)
  let current_dir = expand('%:p:h')
  let current_file = expand('%:p')
  let current_dir_files = globpath(current_dir, '*', 0, 1)
  let current_file_index = index(current_dir_files, current_file)
  let next_file_index = current_file_index + a:direction

  while next_file_index != current_file_index
    if next_file_index == len(current_dir_files)
      let next_file_index = 0
    endif

    if filereadable(current_dir_files[next_file_index])
      exe 'edit ' . current_dir_files[next_file_index]
      break
    endif

    let next_file_index += a:direction
  endwhile
endfunction

