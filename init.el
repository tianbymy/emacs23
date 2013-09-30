;;;======================================================================
;;; common config
;;; ======================================================================
(setq load-path (cons "~/.emacs.d/lisp" load-path))
;;;--------语言环境字符集设置(utf-8)-------------

(set-language-environment 'Chinese-GB)
(set-keyboard-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-selection-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
(setq-default pathname-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
(setq ansi-color-for-comint-mode t)
;;格式化整个文件函数================================================================
(defun indent-whole ()
  (interactive)
  (indent-region (point-min) (point-max))
  (message "format successfully"))
;;绑定到F7键
(global-set-key [f7] 'indent-whole)

;;设置打开文件的缺省路径
(setq default-directory "~/work")

;;使用emacs 24内嵌的功能
;;(require 'electric)
;;(electric-pair-mode t)

;;font================================================================
(set-face-attribute
 'default nil :font "Monaco 10")

;; Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
		    charset
		    (font-spec :family "Heiti SC" :size 14)))

;; ------------------------- Refresh -------------------------
(defun refresh-file ()
  (interactive)
  (revert-buffer t t t)
  )
(global-set-key [f5] 'refresh-file)
;; ------------------------- Settings -------------------------
(setq default-frame-alist
      '((top . 0) (left . 10) (height . 40) (width . 120) (menu-bar-lines . 20) (tool-bar-lines . 0))) ;;启动时窗口大小
(define-key global-map "\C-c\C-t" 'goto-line);;自定义快速跳转到某行
(define-key global-map "\C-c\C-v" 'ansi-term)
;; settings
(global-linum-mode 1) ; always show line numbers
(setq inhibit-startup-message t);; 关闭启动时闪屏
(setq visible-bell t) ;关闭出错时的提示声
(blink-cursor-mode -1);指针不闪
(setq make-backup-files nil) ;不产生备份文件
(setq default-major-mode 'text-mode) ;一打开就起用 text 模式
(global-font-lock-mode t) ;语法高亮
(auto-image-file-mode t) ;打开图片显示功能
(fset 'yes-or-no-p 'y-or-n-p) ;以 y/n代表 yes/no
(column-number-mode t) ;显示列号
(show-paren-mode t) ;显示括号匹配
(display-time-mode 1) ;显示时间，格式如下
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(mouse-avoidance-mode 'animate);光标靠近鼠标指针时，让鼠标指针自动让开
(setq mouse-yank-at-point t) ;支持中键粘贴
(transient-mark-mode t) ;允许临时设置标记
(setq x-select-enable-clipboard t) ;支持emacs和外部程序的粘贴
(setq frame-title-format '("" buffer-file-name "@emacs" )) ;在标题栏显示buffer名称
(setq default-fill-column 80) ;默认显示 80列就换行
(setq bookmark-save-flag 1) ;保存书签
(add-hook 'before-save-hook 'delete-trailing-whitespace)  ;; 删除行尾部空格
(put 'upcase-region 'disabled nil)
(tool-bar-mode nil) ;去掉那个大大的工具栏
(scroll-bar-mode nil) ;去掉滚动条
(menu-bar-mode nil) ;去掉menu
(setq auto-image-file-mode t)

;;set the color of screen
(set-background-color "#002B36")
(set-foreground-color "wheat")

;; ibuffer
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; ido
(require 'ido)
(ido-mode t)
;;mode================================================================
(require 'slim-mode)
(require 'coffee-mode)
(require 'feature-mode)
(require 'php-mode)
(require 'sass-mode)
(require 'haml-mode)
(require 'inf-caml)
(require 'markdown-mode)
(require 'session)
(require 'slim-mode)
(require 'yaml-mode)
(add-to-list 'load-path
	     "~/.emacs.d/lisp/python")
(setq py-install-directory "~/.emacs.d/lisp/python")
(require 'python-mode)

;; ------------------------- undo mode -------------------------
(require 'undo-tree)
(global-undo-tree-mode)

;; ------------------------- css mode -------------------------

(setq auto-mode-alist
      (append '(("\\.css$" . css-mode))
	      auto-mode-alist))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . sass-mode))
(add-to-list 'load-path
	     "~/.emacs.d/lisp/color-theme")
(require 'color-theme)
(color-theme-initialize)
(require 'tango-dark-theme)
;;(color-theme-oswald) ;; color theme name


;;yasnippet================================================================
(add-to-list 'load-path
	     "~/.emacs.d/lisp/yasnippet")
(require 'yasnippet)
;;(yasnippet/initialize)
;;(yasnippet/load-directory "~/.emacs.d/plugins/yasnippet/snippets")
(yas-global-mode 1)

;; ------------------------- Ruby On Rails -------------------------
;;(setq load-path (cons "~/.emacs.d/emacs-rails" load-path))
;;(require 'rails)
;;; rhtml mode
(add-to-list 'load-path "~/.emacs.d/plugins/rhtml")
(require 'rhtml-mode)
(autoload 'rhtml-mode "rhtml-mode" "RHTML" t)
(add-to-list 'auto-mode-alist '("\\.rhtml$" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.erb$" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.html\.erb$" . rhtml-mode))

(add-to-list 'load-path "~/.emacs.d/lisp/ruby")
(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files")
(autoload 'ruby-mode "ruby-mode" nil t)
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook
	  '(lambda ()
	     (inf-ruby-keys)))
;; If you have Emacs 19.2x or older, use rubydb2x
(autoload 'rubydb "rubydb3x" "Ruby debugger" t)
;; uncomment the next line if you want syntax highlighting
(add-hook 'ruby-mode-hook 'turn-on-font-lock)
;; ------------------------- auto-complete -------------------------
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/auto-complete/ac-dict")
(ac-config-default)


(global-auto-complete-mode t)
(setq-default ac-sources '(ac-source-words-in-same-mode-buffers))
(add-hook 'emacs-lisp-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-symbols)))
(add-hook 'auto-complete-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-filename)))
(set-face-background 'ac-candidate-face "lightgray")
(set-face-underline 'ac-candidate-face "darkgray")
(set-face-background 'ac-selection-face "steelblue") ;;; 设置比上面截图中更好看的背景颜色
(define-key ac-completing-map "\M-n" 'ac-next)  ;;; 列表中通过按M-n来向下移动
(define-key ac-completing-map "\M-p" 'ac-previous)
(setq ac-auto-start 2)
(setq ac-dwim t)
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
;; ------------------sql mode ------------------
(require 'sql-mode)

(autoload 'sql-mode "sql-mode" "SQL Editing Mode" t)
      (setq auto-mode-alist
         (append '(("\\.sql$" . sql-mode)
                   ("\\.proc$" . sql-mode)
                   ("\\.sp$"  . sql-mode))
                 auto-mode-alist))

;; ------------------ 整行  mode ------------------
;;;; C-w 如果没有选中区域则删除整行
;;;; M-w 如果没有选中区域则复制整行
(defadvice kill-ring-save (before slickcopy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))
(defadvice kill-region (before slickcut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))

;; -------------------行未的 ^M ----------------------
(defun dos-unix () (interactive)
   (goto-char (point-min))
   (while (search-forward "\r" nil t) (replace-match "")))
(defun unix-dos () (interactive)
   (goto-char (point-min))
   (while (search-forward "\n" nil t) (replace-match "\r\n")))
;; ------------------zencoding mode ------------------
(require 'zencoding-mode)
;; Auto-start on any markup mode
(add-hook 'sgml-mode-hook 'zencoding-mode)
;; ------------------multi-web mode ------------------
(require 'multi-web-mode)
   (setq mweb-default-major-mode 'html-mode)
   (setq mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
                      (js-mode "<script +\\(type=\"text/javascript\"\\|language=\"javascript\"\\)[^>]*>" "</script>")
                      (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))
   (setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))
   (multi-web-global-mode 1)


;; ------------------android mode ----------------
(add-to-list 'load-path "~/.emacs.d/site-lisp/")
(require 'android-mode)
(custom-set-variables
 '(android-mode-avd "test")
 '(android-mode-sdk-dir "/zhiyisoft/progam/android-sdk-linux/"))
