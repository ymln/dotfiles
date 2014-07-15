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
 '(electric-indent-mode t)
 '(gnu-apl-executable "myapl")
 '(helm-buffer-details-flag nil)
 '(helm-buffers-fuzzy-matching t)
 '(helm-match-plugin-mode t nil (helm-match-plugin))
 '(helm-mode t)
 '(helm-quick-update t)
 '(hippie-expand-try-functions-list (quote (try-complete-file-name-partially try-complete-file-name try-expand-all-abbrevs try-expand-list try-expand-line try-expand-line-all-buffers try-expand-dabbrev try-expand-dabbrev-all-buffers try-expand-dabbrev-from-kill try-complete-lisp-symbol-partially try-complete-lisp-symbol)))
 '(ido-enable-flex-matching t)
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
 '(tool-bar-mode nil)
 '(windmove-wrap-around t)
 '(yas-global-mode t nil (yasnippet)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'php-mode)
(require 'gnu-apl-mode)
(require 'ido)
(require 'saveplace) 
(require 'twig-mode)
(require 'yasnippet)
(require 'helm-config)
(require 'helm-projectile)
(require 'helm-swoop)
(require 'recentf)
(require 'expand-region)
(require 'dtrt-indent)

(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook 'clojure-test-mode)
(add-hook 'gnu-apl-mode-hook (lambda () (set-input-method "APL-Z")))
(add-hook 'gnu-apl-interactive-mode-hook (lambda () (set-input-method "APL-Z")))
(add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)
(add-hook 'nrepl-repl-mode-hook 'paredit-mode)
(add-hook 'after-init-hook #'global-flycheck-mode)

(setq nrepl-hide-special-buffers t)
(setq nrepl-pop-to-repl-buffer-on-connect nil)
(setq nrepl-popup-stacktraces nil)
(setq nrepl-popup-stacktraces-in-repl t)

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
