;;==========================================
;; Author:  JeremyHe
;; Version: 1.0
;; Email: jeremyhe.cn@gmail.com
;; Blog: http://J-Cn.me
;; Last_modify: 2015-02-13
;; Description: Install el-get
;;==========================================

(add-to-list 'load-path (expand-file-name "el-get/el-get" user-emacs-directory))

(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))

;; 插件 package
(el-get-bundle yasnippet)
(el-get-bundle auto-complete)
(el-get-bundle tabbar)
(el-get-bundle switch-window)
(el-get-bundle smex)
(el-get-bundle helm)
(el-get-bundle projectile)

(el-get 'sync)
(provide 'init-el-get)
