"==========================================
" Author:  JeremyHe
" Email: jeremyhe.cn@gmail.com
" Blog: http://www.alzz.me
" Last_modify: 2018-01-25 17:27   
" Description: 独立出快捷键的设置
"==========================================

"==========================================
" HotKey Settings  自定义快捷键设置
"==========================================

" Modify leader 修改leader键
let mapleader=','
let g:mapleader=','

" F1 废弃这个键,防止调出系统帮助
noremap <F1> <Esc>"				
" inoremap gg <Esc>
" inoremap JJ <Esc>

" F5 执行或编译
map <F5> :call RunCompile()<CR>	

" F12 缩进，格式化代码
map <F12> gg=G					

",ee 快速打开配置文件
map <silent> <leader>ee :e ~/.vimrc<cr>	

" ,w 快速保存
nmap <leader>w :w!<cr>		

" ,q 快速退出
nmap <leader>q :q!<cr>		

" Copy All 映射全选+复制 ctrl+a
map <C-A> ggVG"+Y
map! <C-A> <Esc>ggVG"+Y
" Copy 选中状态下 Ctrl+c 复制
vmap <C-c> "+y				
" Past At Insert Mode 插入模式下Ctrl+v 粘贴剪贴板内容
imap <C-v> <Esc>"+p<Esc>a	
" 选中状态下粘贴
vmap p "_xp
" map 空格 为 " ，方便使用寄存器
map <space> "

"插入模式下Ctrl+h,j,k,l为方向
imap <C-h> <Esc>ha
imap <C-j> <Esc>ja
imap <C-k> <Esc>ka
imap <C-l> <Esc>la

"Ctrl+g为取消,类似Emacs
imap <C-g> <Esc>
vmap <C-g> <Esc>

"上下移动指定行
map <M-j> ddp
map <M-k> ddkP

" Smart way to move between windows 分屏窗口移动
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" quick resize windows  
nmap < <C-W><
nmap > <C-W>>
nmap - <C-W>-
nmap + <C-W>+

" Go to home and end using capitalized directions 使用H和L跳到行首和行尾，原本H和L的功能废弃
nnoremap H ^
vnoremap H ^
nnoremap L $
vnoremap L $
imap HH <Esc>I
" imap LL <Esc>A conflict with NULL

" 分号快速进入命令模式
nnoremap ; :

" tab navigate 标签页导航相关操作
map <leader>tn :tabnext<cr>
map <leader>tp :tabprev<cr>

map <leader>te :tabedit<cr>
map <leader>tc :tabclose<cr>

" normal模式下切换到确切的tab
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt

" Toggles between the active and last active tab 在当前tab页和前一个tab页之间快速切换
let g:last_active_tab=1
nnoremap <silent> <leader>tt :execute 'tabnext ' . g:last_active_tab<cr>
vnoremap <silent> <leader>tt :execute 'tabnext ' . g:last_active_tab<cr>
autocmd TabLeave * let g:last_active_tab=tabpagenr()

" using Ctrl+t for tabnew  新建tab标签页
nnoremap <C-t> :tabnew<CR>	
inoremap <C-t> <Esc>:tabnew<CR>

" 添加时间
nnoremap <C-d> "=strftime("%F %T")<CR>gP
inoremap <C-d> <C-R>=strftime("%F %T")<CR>
ab d; <c-r>=strftime('%Y-%m-%d %H:%M')<cr> 
ab d-; <c-r>=strftime('%Y-%m-%d')<cr> 
ab d/; <c-r>=strftime('%Y/%m/%d')<cr> 
ab ww; <c-r>=GetWorkDateRange()<cr> 

" 添加文件名和文件路经
ab fn; <c-r>=expand('%:p:t')<cr> 
ab fp; <c-r>=expand('%:p')<cr> 

" flow
ab o; =>operation:
imap <C-o> <Esc>ao; 

" Markdown
"" 加粗
vmap <C-b> s**<Esc>pa**
"" 斜体
vmap <C-i> s*<Esc>pa*
"" 变成链接
vmap <C-u> s[<Esc>pa]()<Esc>i
"" 换行
imap <C-b> <br/>
imap <S-CR> <Esc>a  <CR>
"" code
vmap ` s`<Esc>pa`

