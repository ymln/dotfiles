(package-initialize)
(unless (require 'quelpa nil t)
  (with-temp-buffer
    (url-insert-file-contents "https://raw.github.com/quelpa/quelpa/master/bootstrap.el")
    (eval-buffer)))
(load "~/local" t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(browse-url-browser-function (quote w3m-browse-url))
 '(browse-url-new-window-flag t)
 '(cider-repl-use-pretty-printing nil)
 '(column-number-mode t)
 '(custom-enabled-themes (quote (zenburn)))
 '(custom-safe-themes
   (quote
    ("b06aaf5cefc4043ba018ca497a9414141341cb5a2152db84a9a80020d35644d1" "6a9606327ecca6e772fba6ef46137d129e6d1888dcfc65d0b9b27a7a00a4af20" "da7fa7211dd96fcf77398451e3f43052558f01b20eb8bee9ac0fd88627e11e22" "77df73cdeddc0405d6bfeb2aa59858a62749613535e268943f76969e73557ffe" "a7328f552001f136cb5364dab72c58cf92cf6ccb9529c68e1e14cf73e92e0768" "5ba11ea18c2ebed659a8d5dac66675a44015979444f88cb4b577983f5190fd8e" "dd4db38519d2ad7eb9e2f30bc03fba61a7af49a185edfd44e020aa5345e3dca7" default)))
 '(desktop-save-mode t)
 '(dtrt-indent-mode t nil (dtrt-indent))
 '(dtrt-indent-require-confirmation-flag nil)
 '(electric-indent-mode nil)
 '(electric-pair-mode t)
 '(evil-mode t)
 '(flx-ido-mode t)
 '(flx-ido-threshhold 100)
 '(global-auto-revert-mode t)
 '(global-color-identifiers-mode nil)
 '(global-company-mode t)
 '(global-evil-matchit-mode t)
 '(global-evil-surround-mode t)
 '(global-rainbow-delimiters-mode t)
 '(global-syntax-subword-mode t)
 '(gnu-apl-executable "myapl")
 '(helm-buffer-details-flag nil)
 '(helm-buffers-fuzzy-matching t)
 '(helm-google-search-function (quote helm-google-api-search))
 '(helm-google-suggest-use-curl-p nil)
 '(helm-match-plugin-mode t nil (helm-match-plugin))
 '(helm-mode t)
 '(helm-quick-update t)
 '(helm-truncate-lines t t)
 '(highlight-symbol-idle-delay 0.1)
 '(hippie-expand-try-functions-list
   (quote
    (yas-hippie-try-expand try-complete-file-name-partially try-complete-file-name try-expand-all-abbrevs try-expand-dabbrev try-expand-dabbrev-all-buffers try-expand-dabbrev-from-kill try-expand-line try-expand-line-all-buffers try-expand-list try-complete-lisp-symbol-partially try-complete-lisp-symbol)))
 '(horizontal-scroll-bar-mode nil)
 '(ido-enable-flex-matching t)
 '(ido-vertical-mode t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(magit-status-buffer-switch-function (quote switch-to-buffer))
 '(menu-bar-mode nil)
 '(mode-require-final-newline nil)
 '(org-agenda-files (quote ("~/todo.org")))
 '(org-use-speed-commands t)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("marmalade" . "http://marmalade-repo.org/packages/")
     ("melpa" . "http://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (helm-swoop helm-ag helm-projectile evil-exchange apache-mode ido-vertical-mode helm projectile flx-ido wgrep-ack zenburn-theme yasnippet yaml-mode xml-rpc ws-butler wrap-region web-mode w3m twig-mode ttrss syntax-subword smex slime skype rainbow-delimiters quelpa php-mode php+-mode paredit pabbrev org-jira multiple-cursors mew magit lua-mode key-chord jump-char jira highlight-symbol gnu-apl-mode ggtags flycheck find-file-in-project find-file-in-git-repo f expand-region evil-surround evil dtrt-indent color-theme-solarized color-identifiers-mode coffee-mode clojure-test-mode clojure-project-mode chicken-scheme autotetris-mode auto-complete anything-match-plugin anything-git-grep anything-config ag ace-jump-mode)))
 '(projectile-completion-system (quote helm))
 '(projectile-enable-caching t)
 '(projectile-global-mode t)
 '(projectile-switch-project-action (quote (lambda nil (dired "."))))
 '(quelpa-persistent-cache-file "~/.quelpa-cache")
 '(recentf-max-saved-items 1000000)
 '(recentf-mode t)
 '(save-place t nil (saveplace))
 '(savehist-mode t)
 '(scheme-program-name "csi -:c")
 '(scroll-conservatively 100000)
 '(scroll-step 1)
 '(select-enable-primary t)
 '(show-paren-mode t)
 '(show-trailing-whitespace t)
 '(smartparens-global-mode t)
 '(standard-indent 4)
 '(tool-bar-mode nil)
 '(uniquify-buffer-name-style (quote post-forward-angle-brackets) nil (uniquify))
 '(viper-mode nil)
 '(w3m-use-title-buffer-name t)
 '(which-function-mode t)
 '(windmove-wrap-around t)
 '(wrap-region-global-mode t nil (wrap-region))
 '(ws-butler-keep-whitespace-before-point nil)
 '(yas-global-mode t nil (yasnippet))
 '(yas-snippet-dirs (quote ("~/.emacs.d/snippets")) nil (yasnippet)))

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
(require 'recentf)
(require 'expand-region)
(require 'dtrt-indent)
(require 'twig-mode)
(require 'wrap-region)
(require 'multiple-cursors)
(require 'jira)
(require 'ws-butler)
(require 'key-chord)
(require 'uniquify)
(require 'evil-exchange)
(require 'helm-config)
(require 'helm-projectile)
(require 'helm-swoop)
(require 'helm-ag)

(key-chord-mode 1)

(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'gnu-apl-mode-hook (lambda () (set-input-method "APL-Z")))
(add-hook 'gnu-apl-interactive-mode-hook (lambda () (set-input-method "APL-Z")))
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(add-hook 'sgml-mode-hook (lambda ()
                            (set (make-local-variable 'sgml-basic-offset) 4)
                            (sgml-guess-indent)))
;(add-hook 'prog-mode-hook (lambda () (modify-syntax-entry \{ "w")))

(setq paredit-space-for-delimiter-predicates
      (list (lambda (endp delimiter)
              (if (memq major-mode '(php-mode twig-mode c++-mode python-mode js-mode)) nil t))))

(add-hook 'prog-mode-hook 'highlight-symbol-mode)
(add-hook 'prog-mode-hook 'paredit-mode)

(add-hook 'w3m-mode-hook (lambda ()
                          (local-set-key (kbd ",") 'w3m-previous-buffer)
                          (local-set-key (kbd ".") 'w3m-next-buffer)
                          (local-set-key (kbd "q") (lambda () (interactive) (kill-buffer nil)))
                          (w3m-lnum-mode 1)))

(defun my-create-newline-and-enter-sexp (&rest _ignored)
  "Open a new brace or bracket expression, with relevant newlines and indent. "
  (newline)
  (indent-according-to-mode)
  (forward-line -1)
  (indent-according-to-mode))

(setq nrepl-hide-special-buffers t)
(setq nrepl-pop-to-buffer-on-connect nil)
(setq cider-show-error-buffer 'only-in-repl)

(windmove-default-keybindings)
(global-set-key (kbd "C-c h")  'windmove-left)
(global-set-key (kbd "C-c l") 'windmove-right)
(global-set-key (kbd "C-c k")    'windmove-up)
(global-set-key (kbd "C-c j")  'windmove-down)
(global-set-key (kbd "M-h")  'windmove-left)
(global-set-key (kbd "M-l") 'windmove-right)
(global-set-key (kbd "M-k")    'windmove-up)
(global-set-key (kbd "M-j")  'windmove-down)
(define-key c-mode-map (kbd "M-j") nil)
(global-set-key (kbd "M-1") 'delete-other-windows)

(global-set-key (kbd "C-x f") 'helm-projectile)
(global-set-key (kbd "C-x C-r") 'helm-recentf)
(global-set-key (kbd "C-x C-b") 'helm-mini)
(global-set-key (kbd "M-s o") 'helm-occur)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(global-set-key (kbd "M-/") 'company-complete)
(define-key company-active-map (kbd "M-/") 'company-select-next)

(global-set-key (kbd "C-=") 'er/expand-region)

(global-set-key (kbd "M-o") (lambda ()
			      (interactive)
                              (move-beginning-of-line nil)
			      (newline)
                              (previous-line)
                              (indent-according-to-mode)))
(global-set-key (kbd "C-o") (lambda ()
			      (interactive)
			      (move-end-of-line nil)
			      (newline)
                              (indent-according-to-mode)))

(setq packages '((quelpa :repo "quelpa/quelpa" :fetcher github)
                 (dtrt-indent :fetcher git :url "http://git.savannah.gnu.org/r/dtrt-indent.git")
                 (gnu-apl-mode :fetcher github :repo "lokedhs/gnu-apl-mode")
                 (mingus :fetcher github :repo "pft/mingus")
                 (syntax-subword :fetcher hg :url "https://bitbucket.org/jpkotta/syntax-subword")
                 (autotetris-mode :fetcher github :repo "skeeto/autotetris-mode")
                 skype key-chord w3m jump-char xml-rpc jira ace-jump-mode ag company
                 multiple-cursors wrap-region expand-region flx-ido smex
                 projectile yasnippet flycheck eproject twig-mode gnu-apl-mode s
                 coffee-mode find-file-in-project find-file-in-git-repo rainbow-delimiters
                 zenburn-theme php-mode paredit highlight-symbol cider yaml-mode
                 ws-butler magit color-identifiers-mode evil ggtags web-mode evil-surround
                 evil-matchit apache-mode evil-exchange helm helm-projectile helm-ag helm-swoop))

(defun quelpa-install-all ()
  (interactive)
  (dolist (p packages)
    (let ((pkg (or (car-safe p) p)))
      (unless (package-installed-p pkg)
        (quelpa pkg)))))

(global-set-key (kbd "C-q") 'mc/mark-all-dwim)

(global-set-key (kbd "RET") 'newline-and-indent)

(defun additional-newline (&optional arg)
  (interactive "p")
  (if (and (looking-back "{")
           (looking-at   "}"))
      (progn
        (newline-and-indent)
        (indent-for-tab-command)
        (previous-line)
        (move-end-of-line nil)))
  (newline-and-indent))
;(add-hook 'c-mode-hook (lambda () (local-set-key (kbd "RET") 'additional-newline)))

(defun do-in-root (f)
  (if (projectile-project-p)
      (funcall f (projectile-project-root))
      (error "You're not in project")))
(defun do-ag-in-root (string)
  (interactive (list (read-from-minibuffer "Search string: " (ag/dwim-at-point))))
  (do-in-root '(lambda (root) (ag/search string root))))
(defun helm-do-ag-in-root ()
  (interactive)
  (do-in-root 'helm-do-ag))

(global-set-key (kbd "C-c C-a") 'do-ag-in-root)
(global-set-key (kbd "C-c a") 'helm-do-ag-in-root)
(global-set-key (kbd "C-c r") 'helm-resume)
(global-set-key (kbd "M-i") 'helm-imenu)

(global-set-key (kbd "C-c SPC") 'ace-jump-char-mode)

(global-set-key (kbd "C-,") 'call-last-kbd-macro)

(defun quit-other-window ()
  (interactive)
  (quit-window nil (next-window)))
(global-set-key (kbd "M-Q") 'quit-other-window)

(global-set-key (kbd "C-<") (lambda () (interactive) (move-to-window-line 0)))
(global-set-key (kbd "C->") (lambda () (interactive) (move-to-window-line -1)))
(global-set-key (kbd "C-S-M") (lambda () (interactive) (move-to-window-line nil)))

(global-set-key (kbd "M-g s") 'magit-status)

(setq ace-jump-mode-move-keys (loop for i from ?a to ?z collect i))

(global-set-key (kbd "M-n") 'highlight-symbol-next)
(global-set-key (kbd "M-p") 'highlight-symbol-prev)

(key-chord-define-global "df" 'ace-jump-char-mode)

(ws-butler-global-mode t)

(setq frame-title-format '(:eval (if buffer-file-name "%f" "%b")))

(defalias 'yes-or-no-p 'y-or-n-p)

(setq-default cursor-type 'bar)

(global-set-key (kbd "M-g m") 'make-frame)

(setq ggtags-navigation-map
  (let ((map (make-sparse-keymap)))
    (define-key map [return] 'ggtags-navigation-mode-done)
    (define-key map "\r" 'ggtags-navigation-mode-done)
    (define-key map [remap pop-tag-mark] 'ggtags-navigation-mode-abort)
    (define-key map "\M-," 'ggtags-navigation-mode-abort)
    map))

(add-hook 'php-mode 'ggtags-mode)

(setq web-mode-engines-alist '(("php" . "\\.tpl\\'")))

(add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))

(add-hook 'minibuffer-setup-hook (lambda () (setq-local show-trailing-whitespace nil)))

(evil-mode t)

(evil-exchange-install)

(global-set-key (kbd "<f4>") 'other-window)