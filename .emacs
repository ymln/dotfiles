(require 'package)
(package-initialize)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(require 'evil)
(evil-mode 1)

(menu-bar-mode 0)
(tool-bar-mode -1)

(add-hook 'after-init-hook #'global-flycheck-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ido-enable-flex-matching 1)
 '(inhibit-startup-screen t))

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
