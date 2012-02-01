;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-magit ()
  (global-auto-revert-mode t))

;; Packages

(use-package magit
  :ensure t
  :bind (("C-c s" . 'magit-status)
         ("C-c C-p" . 'magit-push-current-to-upstream))
  :config (enzuru-configure-magit))

(provide 'enzuru-version-control)
