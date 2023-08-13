;; -*- coding: utf-8; lexical-binding: t -*-

(defun enzuru-tab-exists-p (tab-name)
  "Check if a tab exists with the given TAB-NAME."
  (catch 'tab-exists
    (dolist (tab (tab-bar-tabs))
      ;; (debug)
      (when (string-equal (alist-get 'name tab) tab-name)
        (throw 'tab-exists t))) nil))

(defun enzuru-setup-tab-squares (name one &rest args)
  (interactive)
  (if (enzuru-tab-exists-p name)
      (tab-bar-close-tab-by-name name))
  (tab-bar-new-tab)
  (tab-bar-rename-tab name)
  (let ((amount (+ 1 (length args)))
        (two (nth 0 args))
        (three (nth 1 args))
        (four (nth 2 args)))
    (if (> amount 0)
        (progn
          (switch-to-buffer one)))
    (if (> amount 1)
        (progn
          (split-window-horizontally)
          (other-window 1)
          (switch-to-buffer two)))
    (if (> amount 2)
        (progn
          (split-window-vertically)
          (other-window 1)
          (switch-to-buffer three)))
    (if (> amount 3)
        (progn
          (other-window 1)
          (split-window-vertically)
          (switch-to-buffer four)))))

(defun enzuru-setup-tab (name one &rest args)
  (interactive)
  (if (enzuru-tab-exists-p name)
      (tab-bar-close-tab-by-name name))
  (tab-bar-new-tab)
  (tab-bar-rename-tab name)
  (let ((amount (+ 1 (length args)))
        (two (nth 0 args))
        (three (nth 1 args))
        (four (nth 2 args)))
    (if (> amount 0)
        (progn
          (switch-to-buffer one)))
    (if (> amount 1)
        (progn
          (split-window-horizontally)
          (other-window 1)
          (switch-to-buffer two)))
    (if (> amount 2)
        (progn
          (other-window 1)
          (split-window-horizontally)
          (other-window 1)
          (switch-to-buffer three)))
    (if (> amount 3)
        (progn
          (other-window 1)
          (split-window-horizontally)
          (other-window 1)
          (switch-to-buffer four)))))

(defun enzuru-arrange-workspace ()
  (interactive)
  ;; (enzuru-setup-tab "bugs" "*Woodchuck Bugs*")
  (enzuru-setup-tab "hacking" "*dashboard*")
  (enzuru-setup-tab ".emacs.d" "init.el")
  (enzuru-setup-tab "ai" "*chatgpt*")
  (enzuru-setup-tab "eshell" "*eshell*")
  (enzuru-setup-tab "files" "*eFAR*")
  (enzuru-setup-tab "mail" "*Group*")
  (enzuru-setup-tab "gemini" "*elpher*")
  (enzuru-setup-tab "geiser" "*Geiser Guile REPL*")
  (enzuru-setup-tab "sly" "*sly-mrepl for sbcl*")
  (tab-bar-select-tab-by-name "hacking"))

(defun enzuru-arrange-chats ()
  (interactive)
  (enzuru-setup-tab "news" "##baseball" "#us-market-news" "#trading" "Libera.Chat")
  (enzuru-setup-tab "chat" "darkscience" "#darkscience")
  (enzuru-setup-tab "feminism" "Libera.Chat" "##feminism")
  (enzuru-setup-tab "security" "#openbsd" "#tor-relay" "#bitcoin" "#ircv3")
  (enzuru-setup-tab "role-playing" "#DarkMyst" "#rpg-hub" "#imarel" "#imarel_ooc")
  (enzuru-setup-tab "demoscene" "#demoscene" "#c-64" "IRCnet")
  (enzuru-setup-tab "gnu" "#gnu" "#gnu-linux-libre" "#guix" "#guile")
  (enzuru-setup-tab "emacs" "#emacs" "#exwm" "#lispgames" "#gnustep")
  (enzuru-setup-tab "lisp" "#lisp" "#commonlisp" "#scheme" "#clojure")
  (enzuru-setup-tab "9fans" "#cat-v" "##9fans" "OFTC")
  (enzuru-setup-tab "tilde" "#meta" "#institute" "#gemini" "#security")
  (tab-bar-select-tab-by-name "role-playing"))

(defun enzuru-add-chats ()
  (interactive)
  (znc-all))

(defun enzuru-add-workspaces ()
  (interactive)
  (find-file "~/.emacs.d/init.el")
  (sly)
  ;; (debbugs-gnu '() debbugs-gnu-all-packages)
  (chatgpt-shell)
  (eshell)
  (enzuru-efar)
  (gnus)
  (elpher)
  (geiser 'guile)
  (enzuru-arrange-workspace))

(provide 'enzuru-arrangements)
