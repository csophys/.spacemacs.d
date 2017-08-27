;;customize-envrionment ---csophys

;; TODO auto insert author info

(defconst *is-a-mac* 
  (string-equal system-type "darwin"))

(defconst *is-dpmac-pro*
  (string< "" (shell-command-to-string "ifconfig | grep 98:01:a7:98:52:8b")))

(provide 'customize-envrionment)
