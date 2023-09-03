;; my customize init configure
;; define global variable

(add-to-list 'load-path user-customize-directory)

;; define global environment function
(require 'customize-envrionment)
(require 'customize-keys)

;;define customize with org
;;(require 'customize-org)
;;自定义的字体设置在~/.spacemacs中

;;设置自定义的文件浏览功能
(require 'customize-edit)

;;加载cnblogs 博客发布，暂时放弃在博客园发布博文。
;;(add-to-list 'load-path (concat user-customize-directory "cnblogs"))

;;自定义stateBar 时间显示
;;(require 'customize-time)

;;引入cnblogs
;;(require 'customize-cnblogs)
