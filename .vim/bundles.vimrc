"==========================================
" Author:  JeremyHe
" Version: 1.0
" Email: jeremyhe.cn@gmail.com
" Blog: http://www.J-Cn.me
" Last_modify: 2015-04-15 12:09 
" Description: Vundle插件管理配置文件
" Sections:
"       -> Enable Vundle 启用Vundle插件
"       -> Initial Plugin 加载插件
"==========================================
 
"==========================================
" Enable Vundle 启用Vundle插件
"==========================================
set nocompatible                " be iMproved
filetype off                    " required!
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

"     :PluginInstall     install 安装配置的插件
"     :PluginInstall!    update  更新
"     :PluginClean       remove plugin not in list 删除本地无用插件
Plugin 'VundleVim/Vundle.vim'
Plugin 'L9'

" ######### easymotion 快速导航 ########
source ~/.vim/bundle.config/easymotion.vimrc

" ############ YCM 自动补全 ########"
"source ~/.vim/bundle.config/neocomplete.vimrc
source ~/.vim/bundle.config/ycm.vimrc

" ########## ctrlp 文件搜索 ######
source ~/.vim/bundle.config/ctrlp.vimrc

" ############# FuzzyFinder #########
source ~/.vim/bundle.config/fuzzyfinder.vimrc

" ########## airline 状态栏增强 ########
source ~/.vim/bundle.config/airline.vimrc

" ############# 目录导航 ###########
" ,n 打开目录
" s/v 分屏打开文件
" 当只剩下目录窗口，则自动退出
Plugin 'scrooloose/nerdtree'
map <leader>n :NERDTreeToggle<CR>
let g:NERDTreeMapOpenSplit = 's'
let g:NERDTreeMapOpenVSplit = 'v'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end

" ############# Git目录显示支持 #############"
"Plugin 'Xuyuanp/git-NERDTree'

" ############ Outline 标签导航 ###########
Plugin 'majutsushi/tagbar'
let g:tagbar_autofocus = 1	


" ######### markdown table support ###########
Plugin 'dhruvasagar/vim-table-mode'
let g:table_mode_corner = '|'
let g:table_mode_delimiter = '  '


" ############ 主题 ########### 
Plugin 'altercation/vim-colors-solarized'
let g:solarized_termcolors=256


" ########### 多光标 ########### 
Plugin 'terryma/vim-multiple-cursors'
let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode = 0


" ########### Gundo ########### 
Plugin 'sjl/gundo.vim'

" ########### markdown ########### 
Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_no_default_key_mappings=1
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} nmap <F9> :Toc<CR>
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} imap <F9> <ESC>:Toc<CR>


" ########### 快速注释 ########### 
Plugin 'scrooloose/nerdcommenter'
let NERDCreateDefaultMappings = 0
map <Leader>c<space> <plug>NERDCommenterToggle

" ############ SirVer/ultisnips	############## "
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'	
"" Trigger configuration. Using SuperTab
"let g:UltiSnipsExpandTrigger = "<tab>"
"let g:UltiSnipsJumpForwardTrigger = "<tab>"
"let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"


call vundle#end()            " required
filetype plugin indent on    " required
