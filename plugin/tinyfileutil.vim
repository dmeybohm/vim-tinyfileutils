" TODO check if these are mapped already

" Create a file in the same directory as the current one:
nmap <unique> <silent> <Leader>fc :call tinyfileutil#CreateFile()<CR>

" Duplicate a file in the same directory:
nmap <unique> <silent> <Leader>fd :call tinyfileutil#DuplicateFile()<CR>

" Delete a file and its buffer, asking for confirmation:
nmap <unique> <silent> <Leader>fr :call tinyfileutil#RemoveFile()<CR>
