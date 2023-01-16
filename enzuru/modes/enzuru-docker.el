;; -*- coding: utf-8; lexical-binding: t -*-

;; Packages

(use-package flymake-hadolint
  :ensure t
  :hook ((dockerfile-mode . flymake-hadolint-setup)))

(use-package docker
  :bind ("C-c d" . 'docker)
  :ensure t)

(use-package docker-tramp
  :defer t
  :ensure t)

(use-package dockerfile-mode
  :mode (("Dockerfile" . dockerfile-mode))
  :ensure t)

(provide 'enzuru-docker)
