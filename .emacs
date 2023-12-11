(eval-when-compile
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
  (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
  (setq use-package-always-ensure t)
  (when (not (package-installed-p 'use-package))
    (package-refresh-contents)
    (package-install 'use-package))
  (require 'use-package))

(use-package general)

(use-package better-defaults)

(use-package evil)

(use-package diminish)

(use-package projectile
  :general
  (:states 'normal "SPC p" 'projectile-command-map))

(defun counsel-rg-in-project ()
  (interactive)
  (counsel-rg "" (and (projectile-project-p)
                      (projectile-project-root))))

(use-package ivy
  :diminish ivy-mode
  :after projectile)

(use-package ivy-hydra
  :after ivy)

(use-package counsel
  :diminish counsel-mode
  :after ivy)

(use-package counsel-projectile
  :after counsel)

(defvar lisp-hooks '(emacs-lisp-mode-hook
		     eval-expression-minibuffer-setup-hook
		     ielm-mode-hook
		     lisp-mode-hook
		     lisp-interaction-mode-hook
		     clojure-mode-hook
		     scheme-mode-hook
                     cider-major-mode-hook))

(use-package paredit
  :commands paredit-mode
  :init
  (dolist (hook lisp-hooks)
    (add-hook hook #'paredit-mode)))

(use-package evil-cleverparens
  :commands evil-cleverparens-mode
  :init
  (dolist (hook lisp-hooks)
    (add-hook hook #'evil-cleverparens-mode)))

(use-package php-mode
  :mode "\\.php\\'")

(use-package js2-mode
  :mode "\\.js\\'")

(use-package json-mode
  :mode "\\.json\\'")

(use-package prettier-js
  :hook ((js2-mode-hook json-mode-hook react-mode-hook) . prettier-js-mode))

(use-package flycheck)

(use-package company
  :diminish company-mode
  :general
  ("M-/" 'company-complete)
  (:keymaps 'company-active-map "M-/" 'company-select-next))

(use-package web-mode
  :mode ("\\.tsx\\'" . web-mode)
  :hook (web-mode . (lambda ()
                      (when (string-equal "tsx" (file-name-extension buffer-file-name))
                        (tide-setup)))))

(use-package typescript-mode
  :hook (typescript-mode . tide-setup))

(use-package tide
  :commands (tide-setup tide-format-before-save)
  :after (typescript-mode company flycheck web-mode)
  :init
  (add-hook 'before-save-hook #'tide-format-before-save)
  (flycheck-add-mode 'typescript-tslint 'web-mode)
  (flycheck-add-mode 'typescript-tslint 'typescript-mode))

(use-package dtrt-indent
  :diminish dtrt-indent-mode)

(use-package magit
  :general
  (:states 'normal "gs" 'magit-status)
  (:states 'normal "gb" 'magit-blame))

(use-package evil-magit
  :after magit)

(use-package smart-jump
  :config
  (smart-jump-setup-default-registers))

(use-package ws-butler
  :diminish ws-butler-mode)

(use-package spacemacs-theme
  :no-require t)

(use-package wgrep)

(use-package evil-surround
  :after evil)

(defun cider-reload-on-save ()
  "Automatically reload the Clojure file if CIDER is enabled."
  (add-hook 'after-save-hook
            '(lambda ()
               (if (and (boundp 'cider-mode) cider-mode)
                   (cider-load-buffer)))))

(use-package cider
  :init
  (add-hook 'cider-mode-hook #'cider-reload-on-save))

(defun copy-buffer-file-name ()
  (interactive)
  (kill-new (buffer-file-name)))

(defun open-file-at-line ()
  (interactive)
  (let* ((file-with-nl (thing-at-point 'line t))
         (file (substring file-with-nl 0 -1)))
    (start-process "rifle" nil "rifle" file)))

(general-define-key
 :states 'normal
 :keymap 'override
 "gc" 'evil-window-delete
 "g1" 'delete-other-windows
 "SPC s" 'save-buffer
 "SPC ," 'counsel-projectile
 "SPC b" 'ivy-switch-buffer
 "SPC r" 'counsel-recentf
 "M-i" 'counsel-imenu
 "gr" 'counsel-rg-in-project
 "SPC w" 'evil-window-map
 "M-z" 'swiper)

(general-define-key
 :keymaps 'ivy-minibuffer-map
 "C-j" 'ivy-next-line
 "C-k" 'ivy-previous-line)

(general-define-key
 :keymap 'override
 "M-j" 'windmove-down
 "M-k" 'windmove-up
 "M-h" 'windmove-left
 "M-l" 'windmove-right
 "M-C" 'copy-buffer-file-name
 "M-H" 'previous-buffer
 "M-L" 'next-buffer
 [f1] 'open-file-at-line
 [remap evil-goto-definition] 'smart-jump-go)

(add-hook 'minibuffer-setup-hook (lambda () (setq-local show-trailing-whitespace nil)))
(add-hook 'after-init-hook 'server-start t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(before-save-hook (quote (tide-format-before-save)))
 '(blink-cursor-mode nil)
 '(counsel-mode t)
 '(custom-enabled-themes (quote (spacemacs-dark)))
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(dtrt-indent-global-mode t)
 '(dtrt-indent-mode t nil (dtrt-indent))
 '(evil-mode t)
 '(global-auto-revert-mode t)
 '(global-company-mode t)
 '(global-evil-surround-mode t)
 '(global-flycheck-mode t)
 '(global-hl-line-mode t)
 '(ivy-mode t)
 '(magit-diff-refine-hunk (quote all))
 '(magit-display-buffer-function (quote magit-display-buffer-fullframe-status-v1))
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (evil-surround wgrep spacemacs-theme ws-butler smart-jump evil-magit magit company dtrt-indent tide web-mode flycheck prettier-js json-mode js2-mode php-mode evil-cleverparens paredit counsel ivy-hydra ivy evil better-defaults general use-package)))
 '(projectile-completion-system (quote ivy))
 '(projectile-enable-caching t)
 '(projectile-mode t nil (projectile))
 '(save-place-mode t)
 '(scroll-conservatively 100000)
 '(scroll-step 1)
 '(select-enable-primary t)
 '(show-paren-mode t)
 '(show-trailing-whitespace t)
 '(tool-bar-mode nil)
 '(tramp-default-method "ssh")
 '(visible-bell nil)
 '(which-function-mode t)
 '(windmove-wrap-around t)
 '(ws-butler-global-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
