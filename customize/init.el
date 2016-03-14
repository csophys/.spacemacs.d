;; my customize init configure

;; define global variable



(add-to-list 'load-path user-customize-directory)

;; define global environment function
(require 'customize-envrionment)

(require 'customize-osx-keys)


;; define customize with org
(require 'customize-org)
;;自定义的字体设置在~/.spacemacs中

;;设置自定义的文件浏览功能
(require 'customize-edit)

;;设置multiple-occure
(add-to-list 'load-path (concat user-customize-directory "multiple-cursors.el"))
(require 'multiple-cursors)

;;自定义stateBar 时间显示
(require 'customize-time)
