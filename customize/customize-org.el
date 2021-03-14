;;customize-org
;;global keys for agenda things
(define-key global-map "\C-ca" 'org-agenda)
;;设置查询当前笔记的快捷搜索快捷键
(define-key global-map "\C-cs" 'helm-org-rifle-agenda-files)

(setq org-export-backends (quote (ascii html icalendar latex md)))

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
         "* %?\nEntered on %U\n  %i\n")
        ))

;;发布org
(require 'ox-publish)

(setq org-publish-project-alist
      '(
        ("org-notes"
         :base-directory "/Users/csophys/Library/Mobile Documents/com~apple~CloudDocs/职业能力提升/知识传播/blogSite/src"
         :base-extension "org"
         :publishing-directory "/Users/csophys/Library/Mobile Documents/com~apple~CloudDocs/职业能力提升/知识传播/blogSite"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4             ; Just the default for this project.
         :auto-preamble t
         )
        ("org-static"
         :base-directory "/Users/csophys/Library/Mobile Documents/com~apple~CloudDocs/职业能力提升/知识传播/blogSite/src" 
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "/Users/csophys/Library/Mobile Documents/com~apple~CloudDocs/职业能力提升/知识传播/blogSite"
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

;;增加日历TODO提醒功能,需要mac安装下terminal-notifier工具。
(require 'appt)
(setq appt-time-msg-list nil)    ;; clear existing appt list
(setq appt-display-interval '5)  ;; warn every 5 minutes from t - appt-message-warning-time
(setq
   appt-message-warning-time '15  ;; send first warning 15 minutes before appointment
   appt-display-mode-line nil     ;; don't show in the modeline
   appt-display-format 'window)   ;; pass warnings to the designated window function
(appt-activate 1)                ;; activate appointment notification
(display-time)                   ;; activate time display

(org-agenda-to-appt)             ;; generate the appt list from org agenda files on emacs launch
(run-at-time "24:01" 3600 'org-agenda-to-appt)           ;; update appt list hourly
(add-hook 'org-finalize-agenda-hook 'org-agenda-to-appt) ;; update appt list on agenda view

(defun my-appt-display (min-to-app new-time msg)
    (notify-osx
     (format "Appointment in %s minutes" min-to-app)   ;; passed to -title in terminal-notifier call
     (format "%s" msg))                                ;; passed to -message in terminal-notifier call
    ;;通过emacs buffer方式进行提醒。
    (appt-disp-window min-to-app new-time msg)
    )
(setq appt-disp-window-function (function my-appt-display))


;;调用命令行工具进行提醒。
(defun notify-osx (title message)
  (call-process "terminal-notifier"
                nil 0 nil
                "-group" "Emacs"
                "-title" title
                "-sender" "org.gnu.Emacs"
                "-message" message
                "-activate" "oeg.gnu.Emacs"))


;;设置org-download的图片文件地址
(setq-default org-download-image-dir "./img")

(provide 'customize-org)

