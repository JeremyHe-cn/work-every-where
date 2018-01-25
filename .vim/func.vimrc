"==========================================
" Author:  JeremyHe
" Version: 2.0
" Email: jeremyhe.cn@gmail.com
" Blog: http://www.zlv.me
" Last_modify: 2016-11-20 21:23  
" Description: 一些有用的函数
"==========================================

" 返回一个星期的开始时间，每周以周一开始"
func! GetWeekBegin()
	let wDiff = GetWeekDiff()
	return strftime("%F",localtime()-wDiff*86400)
endfunc

" 返回一个工作星期的结束时间，即星期五"
func! GetFridayDate()
	let wDiff = GetWeekDiff()
	return strftime("%F",localtime()-(wDiff-4)*86400)
endfunc

" 返回本周工作时间"
func! GetWorkDateRange()
	return GetWeekBegin() . ' -- ' . GetFridayDate()
endfunc


" 重新映射时间：0为星期一，6为星期天"
func! GetWeekDiff()
	let w = strftime('%w')
	return (w-1+7)%7
endfunc

" 编译
func! RunCompile()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "! ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "! ./%<"
	elseif &filetype == 'java' 
		exec "!javac %" 
		exec "!java %<"
	elseif &filetype == 'sh'
		:!./%
	endif
endfunc
 
