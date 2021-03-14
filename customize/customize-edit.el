;;提供基本的文件浏览功能
;;增量选择功能
(define-key global-map "\M-s" 'er/expand-region)

;;重命名文件名
(global-set-key (kbd "S-<f6>") 'dired-do-rename) 

;;删除选择的内容
(delete-selection-mode 1)


;;ace-jump
;;启用中文的搜索
(ace-pinyin-global-mode t)
(define-key global-map "\M-j" 'avy-goto-char)
;;occur 绑定
(define-key global-map "\M-o" 'occur)

;;(global-set-key (kbd "C-<f12>") 'magit-status)
;;shell绑定
(global-set-key (kbd "M-<f12>") 'shell)

;字体变化
(global-set-key  (kbd "C-+") 'spacemacs/scale-up-font)

;;multiple-cursors
(global-set-key "\M-g" 'mc/mark-all-like-this)

(global-set-key "\M-n" 'mc/mark-next-like-this)

;use-package，强制覆盖其他minor-mode
(bind-key* "C-_" 'spacemacs/scale-down-font)


;;复制当前行
(defun duplicate-current-line (&optional n)
  "duplicate current line, make more than 1 copy given a numeric argument"
  (interactive "p")
  (save-excursion
    (let ((nb (or n 1))
          (current-line (thing-at-point 'line)))
      ;; when on last line, insert a newline first
      (when (or (= 1 (forward-line 1)) (eq (point) (point-max)))
        (insert "\n"))
      
      ;; now insert as many time as requested
      (while (> n 0)
        (insert current-line)
        (decf n)))))

;;启用中英文智能输入的编辑模式
(use-package sis
  ;; :hook
  ;; enable the /follow context/ and /inline region/ mode for specific buffers
  ;; (((text-mode prog-mode) . sis-context-mode)
  ;;  ((text-mode prog-mode) . sis-inline-mode))

  :config
  ;; For MacOS
  (sis-ism-lazyman-config
   
   ;; English input source may be: "ABC", "US" or another one.
    "com.apple.keylayout.ABC"
   ;;"com.apple.keylayout.US"
   ;; Other language input source: "rime", "sogou" or another one.
    ;; "im.rime.inputmethod.Squirrel.Rime"
   "com.sogou.inputmethod.sogou.pinyin")
  ;; enable the /cursor color/ mode
(sis-global-cursor-color-mode t)
  ;; enable the /respect/ mode
  (sis-global-respect-mode t)
  ;; enable the /context/ mode for all buffers
  (sis-global-context-mode t)
  ;; enable the /inline english/ mode for all buffers
  (sis-global-inline-mode t)

  (setq sis-do-set (lambda(source) (start-process "set-input-source" nil "macism" source "50000"))
	      sis-other-cursor-color "red" ; 中文光标色
        )
  )
(provide 'customize-edit)
