autocmd BufEnter * lua require'completion'.on_attach()

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:completion_matching_ignore_case = 0

" let g:completion_chain_complete_list = [
"     \{'complete_items': ['lsp', 'path', 'buffer']},
"     \{'mode': '<c-p>'},
"     \{'mode': '<c-n>'}
" \]
