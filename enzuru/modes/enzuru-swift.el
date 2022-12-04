;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-swift-mode ()
  (setq swift-tab-width 4)
  (setq swift-indent-offset 4)
  (add-hook 'swift-mode-hook 'flycheck-mode))

;; Packages

(use-package flycheck-swiftx
  :ensure t
  :defer t)

(use-package swift-mode
  :ensure t
  :defer t
  :config (enzuru-configure-swift-mode))

(provide 'enzuru-swift)
