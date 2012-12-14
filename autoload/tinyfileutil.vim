func! s:GetCurrentExtension()
  let ext = expand("%:e")
  if len(ext) > 0
    let ext = '.' . ext
  endif
  return ext
endfunc

func! tinyfileutil#CreateFile()
  let prefix = expand("%:h")
  let ext = s:GetCurrentExtension()
  let name = input("New filename with extension '" . ext . "': ", expand("%:t:r"), "file")
  let newfile = prefix . '/' . name . ext
  if filereadable(newfile)
    echoerr "File " . newfile . " already exists!"
    return
  endif
  new `=newfile`
  startinsert
endfunc

func! tinyfileutil#DuplicateFile()
  let prefix = expand("%:h")
  let ext = s:GetCurrentExtension()
  let name = input("New filename with extension '" . ext . "': ", expand("%:t:r"), "file")
  let oldfile = expand("%")
  let newfile = prefix . '/' . name . ext
  if filereadable(newfile)
    echoerr "File " . newfile . " already exists!"
    return
  endif
  new `=newfile`
  read `=oldfile`

  " Start at first line, delete extra line:
  1
  normal dd
  update
endfunc

func! tinyfileutil#RemoveFile()
  let path = expand("%")
  let confirmation = inputdialog("Are you sure you want to delete '" . path . "' [y/n]? ")
  if confirmation == "y"
    let output = system("rm '" . shellescape(path)."'")
    if v:shell_error != 0
      echoerr "Error deleting '" . path . "'."
    else
      echomsg "Deleted '" . path . "'."
    endif
    bdelete!
  else
    echomsg "Delete cancelled."
  endif
endfunc

