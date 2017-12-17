;;customize-org
;;global keys for agenda things
(define-key global-map "\C-ca" 'org-agenda)

(when *is-a-mac*
                                        ;(setq capturePath "~/快盘/document/Dropbox/agenda")
  (setq capturePath "~/Library/Mobile Documents/com~apple~CloudDocs/document/agenda")
  (setq org-default-task-file (concat capturePath "/gtd.org"))
  (setq org-work-task-file (concat capturePath "/workGTD.org"))
  (setq org-default-capture-file (concat capturePath "/capture.org"))
  )
;;设置每个文档位置


(define-key global-map "\C-cc" 'org-capture)

;;capture template
(setq org-capture-templates
      '(
        ("t" "Todo" entry (file+datetree org-default-task-file "Tasks")
         "* TODO %?\n %t")
        ("c" "Capture" entry (file+datetree org-default-capture-file)
         "* %?\nEntered on %U\n  %i\n")
        ("w" "WorkDone" entry (file+datetree org-work-task-file)
         "* TODO %?\nEntered on %U\n  %i\n")
        ))

;;发布org
(require 'ox-publish)
(setq org-publish-project-alist
      '(
        ("org-notes"
         :base-directory "/Users/csophys/微云同步盘/document/Dropbox/blog/blogSite/src"
         :base-extension "org"
         :publishing-directory "/Users/csophys/微云同步盘/document/Dropbox/blog/blogSite"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4             ; Just the default for this project.
         :auto-preamble t
         )
        ("org-static"
         :base-directory "/Users/csophys/微云同步盘/document/Dropbox/blog/blogSite/src"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "/Users/csophys/微云同步盘/document/Dropbox/blog/blogSite/"
         :recursive t
         :publishing-function org-publish-attachment
         )
        ("org" :components ("org-notes" "org-static"))
        ))


(defun my/org-inline-css-hook (exporter)
  "Insert custom inline css to automatically set the
background of code to whatever theme I'm using's background"
  (when (eq exporter 'html)
    (let* ((my-pre-bg (face-background 'default))
           (my-pre-fg (face-foreground 'default)))
      (setq
       org-html-head-extra
       (concat
        org-html-head-extra
        (format "<style type=\"text/css\">\n pre.src {background-color: %s; color: %s;}</style>\n"
                my-pre-bg my-pre-fg))))))

(add-hook 'org-export-before-processing-hook 'my/org-inline-css-hook)

(setq org-todo-keywords
      '((sequence "TODO" "DOING"  "|" "DONE" "STOP" )))


(provide 'customize-org)

