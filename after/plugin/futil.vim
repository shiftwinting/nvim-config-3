


function! GetAllSnippets()
  call UltiSnips#SnippetsInCurrentScope(1)
  let list = []
  for [key, info] in items(g:current_ulti_dict_info)
    let parts = split(info.location, ':')
    call add(list, {
      \"key": key,
      \"path": parts[0],
      \"linenr": parts[1],
      \"description": info.description,
      \})
  endfor
  return list
endfunction


function Test1()
let snippetsList = UltiSnips#SnippetsInCurrentScope()
echo snippetsList
endfunction

function Test2()
  let snippetsList = UltiSnips#SnippetsInCurrentScope(1)
  echo g:current_ulti_dict_info
endfunction
 

function Rlsp()
lua vim.lsp.stop_client(vim.lsp.get_active_clients())
edit
endfunction

function FindWindowsWithoutFern()
"  this returns an array of the 3 text windows excluding fern drawer
let g:windowArray = []

  for win in getwininfo()
let netrwprofile = win.variables["netrw_prvfile"]

    if netrwprofile == ''
    else
      if (stridx(win.variables["netrw_prvfile"], "fern") == 0)     " dont do anything, skip it
      else
        let g:windowArray += [win.winid]
      endif
    endif
  endfor
return g:windowArray
endfunction




function FocusFern()


  " FIX this is broken. need to get the window handle for the first opened window, should be around 1000. everything else ok
if !exists("g:LastWindowHandle")
echo "lastWindowHandle was nil"
  let g:LastWindowHandle = win_getid(1)
endif  


if CheckIfFernActive() == 1
 " echo "1 window handle is: " . g:LastWindowHandle
lua vim.api.nvim_set_current_win(vim.g.LastWindowHandle)
else
" let LastWindowID = winnr()
let g:LastWindowHandle = win_getid()
" echo "0 window handle is: " . g:LastWindowHandle
call ActivateFern()
endif
endfunction


function ActivateFern()
for buf in getbufinfo()

  " echo buf.name
  if stridx(buf.name, "fern") == 0
  let g:fernWindowHandle = bufwinid(buf.bufnr)
  " echo g:fernWindowHandle
  lua vim.api.nvim_set_current_win(vim.g.fernWindowHandle)
endif
endfor
endfunction

function CheckIfFernActive()
let currentBufferName = bufname("%")
if stridx(currentBufferName, "fern") == 0
return 1
else
return 0
endif

endfunction



function Telescope(path, action)
let g:action = a:action

if &ft == 'fern'
call FernGetCurrentPath()
lua require("plugin/teleconfig").myFunc(vim.g.path, vim.g.action)
else
let g:path = a:path
lua require("plugin/teleconfig").myFunc(vim.g.path, vim.g.action)
endif
return
endfunction





function FernGetCurrentPath()
let helper = fern#helper#new()
let node = helper.sync.get_cursor_node()
"echo node.bufname
let g:path = node.bufname
let g:path = substitute(g:path, "fern:///file:///", "", "")
let g:path = substitute(g:path, '\$', "", "")
let g:path = substitute(g:path, "fern://drawer:1/file:///", "", "")
" let g:path = substitute(g:path, '\\$', '', '')[:-2]
"let g:path = strpart("abcdefg", -2, 2)
let g:path = trim(g:path)

" REMEMBER path isnt returned because global variable is set that lua can read

endfunction

function! GetVisualSelection()
    if mode()=="v"
        let [line_start, column_start] = getpos("v")[1:2]
        let [line_end, column_end] = getpos(".")[1:2]
    else
        let [line_start, column_start] = getpos("'<")[1:2]
        let [line_end, column_end] = getpos("'>")[1:2]
    end

    if (line2byte(line_start)+column_start) > (line2byte(line_end)+column_end)
        let [line_start, column_start, line_end, column_end] =
        \   [line_end, column_end, line_start, column_start]
    end
    let lines = getline(line_start, line_end)
    if len(lines) == 0
            return ['']
    endif
    if &selection ==# "exclusive"
        let column_end -= 1 "Needed to remove the last character to make it match the visual selction
    endif
    if visualmode() ==# "\<C-V>"
        for idx in range(len(lines))
            let lines[idx] = lines[idx][: column_end - 1]
            let lines[idx] = lines[idx][column_start - 1:]
        endfor
    else
        let lines[-1] = lines[-1][: column_end - 1]
        let lines[ 0] = lines[ 0][column_start - 1:]
    endif
   " echo lines
    " return lines
    "use this return if you want an array of text lines
    return join(lines, "\n") "use this return instead if you need a text block
endfunction
