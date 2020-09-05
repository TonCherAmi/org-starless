;;; org-starless.el --- Hide stars in org-mode

;; Copyright (C) 2020 TonCherAmi

;; Author: TonCherAmi
;; URL: https://github.com/TonCherAmi/org-starless
;; Version: 0.0.2
;; Package-Requires: ((emacs "25.1"))

;; This file is NOT part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 3, or (at
;; your option) any later version.
;;
;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program ; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;; This package hides org-mode heading stars.

;;; Code:

(define-minor-mode org-starless-mode
  "Starless org-mode"
  nil nil nil
  :require 'org
  (let* ((keyword
          `(("^\\(\\*+ \\)\\s-*\\S-" ; Do not hide empty headings!
             (1 (put-text-property (match-beginning 1) (match-end 1) 'invisible t)
                nil)))))
    (if org-starless-mode
        (progn
          (font-lock-add-keywords nil keyword)
          (font-lock-ensure)
          (font-lock-flush))
      (save-excursion
        (goto-char (point-min))
        (font-lock-remove-keywords nil keyword)
        (font-lock-ensure)
        (font-lock-flush)))))

(provide 'org-starless)

;;; org-starless.el ends here
