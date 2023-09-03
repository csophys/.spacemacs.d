;;删除选择的内容
(delete-selection-mode 1)

;; overriding image.el function image-type-available-p
(defun image-type-available-p (type)
  "Return t if image type TYPE is available.
Image types are symbols like `xbm' or `jpeg'."
  (if (eq 'svg type)
      nil
    (and (fboundp 'init-image-library)
         (init-image-library type))))

(setq image-types (cons 'svg image-types))


(provide 'customize-edit)
