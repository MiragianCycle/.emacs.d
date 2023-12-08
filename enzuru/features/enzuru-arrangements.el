;; -*- coding: utf-8; lexical-binding: t -*-

(defun enzuru-tab-exists-p (tab-name)
  "Check if a tab exists with the given TAB-NAME."
  (catch 'tab-exists
    (dolist (tab (tab-bar-tabs))
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
    (when (> amount 0)
      (switch-to-buffer one))
    (when (> amount 1)
      (split-window-horizontally)
      (other-window 1)
      (switch-to-buffer two))
    (when (> amount 2)
      (split-window-vertically)
      (other-window 1)
      (switch-to-buffer three))
    (when (> amount 3)
      (other-window 1)
      (split-window-vertically)
      (switch-to-buffer four))))

(defun enzuru-setup-tab (name one &rest args)
  (interactive)
  (if (enzuru-tab-exists-p name)
      (tab-bar-close-tab-by-name name))
  (tab-bar-new-tab)
  (tab-bar-rename-tab name)
  (let ((amount (+ 1 (length args)))
        (two (nth 0 args))
        (three (nth 1 args))
        (four (nth 2 args))
        (five (nth 3 args))
        (six (nth 4 args))
        (seven (nth 5 args))
        (eight (nth 6 args)))
    (when (> amount 0)
      (switch-to-buffer one))
    (when (> amount 1)
      (split-window-horizontally)
      (other-window 1)
      (switch-to-buffer two))
    (when (> amount 2)
      (other-window 1)
      (split-window-horizontally)
      (other-window 1)
      (switch-to-buffer three))
    (when (> amount 3)
      (other-window 1)
      (split-window-horizontally)
      (other-window 1)
      (switch-to-buffer four))
    (when (> amount 4)
      (other-window 1)
      (split-window-vertically)
      (other-window 1)
      (switch-to-buffer five))
    (when (> amount 5)
      (other-window 1)
      (split-window-vertically)
      (other-window 1)
      (switch-to-buffer six))
    (when (> amount 6)
      (other-window 1)
      (split-window-vertically)
      (other-window 1)
      (switch-to-buffer seven))
    (when (> amount 8)
      (other-window 1)
      (split-window-vertically)
      (other-window 1)
      (switch-to-buffer eight))))

(defun enzuru-arrange-apps ()
  (interactive)
  (enzuru-setup-tab "tasks" "*Guix Bugs*")
  (enzuru-setup-tab "hacking" "*dashboard*")
  (enzuru-setup-tab ".emacs.d" "init.el" "magit: .emacs.d")
  (enzuru-setup-tab "mail" "*Group*")
  (enzuru-setup-tab "gemini" "*elpher*")
  (enzuru-setup-tab "geiser" "*Geiser Guile REPL*")
  (enzuru-setup-tab "sly" "*sly-mrepl for sbcl*")
  (tab-bar-select-tab-by-name "hacking"))

(defun enzuru-arrange-chats ()
  (interactive)
  (enzuru-setup-tab "news" "##baseball" "#us-market-news" "#trading" "Libera.Chat")
  (enzuru-setup-tab "chat" "darkscience" "#darkscience")
  (enzuru-setup-tab "feminism" "Libera.Chat" "##feminism" "##feminism-unregistered" "#books")
  (enzuru-setup-tab "security" "#openbsd" "#tor-relay" "#bitcoin" "#ircv3" "#security")
  (enzuru-setup-tab "role-playing" "#DarkMyst" "#rpg-hub" "#imarel" "#imarel_ooc")
  (enzuru-setup-tab "demoscene" "#demoscene" "#c-64" "IRCnet")
  (enzuru-setup-tab "gnu" "#gnu" "#gnu-linux-libre" "#guix" "#guile")
  (enzuru-setup-tab "misc" "#emacs" "#exwm" "#stumpwm" "#gnustep")
  (enzuru-setup-tab "lisp" "#lisp" "#commonlisp" "#scheme" "#clojure" "#lispgames")
  (enzuru-setup-tab "9fans" "#cat-v" "##9fans" "OFTC")
  (enzuru-setup-tab "tilde" "#meta" "#institute" "#gemini" "#politics")
  (enzuru-setup-tab "hashbang" "hashbang.sh" "#!")
  (tab-bar-select-tab-by-name "tilde"))

(defun enzuru-add-chats ()
  (interactive)
  (znc-all))

(defun enzuru-add-apps ()
  (interactive)
  (find-file "~/.emacs.d/init.el")
  (magit-status)
  (debbugs-gnu '("wishlist") '("emacs" "gnus" "guile" "guix-patches" "hyperbole" "guix"))
  (sly)
  (gnus)
  (elpher)
  (geiser 'guile)
  (enzuru-arrange-apps))

(provide 'enzuru-arrangements)
