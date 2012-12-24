" Create a file in the same directory as the current one:
command! TinyFileUtilsCreateFile call tinyfileutils#CreateFile()

" Duplicate a file in the same directory:
command! TinyFileUtilsDuplicateFile call tinyfileutils#DuplicateFile()

" Delete a file and its buffer, asking for confirmation:
command! TinyFileUtilsRemoveFile call tinyfileutils#RemoveFile()
