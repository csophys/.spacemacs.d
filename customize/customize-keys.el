(when *is-a-mac*
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'meta)
  (setq default-input-method "MacOSX")
  ;; Make mouse wheel / trackpad scrolling less jerky
  (setq mouse-wheel-scroll-amount '(0.001))
)

;;常用的自定义快捷键绑定，策略是和JetBrain的尽量保持一致，降低同时使用带来的问题。
;;重命名文件名
(global-set-key (kbd "S-<f6>") 'dired-do-rename) 

;;增量选择功能
(global-set-key (kbd "M-s") 'er/expand-region)

;;ace-jump
(global-set-key (kbd "M-j") 'avy-goto-char)

;;快速唤起shell
(global-set-key (kbd "M-<f12>") 'shell)

;;增大字体
(global-set-key (kbd "M-=") 'spacemacs/scale-up-font)

;;缩小字体
(global-set-key (kbd "M--") 'spacemacs/scale-down-font)

;;还原字体,M-0被Treemacs占用了，只能降级使用C-0
;;TODO 怎么能够占用M-0的快捷键，待研究
(global-set-key (kbd "C-0") 'spacemacs/reset-font-size)


;;光标全部定位和当前选中区域一样的文本
(global-set-key (kbd "M-G") 'mc/mark-all-like-this)

;;光标定位下一个和当前选中区域一样的文本
(global-set-key (kbd "M-g") 'mc/mark-next-like-this)


(provide 'customize-keys)
