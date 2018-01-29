" ########### markdown ########### 
Plugin 'godlygeek/tabular' 
Plugin 'plasticboy/vim-markdown'
" Disable Folding
let g:vim_markdown_folding_disabled = 1
" Disable Default Key Mappings
let g:vim_markdown_no_default_key_mappings=1
" Enable TOC window auto-fit
let g:vim_markdown_toc_autofit = 1
" YAML Front Matter
let g:vim_markdown_frontmatter = 1
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} nmap <F9> :Toc<CR>
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} imap <F9> <ESC>:Toc<CR>

" ######### markdown table support ###########
Plugin 'dhruvasagar/vim-table-mode'
let g:table_mode_corner = '|'
" let g:table_mode_delimiter = '  '

" 实时预览
"Plugin 'suan/vim-instant-markdown'
" 需要先安装 sudo npm -g install instant-markdown-d

" Plugin 'iamcco/markdown-preview.vim'
"  MarkdownPreview
" open preview window in markdown buffer
" MarkdownPreviewStop
" close the preview window and server
