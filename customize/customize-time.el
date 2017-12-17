;;时间显示设置
;;启用时间显示设置，在minibuffer上面的那个杠上
(display-time-mode 1) 
;;时间使用24小时制
(setq display-time-24hr-format t)
;;时间显示包括日期和具体时间
(setq display-time-day-and-date t)
;;时间的变化频率
(setq display-time-interval 10)
;;显示时间的格式
(setq display-time-formatk "%H:%M")

(provide 'customize-time)

