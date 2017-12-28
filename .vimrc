"==========================================
" Author:  JeremyHe
" Version: 1.0
" Email: jeremyhe.cn@gmail.com
" Blog: http://www.zlv.me
" Last_modify: 2016-11-20 21:47  
" Sections:
"       -> Initial Plugin 加载插件
"       -> General Settings 基础设置
"       -> Display Settings 展示/排版等界面格式设置
"       -> FileEncode Settings 文件编码设置
"       -> Others 其它配置
"       -> HotKey Settings  自定义快捷键
"       -> FileType Settings  针对文件类型的设置
"       -> Theme Settings  主题设置
"       -> Function 一些有用的函数
"
"       -> 插件配置和具体设置在vimrc.bundles中
"==========================================
 
" Modify leader 修改leader键
let mapleader=','
let g:mapleader=','

"==========================================
" Initial Plugin 加载插件
"==========================================

" install Vundle bundles 安装Vundle插件管理
if filereadable(expand("~/.vim/bundles.vimrc"))
  source ~/.vim/bundles.vimrc
endif


"==========================================
" General Settings 基础设置
"==========================================

set shortmess=atI       	" 启动的时候不显示那个援助索马里儿童的提示

syntax on					" Enable Syntax 开启语法高亮

set history=700			" history 历史存储容量

filetype on					" filetype detect 检测文件类型

filetype indent on			" 针对不同的文件类型采用不同的缩进格式

filetype plugin on			" 允许插件

filetype plugin indent on	" 启动自动补全

set autoread          		" 文件修改之后自动载入。

set nobackup				" no backup 取消备份

set noswapfile				" 关闭交换文件

" Configure backspace so it acts as it should act
"set backspace=eol,start,indent
" set whichwrap+=<,>,h,l		" 允许backspace和光标键跨越行边界

" set viminfo+=!				" 保存全局变量

" 自动补全
":inoremap " ""<ESC>i
":inoremap ' ''<ESC>i


"==========================================
" Display Settings 展示/排版等界面格式设置
"==========================================

set t_Co=256				" force Vim into 256 color mode 强制使用256颜色，保证在终端中能够正常显示

" winpos 400 100				" 设置启动时的位置

" set lines=40				" 设置启动时默认行数

" set co=150					" 设置启动时默认列数

if has('gui')
	set guioptions-=T		" GUI隐藏工具栏
	"set guifont=Ubuntu\ Mono\ 12 " 设置字体
endif

set ruler					" show ruler 显示标尺

set number					" 显示行号

set showcmd					" 在状态栏显示正在输入的命令

set showmode				" 左下角显示当前vim模式

set scrolloff=10			" 在上下移动光标时，光标的上方或下方至少会保留显示的行数

set showmatch				" 高亮显示匹配的括号
set matchtime=2			" 匹配括号高亮的时间（单位是十分之一秒）

set cursorline              " 突出显示当前行
autocmd InsertLeave * se nocul  " 离开插入模式时取消高亮  
autocmd InsertEnter * se cul    " 进入插入模式时用浅色高亮当前行  

" statusline settings 状态行显示的内容 
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%Y/%m/%d\ -\ %H:%M\")}    
set laststatus=2    		" 启动显示状态行(1),总是显示状态行(2)  

"设置文内智能搜索提示
set hlsearch				" 高亮search命中的文本
set incsearch				" 打开增量搜索模式,随着键入即时搜索
set ignorecase				" 搜索时忽略大小写

" 代码折叠
set foldenable				" 允许折叠
set foldlevel=99
set foldmethod=manual		" 折叠方法
							" manual    手工折叠
							" indent    使用缩进表示折叠
							" expr      使用表达式定义折叠
							" syntax    使用语法定义折叠
							" diff      对没有更改的文本进行折叠
							" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
							
" indent settings 缩进设置
set smartindent   			" Smart indent
set autoindent    			" 打开自动缩进

" tab settings tab相关变更
set tabstop=4     		" 设置Tab键的宽度
set shiftwidth=4  		" 每一次缩进对应的空格数
set smarttab      			" insert tabs on the start of a line according to shiftwidth, not tabstop
set softtabstop=4 		" 按退格键时可以一次删掉 4 个空格
"set noexpandtab			" 不要用空格代替制表符 执行:%retab可进行替换
set expandtab				" 用空格代替制表符
set shiftround    			" 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'



"==========================================
" FileEncode Settings 文件编码,格式
"==========================================

set encoding=utf-8		" 设置新文件的编码为 UTF-8

set fileencoding=utf-8
							" 自动判断编码时，依次尝试以下编码：
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

set termencoding=utf-8	" 这句只影响普通模式 (非图形界面) 下的 Vim。



"==========================================
" others 其它设置
"==========================================

if filereadable(expand("~/_vimrc"))
	autocmd! bufwritepost _vimrc source % 	" vimrc文件修改之后自动加载。 windows。
endif
if filereadable(expand("~/.vimrc"))
	autocmd! bufwritepost .vimrc source % 	" vimrc文件修改之后自动加载。 linux。
endif

set completeopt=longest,menu			" 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)

set wildmenu							" 增强模式中的命令行自动完成操作
set wildignore=*.o,*~,*.pyc,*.class	" Ignore compiled files 忽略补全以下文件

" 上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"==========================================
" HotKey Settings  自定义快捷键设置
"==========================================
if filereadable(expand("~/.vim/hotkey.vimrc"))
  source ~/.vim/hotkey.vimrc
endif


"==========================================
" FileType Settings  与文件类型相关的设置
"==========================================

" 定义函数AutoSetFileHead，自动插入文件头
autocmd BufNewFile *.cpp,*.[ch],*.java,*.sh,*.py exec ":call AutoSetFileHead()"
function! AutoSetFileHead()
	" cpp 文件
	if &filetype == 'cpp'
		call setline(1, "#include<iostream>")
		call append(line(".")+1, "using namespace std;")
		call append(line(".")+2, "")
	endif
	
	" c 文件
	if &filetype == 'c'
		call setline(1, "#include<stdio.h>")
		call append(line(".")+1, "")
	endif

    " 如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
    endif

    " 如果文件类型为python
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python")
        call append(1, "\# encoding: utf-8")
		call append(1+2, "####################################################")
		call append(1+3, "#  File Name: ".expand("%"))
		call append(1+4, "#  Author: JeremyHe")
		call append(1+5, "#  Email: jeremyhe.cn@gmail.com")
		call append(1+6, "#####################################################")
    endif
    
    " Add Author Info 添加作者信息
    if &filetype == 'sh' 
		call append(line("."), "")
		call append(line(".")+1, "")
		call append(line(".")+2, "\#########################################################################") 
		call append(line(".")+3, "\# File Name: ".expand("%"))
		call append(line(".")+4, "\# Author: JeremyHe")
		call append(line(".")+5, "\# Email: jeremyhe.cn@gmail.com")
		call append(line(".")+6, "\# Created Time: ".strftime("%c"))
		call append(line(".")+7, "\# Descripteion: ")
		call append(line(".")+8, "\#########################################################################")
	endif

    normal G
    normal o
endfunc

" F10 to run python script
nnoremap <buffer> <F10> :exec '!python' shellescape(@%, 1)<cr>



"==========================================
" Theme Settings  主题设置
"==========================================
syntax enable
set background=light
let g:solarized_termcolors=256
colorscheme solarized
hi link EasyMotionTarget Search
hi link EasyMotionTarget2First Search
hi link EasyMotionTarget2Second Search
hi link EasyMotionShade Comment


"==========================================
" Function 一些有用的函数
"==========================================
if filereadable(expand("~/.vim/func.vimrc"))
	source ~/.vim/func.vimrc
endif







