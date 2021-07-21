" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}

" Define a separator
let g:which_key_sep = '→ '

" No floating window
let g:which_key_use_floating_win = 0

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
            \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" LSP
let g:which_key_map.l = {
            \ 'name' : 'lsp',
            \ 'n' : "rename",
            \ 'd' : "definition",
            \ 'D' : "declaration",
            \ 'y' : "type definition",
            \ 'i' : "implementation",
            \ 'r' : "references",
            \ 'j' : "next diagnostic",
            \ 'k' : "previous diagnostic",
            \ 'a' : "action",
            \}

" Telescope
let g:which_key_map.f = {
            \ 'name' : 'fuzzy finder (telescope)',
            \ 'f' : "files",
            \ 'g' : "git files",
            \ 'r' : "grep",
            \ 'b' : "buffers",
            \ 'm' : 'bookmarks',
            \ 'c' : 'colorscheme',
            \ 'h' : 'history'
            \}

" NERDCommenter
let g:which_key_map.c = {
            \'name' : 'NERDCommenter',
            \ 'c' : "comment",
            \ 'i' : "invert",
            \ 'u' : "uncomment",
            \ 's' : "sexy",
            \ 'n' : "nested",
            \ '$' : "to end of line",
            \ 'm' : "minimal"
            \ }

" Session (from dashboard)
let g:which_key_map.s = {
            \ 'name' : 'Session',
            \ 's' : 'save',
            \ 'l' : 'load'
            \ }

" Markdown
autocmd FileType markdown let g:which_key_map.m = {
            \'name' : 'markdown',
            \ 'p' : "to pdf",
            \ 'v' : "visualize",
            \}

" Register which key map
call which_key#register('<Space>', "g:which_key_map")
