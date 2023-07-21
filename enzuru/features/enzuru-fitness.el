;; -*- coding: utf-8; lexical-binding: t -*-

(defun enzuru-fitness-monthly-deficit (daily-calories daily-training-hours)
  (let ((rmr 2175)
        (burned-per-hour 400))
    (/ (* 30 (- rmr (- daily-calories (* daily-training-hours burned-per-hour))))
       3500)))

(defun enzuru-fitness-vo2-max (ftp kilos)
  (+ (/ (* 10.8 ftp) kilos) 7))

(provide 'enzuru-fitness)
