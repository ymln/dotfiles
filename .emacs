(package-initialize)

(custom-set-variables
 '(ido-enable-flex-matching 1)
 '(gnu-apl-executable "myapl")
 '(ido-enable-flex-matching t)
 '(inhibit-startup-screen t)
 '(package-archives (("gnu" . "http://elpa.gnu.org/packages/")
		     ("marmalade" . "http://marmalade-repo.org/packages/")
		     ("melpa" . "http://melpa.milkbox.net/packages/")))
 '(inhibit-startup-screen t))

(defvar my-packages '(evil project-mode paredit php-mode color-theme-solarized
  zenburn-theme clojure-test-mode clojure-project-mode smex rainbow-delimiters
  find-file-in-git-repo find-file-in-project coffee-mode s))
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(add-hook 'after-init-hook #'global-flycheck-mode)

(menu-bar-mode -1)
(tool-bar-mode -1)

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.el-get-user/recipes")
(el-get 'sync)

(require 'php-mode)
(require 'gnu-apl-mode)

;(load-theme 'zenburn t)

(load-theme 'solarized-light t)

(electric-indent-mode 1)

(require 'ido)
(ido-mode t)

(require 'eproject)
(require 'eproject-extras)
(define-project-type git (generic) (look-for ".git"))

(require 'anything)
(require 'anything-git-grep)
(require 'anything-match-plugin)

(require 'find-file-in-project)
(add-to-list 'ffip-patterns "*.php")
)

(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook 'clojure-test-mode)
(add-hook 'gnu-apl-mode-hook (lambda () (set-input-method "APL-Z")))
(add-hook 'gnu-apl-interactive-mode-hook (lambda () (set-input-method "APL-Z")))

(show-paren-mode 1)

(setq scroll-step 1
      scroll-conservatively 100000)

(add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)
(setq nrepl-hide-special-buffers t)
(setq nrepl-pop-to-repl-buffer-on-connect nil)
(add-hook 'nrepl-repl-mode-hook 'paredit-mode)
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
