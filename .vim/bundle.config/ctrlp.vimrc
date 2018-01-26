Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<leader>cp'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
" MacOSX/Linux
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     
" Windows
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
"  \ 'link': 'some_bad_symbolic_links',
nmap <leader>cm :CtrlPMRUFiles<CR>

let g:ctrlp_user_command = 'find %s -type f' " MacOSX/Linux
" let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d' " Windows
