(package-initialize)
(unless (require 'quelpa nil t)
  (with-temp-buffer
    (url-insert-file-contents "https://raw.github.com/quelpa/quelpa/master/bootstrap.el")
    (eval-buffer)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (zenburn)))
 '(custom-safe-themes (quote ("5ba11ea18c2ebed659a8d5dac66675a44015979444f88cb4b577983f5190fd8e" "dd4db38519d2ad7eb9e2f30bc03fba61a7af49a185edfd44e020aa5345e3dca7" default)))
 '(dtrt-indent-mode t nil (dtrt-indent))
 '(dtrt-indent-require-confirmation-flag t)
 '(electric-indent-mode t)
 '(electric-pair-mode t)
 '(global-rainbow-delimiters-mode t)
 '(gnu-apl-executable "myapl")
 '(helm-buffer-details-flag nil)
 '(helm-buffers-fuzzy-matching t)
 '(helm-google-search-function (quote helm-google-api-search))
 '(helm-match-plugin-mode t nil (helm-match-plugin))
 '(helm-mode t)
 '(helm-quick-update t)
 '(highlight-symbol-idle-delay 0)
 '(hippie-expand-try-functions-list (quote (try-complete-file-name-partially try-complete-file-name try-expand-all-abbrevs try-expand-dabbrev try-expand-dabbrev-all-buffers try-expand-dabbrev-from-kill try-expand-line try-expand-line-all-buffers try-expand-list try-complete-lisp-symbol-partially try-complete-lisp-symbol)))
 '(ido-enable-flex-matching t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(package-archives (quote (("gnu" . "http://elpa.gnu.org/packages/") ("marmalade" . "http://marmalade-repo.org/packages/"))))
 '(projectile-global-mode t)
 '(projectile-switch-project-action (quote helm-projectile))
 '(quelpa-persistent-cache-file "~/.quelpa-cache")
 '(recentf-max-saved-items 1000000)
 '(recentf-mode t)
 '(save-place t nil (saveplace))
 '(scroll-conservatively 100000)
 '(scroll-step 1)
 '(show-paren-mode t)
 '(show-trailing-whitespace t)
 '(smartparens-global-mode t)
 '(standard-indent 4)
 '(tool-bar-mode nil)
 '(windmove-wrap-around t)
 '(wrap-region-global-mode t nil (wrap-region))
 '(yas-global-mode t nil (yasnippet)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'php-mode)
;(require 'gnu-apl-mode)
(require 'ido)
(require 'saveplace) 
(require 'yasnippet)
(require 'helm-config)
(require 'helm-projectile)
(require 'helm-swoop)
(require 'recentf)
(require 'expand-region)
(require 'dtrt-indent)
(require 'twig-mode)
(require 'wrap-region)
(require 'multiple-cursors)

(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'gnu-apl-mode-hook (lambda () (set-input-method "APL-Z")))
(add-hook 'gnu-apl-interactive-mode-hook (lambda () (set-input-method "APL-Z")))
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'sgml-mode-hook (lambda ()
                            (set (make-local-variable 'sgml-basic-offset) 4)
                            (sgml-guess-indent)))
(add-hook 'prog-mode-hook 'highlight-symbol-mode)
(add-hook 'prog-mode-hook 'paredit-mode)

(defun my-create-newline-and-enter-sexp (&rest _ignored)
  "Open a new brace or bracket expression, with relevant newlines and indent. "
  (newline)
  (indent-according-to-mode)
  (forward-line -1)
  (indent-according-to-mode))


(setq nrepl-hide-special-buffers t)
(setq nrepl-pop-to-buffer-on-connect nil)
(setq cider-show-error-buffer 'only-in-repl)

(global-set-key (kbd "C-x f") 'helm-projectile)

(windmove-default-keybindings)
(global-set-key (kbd "C-c h")  'windmove-left)
(global-set-key (kbd "C-c l") 'windmove-right)
(global-set-key (kbd "C-c k")    'windmove-up)
(global-set-key (kbd "C-c j")  'windmove-down)

(global-set-key (kbd "M-/") 'hippie-expand)

(global-set-key (kbd "C-=") 'er/expand-region)

(global-set-key (kbd "M-o") (lambda ()
			      (interactive)
			      (previous-line)
			      (move-end-of-line nil)
			      (newline)))
(global-set-key (kbd "C-o") (lambda ()
			      (interactive)
			      (move-end-of-line nil)
			      (newline)))

(global-set-key (kbd "C-x C-r") 'helm-recentf)
(global-set-key (kbd "C-x C-b") 'helm-mini)
(global-set-key (kbd "M-s o") 'helm-occur)

(defun quelpa-install-all ()
  (interactive)
  (dolist (p (quelpa-read-cache))
    (unless (package-installed-p (car p))
      (quelpa p))))

(global-set-key (kbd "C-z") 'mc/edit-lines)

;;; Indentation for python

;; Ignoring electric indentation
(defun electric-indent-ignore-python (char)
  "Ignore electric indentation for python-mode"
  (if (equal major-mode 'python-mode)
      `no-indent'
    nil))
(add-hook 'electric-indent-functions 'electric-indent-ignore-python)

;; Enter key executes newline-and-indent
(defun set-newline-and-indent ()
  "Map the return key with `newline-and-indent'"
  (local-set-key (kbd "RET") 'newline-and-indent))
(add-hook 'python-mode-hook 'set-newline-and-indent)
