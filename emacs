(setq inhibit-default-init t)
(setq inhibit-startup-message t)

(set-default-font "-*-Courier New-demibold-r-*-*-13-*-*-*-c-*-*-ansi-")
(set-background-color "black")
(set-foreground-color "green")
(set-cursor-color "white")
(set-face-background 'region "dim grey")


;set variables governing date/time display.
(setq display-time-day-and-date t)
(setq display-time-24hr-format t)
;ehw com.ehw.gps.Position
;Lat:  33.95113333333333
;Long: -84.4308666666666
;
;untersee 
;Lat:  47.61423333333333
;Long: 13.645666666666667

(setq calendar-latitude 33.95113333333333)
(setq calendar-longitude -84.43086666666666)

;;;;;;;;;;;; win32 ;;;;;;;;;;;;;
(defun my-shell-setup ()
       "For bash (cygwin 18) under Emacs 20"
       (setq comint-scroll-show-maximum-output 'this)
       (setq comint-completion-addsuffix t)
       (setq comint-eol-on-send t)
       (make-variable-buffer-local 'comint-completion-addsuffix))

(setq shell-mode-hook 'my-shell-setup)
(setq process-coding-system-alist (cons '("bash" . raw-text-unix)
                                             process-coding-system-alist))

(setq binary-process-input t)
(setq w32-quote-process-args ?\")
(setq shell-file-name "c:/cygnus/cygwin-b20/H-i586-cygwin32/bin/bash.exe")
(setenv shell-file-name)
(setq shell-command-switch "-c")
(setq explicit-shell-file-name shell-file-name) 
(setq explicit-sh-args '("-login" "-i"))
(setq w32-num-mouse-buttons 2)
(add-hook 'comint-output-filter-functions 'shell-strip-ctrl-m nil t)

(setq browse-url-netscape-program "c:/Program Files/Netscape/Communicator/Program/netscape.exe")
(setq browse-url-netscape-version "4.5")

(defvar shell-execute-helper "shelex.exe")

(defun shell-execute-url (url &optional new-window) 
  "Invoke the shell-execute-helper program to call ShellExecute and launch 
     or re-direct a web browser on the specified url." 
  (interactive "sURL: ") 
  (start-process "shellex" nil shell-execute-helper url))

(setq browse-url-browser-function 'shell-execute-url)
(setq gnus-button-url 'shell-execute-url)               ; GNUS
(setq vm-url-browser 'shell-execute-url)                ; VM

;;;;;;;;;;; end win32 ;;;;;;;;;;;;

(setq frame-title-format "emacs - %f")
(setq icon-title-format "emacs - %b")
(setq default-frame-alist
    (append default-frame-alist
            '((top . 1)
              (left . 1)
              (width . 80)
              (height . 32)
              (background-color . "black")
              (foreground-color . "green")
              (cursor-color . "white")
              (font . "-*-Courier New-demibold-r-*-*-13-*-*-*-c-*-*-ansi-")
              )))


(defconst otterson-c-style 
	     '((c-basic-offset . 4)
	       (c-comment-only-line-offset . 0)
	       (c-offsets-alist . ((statement-block-intro . +)
				   (knr-argdecl-intro . +)
				   (substatement-open . 0)
				   (label . +)
				   (case-label . +)
				   (access-label . +)
				   (statement-cont . +)
				 )
	       )
	      ) "otterson-c-style"
)

(defconst ehw-java-style 
	     '((c-basic-offset . 4)
	     (c-comment-only-line-offset . (0 . 0))
	     (c-offsets-alist . ((statement-block-intro . +)
				 (knr-argdecl-intro     . 5)
				 (substatement-open     . 0)
				 (inline-open           . 0)
				 (label                 . 0)
				 (case-label            . +)
				 (statement-case-open   . +)
				 (statement-cont        . +)
				 (arglist-intro . c-lineup-arglist-intro-after-paren)
				 (arglist-close . c-lineup-arglist)
				 (access-label . 0)
				 )
			      )
	     (c-echo-syntactic-information-p . t)
	     ) "ehw's Java Style" 
)


;; Customizations for all of c-mode, c++-mode, and objc-mode
(defun my-c-mode-common-hook ()
  (c-add-style "otterson" otterson-c-style t)
  (c-add-style "ehw-java" ehw-java-style t)
  (c-toggle-auto-hungry-state 1)
  (c-toggle-auto-state 0)
  (define-key c-mode-base-map "\C-m" 'newline-and-indent)
)

(defun my-c-mode-hook ()
  (c-set-style "ehw-java")
)

(defun my-java-mode-hook ()
  (c-set-style "ehw-java")
)

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(add-hook 'java-mode-hook 'my-java-mode-hook)
(add-hook 'c-mode-hook 'my-c-mode-hook)

(autoload 'html-helper-mode "html-helper-mode" "HTML" t)
(setq html-helper-build-new-buffer t)
(setq tempo-interactive t)
(setq html-helper-use-expert-menu t)
(setq html-helper-htmldtd-version "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 3.2//EN\">\n")
(add-hook 'html-helper-load-hook (function (lambda () (load "tables"))))

(setq auto-mode-alist 
    (append '(("\\.html$" . html-helper-mode)
	      ("\\.htm$" . html-helper-mode))
     auto-mode-alist))

(transient-mark-mode 1)
(show-paren-mode 1)
(display-time)

;; turn on font-lock in all modes that support it
(if (fboundp 'global-font-lock-mode)
    (global-font-lock-mode t))

;; Maximum colors
(setq font-lock-maximum-decoration t)
;(setq font-lock-support-mode 'lazy-lock-mode) ;caused error 12/10/08
;(setq font-lock-support-mode 'fast-lock-mode)

(setq printer-name "c:\\lpt1")

;(load "pc-mode")

(setq indent-tabs-mode nil)
;(setq c-toggle-auto-hungry-state 1)
;(define-key c-mode-map "\C-m" 'newline-and-indent)

;;; Set up some function keys
;(global-set-key [f1] 'ispell-word)
(global-set-key [f2] 'shrink-window)
; a <br>
(global-set-key [f3] 'html-line)
; a <p>
(global-set-key [f4] 'html-paragraph)
(global-set-key [f5] 'isearch-forward)
(global-set-key [S-f5] 'isearch-backward)
(global-set-key [f6] 'query-replace)
(global-set-key [S-f6] 'query-replace-regexp)
(global-set-key [f7] 'start-kbd-macro)
(global-set-key [S-f7] 'end-kbd-macro)
(global-set-key [f8] 'call-last-kbd-macro)
(global-set-key [f9] 'undo)
(global-set-key [f10] 'other-window)
(global-set-key [f11] 'goto-line)
(global-set-key [f12] 'bury-buffer)
(global-set-key [S-f12] 'kill-this-buffer)
(global-set-key [home]   'beginning-of-line)
(global-set-key [end]    'end-of-line)
(global-set-key [C-home] 'beginning-of-buffer)
(global-set-key [C-end]  'end-of-buffer)
(global-set-key [S-delete] 'clipboard-kill-region)
(global-set-key [S-insert] 'clipboard-yank)
(global-set-key [C-insert] 'clipboard-kill-ring-save)
(global-set-key [kp-multiply] 'undo)

(set-message-beep 'ok)


;;;(require 'jde)

(load "desktop")
(desktop-load-default)
(desktop-read)
;;; (custom-set-variables
;;; '(jde-compile-option-classpath (quote ("c:\\ibmjdk1.1.7\\lib\\classes.zip;c:\\jsdk2.0\\lib\\jsdk.jar;c:\\java\\novera\\epic\\lib\\epic.jar;u:\\java\\pr\\classes;c:\\servlet")))
;;; '(jde-run-option-classpath (quote ("c:\\ibmjdk1.1.7\\lib\\classes.zip;c:\\jsdk2.0\\lib\\jsdk.jar;c:\\java\\novera\\epic\\lib\\epic.jar;u:\\java\\pr\\classes;c:\\servlet"))))

(setq ps-print-color-p nil)











;; This .emacs file illustrates the minimul setup
;; required to run the JDE.

;; Update the Emacs load-path to include the path to
;; the JDE. This code assumes that you have installed
;; the JDE in the specified subdirectory of your home
;; directory.
;;;(setq load-path
;;;      (nconc
;;;       '(
;;;	 "~/emacs/jde-2.1.5"
;;;	 )
;;;       load-path))

;; Tell Emacs to load the entire JDE package at startup (only once).
;;;(require 'jde)

;; Sets the basic indentation for Java source files
;; to two spaces.
;;;(defun my-jde-mode-hook ()
;;;  (setq c-basic-offset 2))

;;;(add-hook 'jde-mode-hook 'my-jde-mode-hook)

;; Include the following only if you want to run
;; bash as your shell.

;; Setup Emacs to run bash as its primary shell.
(setq binary-process-input t)
(setq shell-file-name "bash")
(setq explicit-shell-file-name shell-file-name)
(setenv "SHELL" shell-file-name)
(setq explicit-sh-args '("-login" "-i"))
(setq w32-quote-process-args ?\") ;; Use Cygnus quoting rules.

;; european stuff: 
; 1) M-x standard-display-european replaced by (standard-display-european t)
; 2) M-x iso-accents-mode
; 3) any "o becomes umlauted o."s is beta.
(set-language-environment "Latin-1")
;(add-hook 'find-file-hooks (lambda () (iso-accents-mode t))) ; removed 12/10/08


(put 'upcase-region 'disabled nil)




(put 'downcase-region 'disabled nil)
(require 'un-define "un-define" t)
(set-buffer-file-coding-system 'utf-8 'utf-8-unix)
(set-default buffer-file-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
(set-default default-buffer-file-coding-system 'utf-8-unix)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(display-time-mode t)
 '(show-paren-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
;; see c:/emacs-23.2/site-lisp/haml-mode.el 
(require 'haml-mode)
;; $ git config --global merge.tool emerge
;; $ git config --global mergetool.emerge.path $HOME/bin/emerge-for-git
(setq emerge-diff-options "--ignore-all-space")
