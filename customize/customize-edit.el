;;提供基本的文件浏览功能

;;增量选择功能
(define-key global-map "\M-s" 'er/expand-region)

;;重命名文件名
(global-set-key (kbd "S-<f6>") 'dired-do-rename) 

;;删除选择的内容
(delete-selection-mode 1)


;;ace-jump
(define-key global-map "\M-j" 'avy-goto-char)
;;occur 绑定
(define-key global-map "\M-o" 'occur)

;;shell绑定
(global-set-key (kbd "C-<f12>") 'magit-status)
(global-set-key (kbd "M-<f12>") 'shell)

;字体变化
(global-set-key  (kbd "C-+") 'spacemacs/scale-up-font)

;;multiple-cursors
(global-set-key "\M-g" 'mc/mark-all-like-this)

(global-set-key "\M-n" 'mc/mark-next-like-this)


(provide 'customize-edit)
