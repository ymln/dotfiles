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
 '(electric-indent-mode t)
 '(gnu-apl-executable "myapl")
 '(ido-enable-flex-matching t)
 '(ido-mode (quote both) nil (ido))
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(package-archives (quote (("gnu" . "http://elpa.gnu.org/packages/") ("marmalade" . "http://marmalade-repo.org/packages/"))))
 '(quelpa-persistent-cache-file "~/.quelpa-cache")
 '(save-place t nil (saveplace))
 '(scroll-conservatively 100000)
 '(scroll-step 1)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(windmove-wrap-around t))

(require 'php-mode)
(require 'gnu-apl-mode)
(require 'ido)
(require 'saveplace) 
(require 'twig-mode)

(require 'eproject)
(require 'eproject-extras)
(define-project-type git (generic) (look-for ".git"))

;(require 'anything)
;(require 'anything-git-grep)
;(require 'anything-match-plugin)

(require 'find-file-in-project)
(add-to-list 'ffip-patterns "*.php")

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

(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(require 'find-file-in-project)
(add-to-list 'ffip-patterns "*.php")
(add-to-list 'ffip-patterns "*.cljs")
;(setq ffip-limit 1000000)
(global-set-key (kbd "C-x f") 'ffip)
(setq ffip-project-file '(".git" "project.clj" ".hg"))
(require 's)
(let ((dirs '(".egg" "env" "node_modules" "bower_components" "cache"
	      "vendor" "target" ".gradle" "out" "gradle" "build")))
  (setq ffip-ignore dirs))

(defun make-ignore (files)
  (s-join " " (mapcar (lambda (x) (format "--ignore-dir=\"%s\"" x)) files)))

(defun ffip-project-files ()
  (let ((file-alist nil)
        (root (expand-file-name (or ffip-project-root (ffip-project-root)
                                    (error "No project root found")))))
    (mapcar (lambda (file)
              (if ffip-full-paths
                  (cons (substring (expand-file-name file) (length root))
                        (expand-file-name file))
		(let ((file-cons (cons (file-name-nondirectory file)
                                       (expand-file-name file))))
                  (when (assoc (car file-cons) file-alist)
                    (ffip-uniqueify (assoc (car file-cons) file-alist))
                    (ffip-uniqueify file-cons))
                  (add-to-list 'file-alist file-cons)
                  file-cons)))
            (split-string (shell-command-to-string
                           (format "ag -g '.*' %s %s | head -n %s"
                                   (make-ignore ffip-ignore) root ffip-limit))))))

;redefine find-file-in-project function to include full paths
;(defun find-file-in-project ()
  ;"Prompt with a completing list of all files in the project to find one.

   ;The project's scope is defined as the first directory containing
   ;an `.emacs-project' file.  You can override this by locally
   ;setting the variable `ffip-project-root'."
  ;(interactive)
  ;(let* ((project-files (ffip-project-files))
         ;(files (mapcar 'cdr project-files))
         ;(file (if (and (boundp 'ido-mode) ido-mode)
                 ;(ido-completing-read "Find file in project: " files)
                 ;(completing-read "Find file in project: " files))))
    ;(find-file file)))

;(define-key global-map (kbd "RET") 'newline-and-indent)

(windmove-default-keybindings)
(global-set-key (kbd "C-c h")  'windmove-left)
(global-set-key (kbd "C-c l") 'windmove-right)
(global-set-key (kbd "C-c k")    'windmove-up)
(global-set-key (kbd "C-c j")  'windmove-down)

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 1000)
(defun recentf-ido-find-file ()
  "Find a recent file using Ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))
(global-set-key "\C-x\ \C-r" 'recentf-ido-find-file)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
