" Maintainer:     Ryan Young
" Last Modified:  Dec 05, 2022

fun! ExecutePythonNewBuffer()
    " SOURCE [reusable window]: https://github.com/fatih/vim-go/blob/master/autoload/go/ui.vim

    " Check if version specified
    let l:version = getline(1)[2:]
    if str2nr(l:version, 10) != 0 && l:version[0:0] == "3"
        let l:use_version = 1
    else
        let l:use_version = 0
    end


    " save and reload current file
    silent exe "update | edit"
    
    " add the console output
    silent exe "cd %:p:h"

    " get file path of current file
    let s:current_buffer_file_path = expand("%")

    let s:output_buffer_name = "Python Output"
    " let s:output_buffer_name = ">>> Python Output for " . s:current_buffer_file_path
    let s:output_buffer_filetype = "markdown"

    " reuse existing buffer window if it exists otherwise create a new one
    if !exists("s:buf_nr") || !bufexists(s:buf_nr)
        silent exe 'botright new ' . s:output_buffer_name
        let s:buf_nr = bufnr('%')
    elseif bufwinnr(s:buf_nr) == -1
        silent exe 'botright new'
        silent exe s:buf_nr . 'buffer'
    elseif bufwinnr(s:buf_nr) != bufwinnr('%')
        silent exe bufwinnr(s:buf_nr) . 'wincmd w'
    endif


    silent exe "setlocal filetype=" . s:output_buffer_filetype
    " silent exe "setlocal filetype=text"
    setlocal bufhidden=delete "When buffer is closed, it is deleted
    setlocal buftype=nofile "Tells vim this buffer isn't related to a file and won't be written
    setlocal noswapfile "Prevents a swap file being created
    setlocal nobuflisted "Buffer won't show up in list of buffers
    setlocal winfixheight "Keeps window height the same as other buffers are opened/closed
    setlocal cursorline " make it easy to distinguish
    " setlocal nonumber
    setlocal norelativenumber "Line numbering is ordered, not relative
    setlocal wrap linebreak "Lines wrap so everything is visible. VERY IMPORTANT FOR ERROR OUTPUT
    setlocal showbreak="" "String to put at the start of lines that have been broken

    " clear the buffer
    setlocal noreadonly
    setlocal modifiable
    %delete _

    let l:env = "virtual"
    if filereadable("env/pyvenv.cfg") == 1
        silent exe ".!source env/bin/activate&&python3 " . shellescape(s:current_buffer_file_path, 2)

    elseif filereadable("../env/pyvenv.cfg") == 1
        silent exe ".!source ../env/bin/activate&&python3 " . shellescape(s:current_buffer_file_path, 2)

    elseif filereadable("../../env/pyvenv.cfg") == 1
        silent exe ".!source ../../env/bin/activate&&python3 " . shellescape(s:current_buffer_file_path, 2)

    elseif filereadable("../../../env/pyvenv.cfg") == 1
        silent exe ".!source ../../../env/bin/activate&&python3 " . shellescape(s:current_buffer_file_path, 2)

    else
        if l:use_version == 1
            silent exe ".!python" . l:version . " " . shellescape(s:current_buffer_file_path, 2)
            let l:env = "global " . l:version
        else
            silent exe ".!python3 " . shellescape(s:current_buffer_file_path, 2)
            let l:env = "global"
        end
    endif

    exe 'normal! ggO'
    " call setline(".", "'----- PYTHON OUTPUT FOR " . s:current_buffer_file_path . " -----'")

    " resize window to content length
    if line('$') < 3
        silent exe 'resize 10'
    elseif line('$') < 30
        silent exe 'resize' . (line('$') + 3)
    else
        silent exe 'resize 33' 
    endif

    " make the buffer non modifiable
    setlocal readonly
    setlocal nomodifiable

    " Disable diagnostics
    silent exe "lua vim.diagnostic.disable(0)"

    " Move cursor back to original buffer
    silent exe "call feedkeys('\<c-w>\<c-p>')"

    echo "Executed in " . l:env . " environment"
    " echo "SUCCESSFUL"

endfun

