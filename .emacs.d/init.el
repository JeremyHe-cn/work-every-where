;;==========================================
;; Author:  JeremyHe
;; Version: 1.0
;; Email: jeremyhe.cn@gmail.com
;; Blog: http://J-Cn.me
;; Last_modify: 2015-02-06
;;==========================================

;; add lisp to load path
;; call require function to load other files in lisp dir
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "plugin" user-emacs-directory))

;;------------------------------------------
;; Load configs for specific features and modes from lisp dir
;;------------------------------------------
(require 'init-el-get)
(require 'init-common)
(require 'init-useful-function)
(require 'init-ace-jump)
(require 'init-yasnippet)
(require 'init-auto-complete)
(require 'init-tabbar)
(require 'init-ido)
(require 'init-switch-window)
(require 'init-helm)
(require 'init-projectile)

(provide 'init)




