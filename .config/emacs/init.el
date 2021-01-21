;; by abdellatif-dev
;; You will most likely need to adjust this font size for your system!
(defvar runemacs/default-font-size 100)
(setq inhibit-startup-message t)
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)
(setq make-backup-files nil)

(load-theme 'afternoon t)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room

(menu-bar-mode -1)            ; Disable the menu bar

;; Set up the visible bell
(setq visible-bell t)

(set-face-attribute 'default nil :font "hack Nerd Font" :height runemacs/default-font-size)

;; Make ESC quit prompts

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "<delete>") 'delete-char)
;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(column-number-mode)
(global-display-line-numbers-mode t)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(use-package command-log-mode)

(use-package smartparens)
(use-package ivy
  :diminish
  :bind (("C-M-f" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package all-the-icons
:ensure t
:defer 0.5)

(use-package afternoon-theme)

(use-package all-the-icons-ivy
:ensure t
  :after (all-the-icons ivy)
  :custom (all-the-icons-ivy-buffer-commands '(ivy-switch-buffer-other-window ivy-switch-buffer))
  :config
  (add-to-list 'all-the-icons-ivy-file-commands 'counsel-dired-jump)
  (add-to-list 'all-the-icons-ivy-file-commands 'counsel-find-library)
  (all-the-icons-ivy-setup))


(use-package all-the-icons-dired
:ensure t
)

(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)


(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))
(use-package material-theme)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
         ("C-x b" . counsel-ibuffer)
         ("C-x C-f" . counsel-find-file)
         :map minibuffer-local-map
        ("C-r" . 'counsel-minibuffer-history)))

(use-package vscode-icon)

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)

  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package general)
(use-package darktooth-theme)
(general-define-key
 "C-M-o" 'counsel-find-file
 "C-s" 'save-buffer
 "<C-tab>" 'other-window
 "<M-tab>" 'counsel-switch-buffer
 "C-q" 'delete-window
 "M-h" 'split-window-below
 "M-g" 'org-agenda
 "M-v" 'split-window-right
 "M-s" 'projectile-switch-project
 "M-q" 'kill-buffer)

(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  ;; NOTE: Set this to the folder where you keep your Git repos!
  (when (file-directory-p "~/Desktop/dev/")
    (setq projectile-project-search-path '("~/Desktop/dev/")))
  (setq projectile-switch-project-action #'projectile-dired))

(use-package counsel-projectile
  :config (counsel-projectile-mode))
(use-package tree-sitter)
(use-package tree-sitter-langs)

(use-package dmenu)

(use-package lua-mode)
(use-package go-mode)
(use-package rust-mode)

(defun efs/org-font-setup ()
  ;; Replace list hyphen with dot
  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

  ;; Set faces for heading levels
  (dolist (face '((org-level-1 . 1.2)
                  (org-level-2 . 1.1)
                  (org-level-3 . 1.05)
                  (org-level-4 . 1.0)
                  (org-level-5 . 1.1)
                  (org-level-6 . 1.1)
                  (org-level-7 . 1.1)
                  (org-level-8 . 1.1)))
    (set-face-attribute (car face) nil :font "Hack Nerd Font" :weight 'bold :height (cdr face)))

  ;; Ensure that anything that should be fixed-pitch in Org files appears that way
  (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-table nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch))

(use-package org
  :hook (org-mode . efs/org-mode-setup)
  :config
  (setq org-agenda-files
	'("/home/flagmate/Desktop/dev/orgfiles/todo.org"
	  "/home/flagmate/Desktop/dev/orgfiles/projects.org"))
  (setq org-ellipsis " ▾")
  (efs/org-font-setup))
  (setq org-agenda-start-with-log-mode t)
  (setq org-log-done 'time)
  (setq org-log-into-drawer t)

  (setq org-todo-keywords
    '((sequence "TODO(t)" "NEXT(n)"  "LATER(l)" "|" "DONE(d!)")
      (sequence "BACKLOG(b)" "PLAN(p)" "PROJECT(p)" "READY(r)" "ACTIVE(a)" "REVIEW(v)" "WAIT(w@/!)" "HOLD(h)" "|" "COMPLETED(c)" "CANCELLED(c@/!)")
      (sequence "REPORT" "BUG" "KNOWNCAUSE" "|" "FIXED")))
 ;; Configure custom agenda views
  (setq org-agenda-custom-commands
   '(("d" "Dashboard"
     ((agenda "" ((org-deadline-warning-days 7)))
      (todo "NEXT"
        ((org-agenda-overriding-header "Next Tasks")))
      (tags-todo "agenda/ACTIVE" ((org-agenda-overriding-header "Active Projects")))))

    ("n" "Next Tasks"
     ((todo "NEXT"
        ((org-agenda-overriding-header "Next Tasks")))))

    ("W" "Work Tasks" tags-todo "+work-email")

    ;; Low-effort next actions
    ("e" tags-todo "+TODO=\"NEXT\"+Effort<15&+Effort>0"
     ((org-agenda-overriding-header "Low Effort Tasks")
      (org-agenda-max-todos 20)
      (org-agenda-files org-agenda-files)))

    ("w" "Workflow Status"
     ((todo "LATER"
            ((org-agenda-overriding-header "Waiting on External")
             (org-agenda-files org-agenda-files)))
      (todo "REVIEW"
            ((org-agenda-overriding-header "In Review")
             (org-agenda-files org-agenda-files)))
      (todo "PLAN"
            ((org-agenda-overriding-header "In Planning")
             (org-agenda-todo-list-sublevels nil)
             (org-agenda-files org-agenda-files)))
      (todo "BACKLOG"
            ((org-agenda-overriding-header "Project Backlog")
             (org-agenda-todo-list-sublevels nil)
             (org-agenda-files org-agenda-files)))
      (todo "READY"
            ((org-agenda-overriding-header "Ready for Work")
             (org-agenda-files org-agenda-files)))
      (todo "ACTIVE"
            ((org-agenda-overriding-header "Active Projects")
             (org-agenda-files org-agenda-files)))
      (todo "COMPLETED"
            ((org-agenda-overriding-header "Completed Projects")
             (org-agenda-files org-agenda-files)))
      (todo "CANCELDED"
            ((org-agenda-overriding-header "Cancelled Projects")
             (org-agenda-files org-agenda-files)))))))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))


(org-babel-do-load-languages
  'org-babel-load-languages
  '((emacs-lisp . t)
    (python . t)))

;; This is needed as of Org 9.2
(require 'org-tempo)

(add-to-list 'org-structure-template-alist '("sh" . "src shell"))
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
(add-to-list 'org-structure-template-alist '("py" . "src python"))

(use-package magit
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

(use-package evil-nerd-commenter
  :bind ("C-/" . evilnc-comment-or-uncomment-lines))

(use-package eterm-256color
  :hook (term-mode . eterm-256color-mode))

(use-package dired
  :ensure nil
  :commands (dired dired-jump)
  :bind (("C-x C-j" . dired-jump))
  :custom ((dired-listing-switches "-agho --group-directories-first"))
  :config
  (evil-collection-define-key 'normal 'dired-mode-map
    "h" 'dired-single-up-directory
    "l" 'dired-single-buffer))

(use-package dired-single)

(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))

(use-package dired-open
  :config
  ;; Doesn't work as expected!
  ;;(add-to-list 'dired-open-functions #'dired-open-xdg t)
  (setq dired-open-extensions '(("png" . "feh")
                                ("mkv" . "mpv"))))

(use-package dired-hide-dotfiles
  :hook (dired-mode . dired-hide-dotfiles-mode)
  :config
  (evil-collection-define-key 'normal 'dired-mode-map
    "H" 'dired-hide-dotfiles-mode))


(use-package pyvenv
  :config
  (pyvenv-mode 1))

(defun efs/exwm-update-class ()
  (exwm-workspace-rename-buffer exwm-class-name))

(use-package exwm
  :config
  ;; Set the default number of workspaces
  (setq exwm-workspace-number 9)
(defun efs/exwm-update-class ()
  (exwm-workspace-rename-buffer exwm-class-name))

(defun efs/exwm-update-title ()
  (pcase exwm-class-name
    ("firefox" (exwm-workspace-rename-buffer (format "Firefox: %s" exwm-title)))))

(use-package exwm
  :config
  (setq exwm-workspace-number 9)

  ;; (start-process-shell-command "sh" nil "sh ~/.config/awesome/scripts/keyboardxmodmap.sh")

  ;; When window "class" updates, use it to set the buffer name
  (add-hook 'exwm-update-class-hook #'efs/exwm-update-class)

  ;; When window title updates, use it to set the buffer name
  (add-hook 'exwm-update-title-hook #'efs/exwm-update-title)

  (require 'exwm-randr)
  (exwm-randr-enable)

  ;; (require 'exwm-systemtray)
  ;; (exwm-systemtray-enable)

  (setq exwm-input-prefix-keys
    '(?\C-x
      ?\C-u
      ?\C-h
      ?\C-\M-h
      ?\C-`
      ?\C-`
      ?\C-\M-v
      ?\M-x
      ?\M-`
      ?\M-&
      ?\M-:
      ?\C-\M-j))  ;; Buffer list

  (define-key exwm-mode-map [?\C-\ ] 'exwm-input-send-next-key)

  (setq exwm-input-global-keys
        `(([?\s-r] . exwm-reset)
          ([?\s-d] . dmenu)

          ;; Move between windows
          ([s-left] . windmove-left)
          ([s-right] . windmove-right)
          ([s-up] . windmove-up)
          ([s-down] . windmove-down)

          ;; Launch applications via shell command
          ([?\s-&] . (lambda (command)
                       (interactive (list (read-shell-command "$ ")))
                       (start-process-shell-command command nil command)))

          ;; Switch workspace
          ([?\s-w] . exwm-workspace-switch)
          ([?\s-1] . (lambda () (interactive) (exwm-workspace-switch-create 0)))
          ([?\s-2] . (lambda () (interactive) (exwm-workspace-switch-create 1)))
          ([?\s-3] . (lambda () (interactive) (exwm-workspace-switch-create 2)))
          ([?\s-4] . (lambda () (interactive) (exwm-workspace-switch-create 3)))
          ([?\s-5] . (lambda () (interactive) (exwm-workspace-switch-create 4)))
          ([?\s-6] . (lambda () (interactive) (exwm-workspace-switch-create 5)))
          ([?\s-7] . (lambda () (interactive) (exwm-workspace-switch-create 6)))
          ([?\s-8] . (lambda () (interactive) (exwm-workspace-switch-create 7)))
          ([?\s-9] . (lambda () (interactive) (exwm-workspace-switch-create 8)))))

;; (exwm-enable)
  ))


;; (setq efs/polybar-process (start-process-shell-command "polybar" nil "polybar -c ./polybar/configemacs.int main"))

(defun efs/lsp-mode-setup ()
  (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
  (lsp-headerline-breadcrumb-mode))

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook (lsp-mode . efs/lsp-mode-setup)
  :init
  (setq lsp-keymap-prefix "C-c l")  ;; Or 'C-l', 's-l'
  :config
  (lsp-enable-which-key-integration t))

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-position 'bottom))
(use-package company
  :hook (emacs-lisp-mode)
  (lua-mode)
  (python-mode)
  :config (global-company-mode t)
  (setq company-tooltip-align-annotations t)
  ;; Use builtin faces instead of ugly ones set by company
  (custom-set-faces
   '(company-preview
     ((t (:foreground "darkgray" :underline t))))
   '(company-preview-common
     ((t (:inherit company-preview :weight bold))))
   '(company-tooltip
     ((t (:inherit popup-face))))
   '(company-scrollbar-bg
     ((t (:inherit popup-scroll-bar-background-face))))
   '(company-scrollbar-fg
     ((t (:inherit popup-scroll-bar-foreground-face))))
   '(company-tooltip-selection
     ((t (:inherit popup-menu-selection-face))))
   '(company-tooltip-common
     ((((type x)) (:inherit company-tooltip :weight bold))
      (t (:inherit company-tooltip))))
   '(company-tooltip-common-selection
     ((((type x)) (:inherit company-tooltip-selection :weight bold))
      (t (:inherit company-tooltip-selection)))))
:custom
  (company-minimum-prefix-length 2)
  (company-idle-delay 0.0))

(require 'lsp-mode)
(require 'lsp-rust)
(lsp-define-stdio-client 'rust-mode "rust" 'stdio #'lsp-rust--get-root "Rust Language Server" (lsp-rust--rls-command))

(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'my/python-mode-hook)
(use-package company-jedi
    :ensure t
    :config
    (add-hook 'python-mode-hook 'jedi:setup))

(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'my/python-mode-hook)

(use-package try
	:ensure t)

(use-package posframe :ensure t)

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

(setq py-python-command "python3")
(setq python-shell-interpreter "python3")


(use-package elpy
  :ensure t
  :custom (elpy-rpc-backend "jedi")
  :config

  (elpy-enable)

  )

(use-package virtualenvwrapper
  :ensure t
  :config
  (venv-initialize-interactive-shells)
  (venv-initialize-eshell))

(global-hl-line-mode t)
 ; deletes all the whitespace when you hit backspace or delete
(use-package hungry-delete
  :ensure t
  :config
  (global-hungry-delete-mode))

(use-package smartparens
:ensure t
  :hook (prog-mode . smartparens-mode)
  :custom
  (sp-escape-quotes-after-insert nil)
  :config
  (require 'smartparens-config))

 (use-package default-text-scale
      :ensure t
     :config
      (global-set-key (kbd "C-M-=") 'default-text-scale-increase)
      (global-set-key (kbd "C-M-0") 'default-text-scale-reset)
      (global-set-key (kbd "C-M--") 'default-text-scale-decrease))

(use-package better-shell
    :ensure t
    :bind (("C-\"" . better-shell-shell)
           ("C-:" . better-shell-remote-open)))

(show-paren-mode t)

(use-package ggtags
  :ensure t
  :config
  (add-hook 'c-mode-common-hook
            (lambda ()
              (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
		(ggtags-mode 1)))))

(use-package simple-mpc
:ensure t)
(use-package mingus
:ensure t)

(use-package deadgrep
:ensure t)

(use-package rg
:ensure t
:commands rg)

(use-package fzf :ensure t)

(use-package eglot)
(add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)

(use-package autothemer)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(rustic flycheck-rust rainbow-mode which-key vscode-icon visual-fill-column virtualenvwrapper use-package typescript-mode try tree-sitter-langs timp smartparens simple-mpc rust-mode rg rainbow-delimiters pfuture org-bullets omnisharp mingus material-theme lua-mode lsp-ui lsp-ivy jedi ivy-rich iedit hydra hungry-delete humanoid-themes helm google-c-style go-mode ggtags general fzf flymake-google-cpplint exwm evil-nerd-commenter evil-magit evil-collection eterm-256color elpy elisp-refs eglot doom-themes doom-modeline dmenu dired-single dired-open dired-hide-dotfiles default-text-scale deadgrep darktooth-theme counsel-projectile company-plisp company-org-roam company-lsp company-jedi company-irony company-c-headers company-box command-log-mode cfrs better-shell auto-complete-clang-async auto-complete-clang auto-complete-c-headers ample-theme all-the-icons-ivy all-the-icons-dired afternoon-theme ace-window)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-preview ((t (:foreground "darkgray" :underline t))))
 '(company-preview-common ((t (:inherit company-preview :weight bold))))
 '(company-scrollbar-bg ((t (:inherit popup-scroll-bar-background-face))))
 '(company-scrollbar-fg ((t (:inherit popup-scroll-bar-foreground-face))))
 '(company-tooltip ((t (:inherit popup-face))))
 '(company-tooltip-common ((((type x)) (:inherit company-tooltip :weight bold)) (t (:inherit company-tooltip))))
 '(company-tooltip-common-selection ((((type x)) (:inherit company-tooltip-selection :weight bold)) (t (:inherit company-tooltip-selection))))
 '(company-tooltip-selection ((t (:inherit popup-menu-selection-face)))))
