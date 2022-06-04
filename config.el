;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Dusan Kovacevic"
      user-mail-address "dusankovacevic95@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-font (font-spec :family "Menlo" :size 18))
;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one-light)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq fancy-splash-image (expand-file-name "banner.png" doom-private-dir))
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)


;; Does not work on MacOS :(
(add-hook 'window-setup-hook #'toggle-frame-maximized)
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

(map! :after winum :leader
      :n "0" #'winum-select-window-0-or-10
      :n "1" #'winum-select-window-1
      :n "2" #'winum-select-window-2
      :n "3" #'winum-select-window-3
      :n "4" #'winum-select-window-4
      :n "5" #'winum-select-window-5
      :n "6" #'winum-select-window-6
      :n "7" #'winum-select-window-7
      :n "8" #'winum-select-window-8
      :n "9" #'winum-select-window-9)
(after! (winum which-key)
  (push '((nil . "winum-select-window-[0-9]") . t) which-key-replacement-alist))
(after! winum
  (setq winum-scope 'frame-local))

(map! :leader
      :desc "M-x""SPC" #'execute-extended-command)
(map! :leader
      :desc "Open kill ring""k" #'consult-yank-from-kill-ring)

;; Only disables "Are you sure?"-type prompts.
;; Prompts for unsaved modified buffers, terminals with running processes etc will still appear.
(setq confirm-kill-emacs nil)

;;(remove-hook 'doom-first-buffer-hook #'smartparens-global-mode)
(setq rainbow-delimiters-max-face-count 0)
(setq projectile-project-search-path '("~/Workspace" "~/Playground"))

(setq treemacs--width-is-locked nil)
; Separate kill ring from system clipboard
(setq interprogram-cut-function nil)

(after! lispy
  (setq lispyville-key-theme
        '(;; (operators normal)
          ;; c-w
          ;; (prettify insert)
          ;; (atom-movement normal visual)
          ;; (additional-movement normal)
          ;; slurp/barf-lispy
          ;; additional
          )))
