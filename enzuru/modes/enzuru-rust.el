;; -*- coding: utf-8; lexical-binding: t -*-

;; Functions

(defun enzuru-configure-rust-ts-mode ()
  (add-to-list 'auto-mode-alist '("\\.rs$" . rust-ts-mode))
  (add-hook 'rust-ts-mode-hook 'racer-mode)
  (add-hook 'rust-ts-mode-hook 'eglot-ensure))

;; (defun enzuru-configure-rustic ()
;;   (rustic-doc-setup))

(defun enzuru-configure-rust-playground ()
  (setf rust-playground-basedir "~/"))

;; (defun enzuru-rust-search-doc ()
;;   (rustic-doc-search (intern (thing-at-point 'word))))

;; Packages

(use-package racer
  :ensure t
  :hook ((racer-mode . eldoc-mode)
         (racer-mode . company-mode)))

(use-package rust-playground
  :ensure t
  :config (enzuru-configure-rust-playground)
  :defer t)

;; (use-package rustic
;;   :ensure t
;;   :init (enzuru-configure-rustic)
;;   :bind (:map rust-ts-mode-map (("C-x C-d" . enzuru-rust-search-doc))))

(enzuru-configure-rust-ts-mode)

(provide 'enzuru-rust)
