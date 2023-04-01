;;; Set up package.el to work with MELPA
;(require 'package)
;(add-to-list 'package-archives
;             '("melpa" . "https://melpa.org/packages/"))
;(package-initialize)
;(package-refresh-contents)

;; Download Evil
(unless (package-installed-p 'evil)
 (package-install 'evil))

(setq evil-want-C-i-jump nil)
;; Enable Evil
(require 'evil)
(evil-mode 1)

	(custom-set-variables
	 ;; custom-set-variables was added by Custom.
	 ;; If you edit it by hand, you could mess it up, so be careful.
	 ;; Your init file should contain only one such instance.
	 ;; If there is more than one, they won't work right.
	 '(package-selected-packages '(evil)))
	(custom-set-faces
	 ;; custom-set-faces was added by Custom.
	 ;; If you edit it by hand, you could mess it up, so be careful.
	 ;; Your init file should contain only one such instance.
	 ;; If there is more than one, they won't work right.
	)
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

;; todo-state
(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "PAUSE" "|" "DONE")))
;; set todo cycle color
(setq org-todo-keyword-faces
 '(("IN-PROGRESS" . "orange") ("PAUSE" . "green")))

;; set org-clock-display
(setq org-remove-highlights-with-change nil)

;; add-hook on change todo cycle state to trigger clock
(add-hook 'org-after-todo-state-change-hook
 'org-clock-todo-change)
(defun org-clock-todo-change ()
 (if (string= org-state "IN-PROGRESS")
  (org-clock-in)
  (org-clock-out nil t)))
