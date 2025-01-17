;; -*- coding: utf-8; lexical-binding: t -*-

;; Configuration

(defun enzuru-configure-gnus ()
  (setq gnus-search-default-engines '(notmuch)
        gnus-select-method '(nntp "news.tilde.club"
                                  (nntp-address "news.tilde.club")
                                  (nntp-via-address "tilde.institute")
                                  (nntp-via-rlogin-command "ssh")
                                  (nntp-via-rlogin-command-switches ("-C"))
                                  (nntp-netcat-switches ("-w" "15"))
                                  (nntp-open-connection-function nntp-open-via-rlogin-and-netcat))
        gnus-show-threads t
        gnus-thread-indent-level 1
        gnus-thread-hide-subtree t
        gnus-search-use-parsed-queries t
        gnus-verbose 10
        gnus-verbose-backends 10
        gnus-always-read-dribble-file t
        fill-column 72
        mail-user-agent 'message-user-agent
        message-auto-save-directory "~/mail/draft"
        message-default-mail-headers "Cc: \nBcc: \n"
        message-directory "~/mail/"
        message-kill-buffer-on-exit t
        message-send-mail-function 'message-smtpmail-send-it
        send-mail-function 'smtpmail-send-it
        smtpmail-smtp-server "mail.enzu.ru"
        smtpmail-smtp-service 587
        user-mail-address "me@enzu.ru"
        user-full-name "Ahmed Khanzada")
  (gnus-add-configuration '(article (horizontal 1.0 (summary .5 point) (article 1.0)))))

(defun enzuru-configure-nnnotmuch ()
  (setf gnus-secondary-select-methods '((nnnotmuch "")
                                        (nntp "newshosting"
                                              (nntp-open-connection-function nntp-open-ssl-stream)
                                              (nntp-port-number 563)
                                              (nntp-address "news.newshosting.com"))))
  (setq nnnotmuch-groups '((""
                            ("openbsd" "tag:openbsd")
                            ("openbsd.commits" "tag:openbsd-commits")
                            ("openbsd.bugs" "tag:openbsd-bugs")
                            ("gnu" "tag:gnu")
                            ("gnu.commits" "tag:gnu-commits")
                            ("gnu.bugs" "tag:gnu-bugs")
                            ("9front" "tag:9front")
                            ("archive.openbsd" "tag:archive-openbsd")
                            ("archive.openbsd.commits" "tag:archive-openbsd-commits")
                            ("archive.openbsd.bugs" "tag:archive-openbsd-bugs")
                            ("archive.gnu" "tag:archive-gnu")
                            ("archive.gnu.commits" "tag:archive-gnu-commits")
                            ("archive.gnu.bugs" "tag:archive-gnu-bugs")
                            ("archive.9front" "tag:archive-9front")))))

(defun enzuru-configure-notmuch ()
  (setq notmuch-search-oldest-first nil
        notmuch-draft-save-plaintext nil))

;; Packages

(use-package gnus
  :ensure t
  :defer t
  :config (enzuru-configure-gnus))

(use-package notmuch
  :ensure t
  :defer t
  :config (enzuru-configure-notmuch))

(straight-use-package
 '(nnnotmuch
   :type git
   :host github
   :repo "tlikonen/nnnotmuch"))
(require 'nnnotmuch)

(enzuru-configure-nnnotmuch)

(provide 'enzuru-mail)
