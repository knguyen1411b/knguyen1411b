autocmd Filetype python nnoremap <buffer> <F5> :w<CR>:!python "%"<CR>
autocmd FileType cpp nnoremap <buffer> <F5> :w<CR>:!g++ "%" -o "%<" && "./%<"<CR>