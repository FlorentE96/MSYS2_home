;; Packages
(require 'package) ;; You might already have this line
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(add-to-list 'package-archives '("org" . "https://orgmode.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
;; load paths
(add-to-list 'load-path "~/.emacs.d/color-theme")
(add-to-list 'load-path "~/.emacs.d/elpa")
(add-to-list 'load-path "/msys64/mingw64/share/emacs/site-lisp")
(add-to-list 'load-path "~/.emacs.d/hideshowvis-el")
(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "~/.emacs.d/Highlight-Indentation-for-Emacs-master/")
(add-to-list 'load-path "~/.emacs.d/indent-guide-master/")
(add-to-list 'load-path "~/.emacs.d/highlight-indent-guides-master/")
(package-initialize)

;; Tool Bars / Menu Bars
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Register Windows
(global-set-key (kbd "<f9>") '(lambda () (interactive) (jump-to-register 9)
                                (message "Windows disposition loaded")))
(global-set-key (kbd "<f10>") '(lambda () (interactive) (window-configuration-to-register 9)
                                 (message "Windows disposition saved")))

(global-set-key (kbd "<f5>") '(lambda () (interactive) (window-configuration-to-register 9)
                                (gdb "arm-none-eabi-gdb -i=mi c:/Users/Florent/Documents/Work/KORG/openmonotron-proto/main/build/x16220.elf")))

;; Backup files
(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files

;; Tab width
(setq tab-width 4)

;; Parenthesis matching
(show-paren-mode 1)

;; Syntax highlight
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

;; Delete Selection
(delete-selection-mode t)

;; Disable Backup File
(setq make-backup-file nil)

;; show time
(display-time-mode 1)

;; Do not save desktop
(desktop-save-mode -1)

;; Hide scroll bar
(scroll-bar-mode -1)

;; Start in full screen
(toggle-frame-fullscreen)

;; flash instead of bell
(setq visible-bell t)

;; ===================== SCROLLING =====================
;; Single line scrolling
(setq scroll-conservatively 1)
;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

;; No tabs!!
(setq-default indent-tabs-mode nil)
;; Support Wheel Mouse Scrolling
(mouse-wheel-mode t)
;; Goto Line Number
(global-set-key '[f12] 'goto-line)
;; Line and Column number at bottom of window
(line-number-mode 0) (column-number-mode 0)
;; Line number in buffer
(global-linum-mode 0)
;; Select region and color
(transient-mark-mode t)

(require 'all-the-icons)

;; Fonts
; (set-default-font "Hack")
(set-default-font "DejaVu Sans Mono")
(when (member "DejaVu Sans Mono" (font-family-list))
  (set-face-attribute 'default nil :font "DejaVu Sans Mono-8"))
;; (make-face 'font-lock-special-macro-face)
;; (set-face-foreground 'font-lock-special-macro-face "pink")
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#272822" :foreground "#F8F8F2" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "outline" :family "DejaVu Sans Mono"))))
 '(ediff-current-diff-A ((t (:background "#910101"))))
 '(ediff-current-diff-B ((t (:background "#910101"))))
 '(ediff-current-diff-C ((t (:background "#910101"))))
 '(ediff-even-diff-A ((t (:inherit (quote hl-line)))))
 '(ediff-even-diff-B ((t (:inherit (quote hl-line)))))
 '(ediff-even-diff-C ((t (:inherit (quote hl-line)))))
 '(ediff-fine-diff-A ((t (:background "#ef0101" :inherit (quote bold)))))
 '(ediff-fine-diff-B ((t (:background "#ef0101" :inherit (quote bold)))))
 '(ediff-fine-diff-C ((t (:background "#ef0101" :inherit (quote bold)))))
 '(ediff-odd-diff-A ((t (:inherit (quote hl-line)))))
 '(ediff-odd-diff-B ((t (:inherit (quote hl-line)))))
 '(ediff-odd-diff-C ((t (:inherit (quote hl-line)))))
 '(font-lock-builtin-face ((t (:foreground "forest green" :box (:line-width 1 :color "forest green") :weight normal))))
 '(font-lock-warning-face ((t (:foreground "red" :box (:line-width 1 :color "orange red") :underline nil :slant italic :weight bold))))
 '(fringe ((t (:background "grey8" :foreground "royal blue"))))
 '(sml/time ((t (:inherit sml/modes :foreground "tomato" :width semi-condensed))))
 '(stripe-highlight ((t (:background "#2e2e31")))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(beacon-mode t)
 '(compilation-message-face (quote default))
 '(cursor-type (quote (bar . 3)))
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "f5b591870422cd28da334552aae915cdcae3edfcfedb6653a9f42ed84bbec69f" "5e1d1564b6a2435a2054aa345e81c89539a72c4cad8536cfe02583e0b7d5e2fa" default)))
 '(ediff-diff-options "-w" t)
 '(ediff-highlight-all-diffs nil t)
 '(ediff-split-window-function (quote split-window-horizontally) t)
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(fci-rule-color "#3C3D37")
 '(gdb-many-windows nil)
 '(global-visual-line-mode t)
 '(gud-gdb-command-name "arm-none-eabi-gdb -i=mi build/x16220.elf")
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100))))
 '(hs-hide-comments-when-hiding-all nil)
 '(magit-diff-use-overlays nil)
 '(monokai-highlight-line "grey11")
 '(neo-autorefresh t)
 '(neo-click-changes-root nil)
 '(neo-theme (quote icons))
 '(package-selected-packages
   (quote
    (fill-column-indicator multiple-cursors stripe-buffer neotree doom-themes magit yasnippet highlight-indentation markdown-mode use-package helm rainbow-mode beacon smart-mode-line undo-tree monokai-theme color-theme-monokai zen-and-art-theme)))
 '(pos-tip-background-color "#A6E22E")
 '(pos-tip-foreground-color "#272822")
 '(sml/name-width 20)
 '(sml/theme (quote dark))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(visual-line-fringe-indicators (quote (nil right-curly-arrow)))
 '(weechat-color-list
   (unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0")))
(load-theme 'monokai t)

;; #### CURSOR ####
(set-cursor-color "#ff4d4d")
;; Beacon mode : helps you find your cursor
(beacon-mode 1)
(setq beacon-push-mark 35)
(setq beacon-blink-when-window-scrolls nil)
(setq beacon-color "tomato")
(global-set-key (kbd "C-b") 'beacon-blink)

;; Format for displaying time
(setq display-time-string-forms
       '((propertize (concat " " dayname "." day " " monthname " " 24-hours ":" minutes " ")
                     )))

;; Window Dedicated toggling
;; from https://emacs.stackexchange.com/questions/2189/how-can-i-prevent-a-command-from-using-specific-windows
(defun toggle-window-dedicated ()
  "Control whether or not Emacs is allowed to display another
buffer in current window."
  (interactive)
  (message
   (if (let (window (get-buffer-window (current-buffer)))
         (set-window-dedicated-p window (not (window-dedicated-p window))))
       "%s: Can't touch this!"
     "%s is up for grabs.")
   (current-buffer)))
(global-set-key (kbd "C-c t") 'toggle-window-dedicated)

;; No startup message
(setq inhibit-startup-message t)
(put 'upcase-region 'disabled nil)

;; Undo tree mode for intuitive linear undo/redo
(global-undo-tree-mode 1)

(defalias 'redo 'undo-tree-redo)
(global-set-key (kbd "C-z") 'undo) ; 【Ctrl+z】
(global-set-key (kbd "C-y") 'redo) ; 【Ctrl+Shift+z】;  Mac style
(global-set-key (kbd "C-S-z") 'redo) ; 【Ctrl+Shift+z】;  Mac style

;; Classic ctrl+v pasting
(global-set-key (kbd "C-v") 'yank)

;; Occur (regexp matching) shortcut
(global-set-key (kbd "C-c o") 'occur)

;; http://home.thep.lu.se/~karlf/emacs.html

;; ### CODE FOLDING ###
;; https://www.emacswiki.org/emacs/HideShow
(defun toggle-selective-display (column)
      (interactive "P")
      (set-selective-display
       (or column
           (unless selective-display
             (1+ (current-column))))))
(defun toggle-hiding (column)
      (interactive "P")
      (if hs-minor-mode
          (if (condition-case nil
                  (hs-toggle-hiding)
                (error t))
              (hs-show-all))
        (toggle-selective-display column)))

(load-library "hideshow")
(global-set-key (kbd "C-+") 'toggle-hiding)

(defun my-hs-toggle-all ()
  "If anything isn't hidden, run `hs-hide-all', else run `hs-show-all'."
  (interactive)
  (let ((starting-ov-count (length (overlays-in (point-min) (point-max)))))
    (hs-hide-all)
    (when (equal (length (overlays-in (point-min) (point-max))) starting-ov-count)
      (hs-show-all))))

(global-set-key (kbd "C-*") 'my-hs-toggle-all)
(global-set-key (kbd "C--") 'hs-hide-level)

; (global-set-key (kbd "C-\\") 'toggle-selective-display)

;; Better looking code folding
(autoload 'hideshowvis-enable "hideshowvis" "Highlight foldable regions")
(autoload 'hideshowvis-minor-mode
  "hideshowvis"
  "Will indicate regions foldable with hideshow in the fringe."
  'interactive)
;; (hideshowvis-symbols)
(if (not (require 'hideshowvis nil t))
        (message "'hideshowvis' not found")
      (hideshowvis-symbols))

(dolist (hook (list 'emacs-lisp-mode-hook
                    'c++-mode-hook
                    'c-mode-common-hook))
  (add-hook hook 'hideshowvis-enable))

  ;; (make-face 'font-lock-notes-face)
  ;; (set-face-attribute 'font-lock-notes-face t :foreground "forest green" :box (:line-width 1 :color "forest green") :weight normal)
  ;; (make-face 'font-lock-fix-face)
  ;; ;; (set-face-attribute 'font-lock-fix-face t :foreground "red" :box (:line-width 1 :color "orange red") :underline nil :slant italic :weight bold)
  ;; ;; '(font-lock-builtin-face ((t (:foreground "forest green" :box (:line-width 1 :color "forest green") :weight normal))))
  ;; ;; '(font-lock-warning-face ((t (:foreground "red" :box (:line-width 1 :color "orange red") :underline nil :slant italic :weight bold))))

;; ########## PROGRAMMING ##########
(defun my-c-common-setup ()
  ;; Shortcut for opening header/source
  (local-set-key (kbd "C-c C-o") 'ff-find-other-file)
  ;; highlight the line under the point
  (hl-line-mode 1)
  ;; (fci-mode)
  ;; Highlight special keywords
  (when (> (display-color-cells) 16)
  (font-lock-add-keywords nil '(("\\<\\(__func__\\|__FUNCTION__\\|__PRETTY_FUNCTION__\\|__LINE__\\|__FILE__\\)"
                                 1 font-lock-preprocessor-face prepend)))
  (font-lock-add-keywords nil
                 '(("\\<\\(FIXME\\|TODO\\|BUG\\) *:" 1 font-lock-warning-face t)))
  (font-lock-add-keywords nil
                 '(("\\<\\(NOTE\\) *:" 1 font-lock-builtin-face t))))
  ;; (irony-mode 1)
  ;; (local-set-key (kbd "C-c C-p") 'company-complete)
  )

;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
;; (defun my-irony-mode-hook ()
;;   (define-key irony-mode-map [remap completion-at-point]
;;     'irony-completion-at-point-async)
;;   (define-key irony-mode-map [remap complete-symbol]
;;     'irony-completion-at-point-async))
;; (add-hook 'irony-mode-hook 'my-irony-mode-hook)
;; (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
;; ;; hack for irony to work smoothly on Windows; taken from irony-mode homepage
;; (when (boundp 'w32-pipe-read-delay)
;;   (setq w32-pipe-read-delay 0))
;; ;; Set the buffer size to 64K on Windows (from the original 4K)
;; ;; This was introduced to tackle performance issues with Emacs 25.1 on Windows
;; ;; https://github.com/Sarcasm/irony-mode/issues/321
;; (when (boundp 'w32-pipe-buffer-size)
;;   (setq irony-server-w32-pipe-buffer-size (* 64 1024)))

(defun my-c++-setup ()
  (when (> (display-color-cells) 16)
    (font-lock-add-keywords nil '(("\\<\\(constexpr\\|decltype\\|alignas\\|alignof\\|static_assert\\|\
thread_local\\|nullptr\\|noexcept\\|char16_t\\|char32_t\\)"
                                   1 font-lock-preprocessor-face prepend)))
  (font-lock-add-keywords nil
                 '(("\\<\\(FIXME\\|BUG\\|TODO\\) *:" 1 font-lock-warning-face t)))
  (font-lock-add-keywords nil
                 '(("\\<\\(NOTE\\) *:" 1 font-lock-builtin-face t)))))

(add-hook 'c-mode-common-hook #'my-c-common-setup)
(add-hook 'c++-mode-hook #'my-c++-setup)
(add-hook 'c-mode-common-hook 'cwarn-mode)
(add-hook 'c++-mode-hook 'cwarn-mode)

(add-hook 'c++-mode-hook        'hs-minor-mode)
(add-hook 'c-mode-common-hook   'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'java-mode-hook       'hs-minor-mode)
(add-hook 'lisp-mode-hook       'hs-minor-mode)
(add-hook 'perl-mode-hook       'hs-minor-mode)
(add-hook 'sh-mode-hook         'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-mode)
(add-hook 'shell-script-mode-hook 'rainbow-mode)


(autoload 'matlab-mode "matlab" "Matlab Editing Mode" t)
(add-to-list
 'auto-mode-alist
 '("\\.m$" . matlab-mode))
(setq matlab-indent-function t)
(setq matlab-shell-command "matlab")

;; Highlight the trailing whitespaces in bright pink
(defun tf-toggle-show-trailing-whitespace ()
  "Toggle show-trailing-whitespace between t and nil"
  (interactive)
  (setq show-trailing-whitespace (not show-trailing-whitespace))
  (if show-trailing-whitespace
      (message "Showing trailing WS...")
    (message "Hiding trailing WS...")))

(global-set-key (kbd "C-<") 'tf-toggle-show-trailing-whitespace)

;; ##### Annoying buffers ######

;; Makes *scratch* empty.
(setq initial-scratch-message "")

;; Removes *scratch* from buffer after the mode has been set.
(defun remove-scratch-buffer ()
  (if (get-buffer "*scratch*")
      (kill-buffer "*scratch*")))
(add-hook 'after-change-major-mode-hook 'remove-scratch-buffer)

;; Removes *messages* from the buffer.
(setq-default message-log-max nil)
(kill-buffer "*Messages*")

;; Removes *Completions* from buffer after you've opened a file.
(add-hook 'minibuffer-exit-hook
      '(lambda ()
         (let ((buffer "*Completions*"))
           (and (get-buffer buffer)
                (kill-buffer buffer)))))

;; Don't show *Buffer list* when opening multiple files at the same time.
(setq inhibit-startup-buffer-menu t)

;; Show only one active window when opening multiple files at the same time.
(add-hook 'window-setup-hook 'delete-other-windows)
(sml/setup)

;; (require 'helm)
;; (require 'sr-speedbar)
;; (defun my-speedbar-fun ()
;;   (interactive)
;;   (sr-speedbar-toggle)
;;   (sr-speedbar-select-window) )

;; (global-set-key [C-tab] 'my-speedbar-fun)

;; (require 'highlight-indentation)
;; (set-face-background 'highlight-indentation-face "gray11")
;; (set-face-background 'highlight-indentation-current-column-face "gray20")
;; (require 'indent-guide)
;; (setq indent-guide-char "|")
;; (indent-guide-global-mode)

;; Pretty indent guides
(require 'highlight-indent-guides)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(setq highlight-indent-guides-method 'character)
(setq highlight-indent-guides-auto-enabled 1) 
;; (set-face-foreground 'highlight-indent-guides-character-face "#7b2020")")

(require 'yasnippet)
(yas-global-mode 1)

;; ########## VERSION CONTROL ##########
(setq ediff-split-window-function 'split-window-horizontally)
(defun update-diff-colors ()
  "update the colors for diff faces"
  (set-face-attribute 'diff-added nil
                      :foreground "white" :background "green4")
  (set-face-attribute 'diff-removed nil
                      :foreground "white" :background "red3")
  (set-face-attribute 'diff-changed nil
                      :foreground "white" :background "purple4"))
(eval-after-load "diff-mode"
  '(update-diff-colors))
;; only hilight current diff:
(setq-default ediff-highlight-all-diffs 'nil)

;; turn off whitespace checking:
(setq ediff-diff-options "-w")

(add-hook 'ediff-load-hook
          (lambda ()
            
            (add-hook 'ediff-before-setup-hook
                      (lambda ()
                        (setq ediff-saved-window-configuration (current-window-configuration))))
            
            (let ((restore-window-configuration
                   (lambda ()
                     (set-window-configuration ediff-saved-window-configuration))))
              (add-hook 'ediff-quit-hook restore-window-configuration 'append)
              (add-hook 'ediff-suspend-hook restore-window-configuration 'append))))


;; ########### NEOTREE BROWSER ###########
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(add-to-list 'load-path "/some/path/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq inhibit-compacting-font-caches t)
;; (setq neo-smart-open t)

(add-hook 'dired-mode-hook 'stripe-listify-buffer)
(add-hook 'neotree-mode-hook 'stripe-listify-buffer)
(add-hook 'org-mode-hook 'turn-on-stripe-table-mode)

(add-hook 'neo-after-create-hook
   #'(lambda (_)
       (with-current-buffer (get-buffer neo-buffer-name)
         (setq truncate-lines t)
         (setq word-wrap nil)
         (make-local-variable 'auto-hscroll-mode)
         (setq auto-hscroll-mode nil))))

(use-package multiple-cursors
  :ensure t
  :bind (("C-S-<mouse-1>" . mc/toggle-cursor-on-click)))

;; Rule for 80 columns
(setq-default fill-column 80)
(require 'fill-column-indicator)
(setq fci-rule-color "#686868")
