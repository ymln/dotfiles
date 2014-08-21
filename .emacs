(package-initialize)
(unless (require 'quelpa nil t)
  (with-temp-buffer
    (url-insert-file-contents "https://raw.github.com/quelpa/quelpa/master/bootstrap.el")
    (eval-buffer)))
(load "local" t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(browse-url-browser-function (quote w3m-browse-url))
 '(browse-url-new-window-flag t)
 '(custom-enabled-themes (quote (zenburn)))
 '(custom-safe-themes (quote ("a7328f552001f136cb5364dab72c58cf92cf6ccb9529c68e1e14cf73e92e0768" "5ba11ea18c2ebed659a8d5dac66675a44015979444f88cb4b577983f5190fd8e" "dd4db38519d2ad7eb9e2f30bc03fba61a7af49a185edfd44e020aa5345e3dca7" default)))
 '(dtrt-indent-mode t nil (dtrt-indent))
 '(dtrt-indent-require-confirmation-flag nil)
 '(electric-indent-mode nil)
 '(electric-pair-mode t)
 '(global-auto-revert-mode t)
 '(global-rainbow-delimiters-mode t)
 '(global-subword-mode t)
 '(gnu-apl-executable "myapl")
 '(helm-buffer-details-flag nil)
 '(helm-buffers-fuzzy-matching t)
 '(helm-google-search-function (quote helm-google-api-search))
 '(helm-google-suggest-use-curl-p nil)
 '(helm-match-plugin-mode t nil (helm-match-plugin))
 '(helm-mode t)
 '(helm-quick-update t)
 '(highlight-symbol-idle-delay 0)
 '(hippie-expand-try-functions-list (quote (yas-hippie-try-expand try-complete-file-name-partially try-complete-file-name try-expand-all-abbrevs try-expand-dabbrev try-expand-dabbrev-all-buffers try-expand-dabbrev-from-kill try-expand-line try-expand-line-all-buffers try-expand-list try-complete-lisp-symbol-partially try-complete-lisp-symbol)))
 '(ido-enable-flex-matching t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(magit-status-buffer-switch-function (quote switch-to-buffer))
 '(menu-bar-mode nil)
 '(org-agenda-files (quote ("~/todo.org")))
 '(package-archives (quote (("gnu" . "http://elpa.gnu.org/packages/") ("marmalade" . "http://marmalade-repo.org/packages/"))))
 '(projectile-global-mode t)
 '(projectile-switch-project-action (quote (lambda nil (dired "."))))
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
 '(w3m-use-title-buffer-name t)
 '(which-function-mode t)
 '(windmove-wrap-around t)
 '(wrap-region-global-mode t nil (wrap-region))
 '(ws-butler-global-mode t)
 '(ws-butler-keep-whitespace-before-point nil)
 '(x-select-enable-primary t)
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
(require 'helm-config)
(require 'helm-projectile)
(require 'helm-swoop)
(require 'recentf)
(require 'expand-region)
(require 'dtrt-indent)
(require 'twig-mode)
(require 'wrap-region)
(require 'multiple-cursors)
(require 'jira)
(require 'ws-butler)

(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'gnu-apl-mode-hook (lambda () (set-input-method "APL-Z")))
(add-hook 'gnu-apl-interactive-mode-hook (lambda () (set-input-method "APL-Z")))
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(add-hook 'after-init-hook #'global-flycheck-mode)
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
                              (move-beginning-of-line nil)
			      (newline)
                              (previous-line)
                              (indent-according-to-mode)))
(global-set-key (kbd "C-o") (lambda ()
			      (interactive)
			      (move-end-of-line nil)
			      (newline)))

(global-set-key (kbd "C-x C-r") 'helm-recentf)
(global-set-key (kbd "C-x C-b") 'helm-mini)
(global-set-key (kbd "M-s o") 'helm-occur)

(setq packages '((quelpa :repo "quelpa/quelpa" :fetcher github)
                 (dtrt-indent :fetcher git :url "http://git.savannah.gnu.org/r/dtrt-indent.git")
                 (gnu-apl-mode :fetcher github :repo "lokedhs/gnu-apl-mode")
                 (mingus :fetcher github :repo "pft/mingus")
                 skype key-chord w3m jump-char xml-rpc jira ace-jump-mode ag helm-ag
                 multiple-cursors wrap-region expand-region helm-swoop helm-projectile
                 projectile helm yasnippet flycheck eproject twig-mode gnu-apl-mode s
                 coffee-mode find-file-in-project find-file-in-git-repo rainbow-delimiters
                 zenburn-theme php-mode paredit helm-google highlight-symbol cider yaml-mode
                 ws-butler))

(defun quelpa-install-all ()
  (interactive)
  (dolist (p packages)
    (let ((pkg (or (car-safe p) p)))
      (unless (package-installed-p pkg)
        (quelpa pkg)))))

(global-set-key (kbd "C-z") 'mc/edit-lines)

(global-set-key (kbd "RET") 'newline-and-indent)

(defun additional-newline (&optional arg)
  (interactive "p")
  (if (and (looking-back "{")
           (looking-at   "}"))
      (progn
        (newline-and-indent)
        (previous-line)
        (move-end-of-line nil)))
  (newline-and-indent))
(add-hook 'c-mode-hook (lambda () (local-set-key (kbd "RET") 'additional-newline)))

(global-set-key (kbd "C-x C-f") 'helm-find-files)

(defun do-in-root (f)
  (if (projectile-project-p)
      (funcall f (projectile-project-root))
      (error "You're not in project")))
(defun helm-do-ag-in-root ()
  (interactive)
  (do-in-root 'helm-do-ag))
(defun do-ag-in-root (string)
  (interactive (list (read-from-minibuffer "Search string: " (ag/dwim-at-point))))
  (do-in-root '(lambda (root) (ag/search string root))))

(require 'helm-ag)
; Overriden function to make ag ignore case
(defun helm-ag--do-ag-candidate-process ()
 (let* ((default-directory (or helm-ag-default-directory default-directory))
        (proc (start-process "helm-do-ag" nil
                             "ag" "-i" "--nocolor" "--nogroup" "--" helm-pattern)))
    (prog1 proc
      (set-process-sentinel
       proc
       (lambda (process event)
         (helm-process-deferred-sentinel-hook
          process event (helm-default-directory))
         (when (string= event "finished\n")
           (helm-ag--do-ag-propertize)))))))

(global-set-key (kbd "C-c a") 'helm-do-ag-in-root)
(global-set-key (kbd "C-c C-a") 'do-ag-in-root)

(global-set-key (kbd "C-c r") 'helm-resume)

(global-set-key (kbd "C-c SPC") 'ace-jump-char-mode)

(global-set-key (kbd "C-,") 'call-last-kbd-macro)

(defun quit-other-window ()
  (interactive)
  (quit-window nil (next-window)))
(global-set-key (kbd "M-Q") 'quit-other-window)

(global-set-key (kbd "M-i") 'helm-imenu)

(global-set-key (kbd "C-<") (lambda () (interactive) (move-to-window-line 0)))
(global-set-key (kbd "C->") (lambda () (interactive) (move-to-window-line -1)))
(global-set-key (kbd "C-S-M") (lambda () (interactive) (move-to-window-line nil)))

(global-set-key (kbd "M-g s") 'magit-status)

(global-set-key (kbd "C-h j") 'helm-google)

(setq ace-jump-mode-move-keys (loop for i from ?a to ?z collect i))
