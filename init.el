;; -*- coding: utf-8; lexical-binding: t -*-

;; Paths & packages

(add-to-list 'load-path "~/.emacs.d/enzuru/features")
(add-to-list 'load-path "~/.emacs.d/enzuru/modes")
(add-to-list 'load-path "~/.emacs.d/enzuru/preferences")
(add-to-list 'load-path "~/.emacs.d/enzuru/setup")
(add-to-list 'load-path "~/.emacs.d/enzuru/operating-systems")
(add-to-list 'load-path "~/.emacs.d/enzuru/themes")

(require 'enzuru-packages)

;; Features

(require 'enzuru-ai)
(require 'enzuru-arrangements)
(require 'enzuru-benchmarks)
(require 'enzuru-browser)
(require 'enzuru-bug-tracking)
(require 'enzuru-clipboard)
(require 'enzuru-completion)
(require 'enzuru-dashboard)
(require 'enzuru-debugging)
(require 'enzuru-documentation)
(require 'enzuru-file-management)
(require 'enzuru-fitness)
(require 'enzuru-language-servers)
(require 'enzuru-gaming)
(require 'enzuru-gemini)
(require 'enzuru-help)
(require 'enzuru-hyperlinking)
(require 'enzuru-irc)
(require 'enzuru-mail)
(require 'enzuru-modeline)
(require 'enzuru-movement)
(require 'enzuru-music)
(require 'enzuru-search)
(require 'enzuru-secrets-management)
(require 'enzuru-server)
(require 'enzuru-syntax-checking)
(require 'enzuru-spelling)
(require 'enzuru-studying)
(require 'enzuru-rest)
(require 'enzuru-terminal)
(require 'enzuru-uname)
(require 'enzuru-undo)
(require 'enzuru-version-control)
(require 'enzuru-writing)

;; Modes

(require 'enzuru-ansible)
(require 'enzuru-c)
(require 'enzuru-cpp)
(require 'enzuru-clojure)
(require 'enzuru-common-lisp)
(require 'enzuru-elixir)
(require 'enzuru-emacs-lisp)
(require 'enzuru-epub)
(require 'enzuru-feature)
(require 'enzuru-fish)
(require 'enzuru-fountain)
(require 'enzuru-go)
(require 'enzuru-groovy)
(require 'enzuru-haskell)
(require 'enzuru-javascript)
(require 'enzuru-kotlin)
(require 'enzuru-kubernetes)
(require 'enzuru-lisp)
(require 'enzuru-log)
(require 'enzuru-markdown)
(require 'enzuru-objective-c)
(require 'enzuru-org)
(require 'enzuru-php)
(require 'enzuru-protocol-buffers)
(require 'enzuru-puppet)
(require 'enzuru-python)
(require 'enzuru-ruby)
(require 'enzuru-rust)
(require 'enzuru-scheme)
(require 'enzuru-shell)
(require 'enzuru-sql)
(require 'enzuru-swift)
(require 'enzuru-typescript)
(require 'enzuru-terraform)
(require 'enzuru-web)
(require 'enzuru-yaml)

;; Preferences

(require 'enzuru-bars)
(require 'enzuru-bell)
(require 'enzuru-buffers)
(require 'enzuru-customization)
(require 'enzuru-frames)
(require 'enzuru-highlighting)
(require 'enzuru-margin)
(require 'enzuru-recent-files)
(require 'enzuru-remote)
(require 'enzuru-saving)
(require 'enzuru-scratch)
(require 'enzuru-scrolling)
(require 'enzuru-tabs)

;; Final setup

(require 'enzuru-cleanup)
(require 'enzuru-keys)
(require 'enzuru-shutdown)
(require 'enzuru-interface)
(require 'enzuru-syntax-highlighting)

;; Operating systems

(cond ((eq system-type 'gnu/linux)
       (require 'enzuru-linux))
      ((eq system-type 'darwin)
       (require 'enzuru-mac))
      ((eq system-type 'windows-nt)
       (require 'enzuru-windows))
      ((eq (enzuru-uname) 'FreeBSD)
       (require 'enzuru-freebsd))
      ((eq (enzuru-uname) 'OpenBSD)
       (require 'enzuru-openbsd)))

;; Local customization

(if (and (not (boundp 'enzuru-loaded-local))
         (file-exists-p "~/.emacs.d/local.el"))
    (load "~/.emacs.d/local.el"))
