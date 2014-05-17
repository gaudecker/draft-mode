;;; draft-mode.el --- Rough drafting for Emacs.
;; Version: 0.1.0

;; Copyright (C) 2014 Eeli Reilin

;; Author: Eeli Reilin <eeli@fea.st>
;; Keywords: draft, drafting

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; When enabled, all input is inserted at (point-max), removing the
;; ability to revise the already written text.

;;; How to use:

;; Enable with `M-x draft-mode`.

;;; Code:

(defconst draft-mode-version "0.1.0")

(defvar draft-mode-map (make-sparse-keymap)
  "Keymap for draft-mode.")

(defgroup draft nil
  "Rough drafting for Emacs."
  :prefix "draft-"
  :version "24.3.1"
  :link '(emacs-commentary-link "draft-mode")
  :link '(url-link "https://github.com/gaudecker/draft-mode"))

(defun draft-pre-command-hook ()
  "Move point to the end of the buffer before self-insert."
  (if draft-mode
      (cond ((eq this-command 'org-self-insert-command)
             (end-of-buffer))
            ((eq this-command 'self-insert-command)
             (end-of-buffer)))))
(add-hook 'pre-command-hook 'draft-pre-command-hook)

(define-key draft-mode-map (kbd "C-d") 'end-of-buffer)
(define-key draft-mode-map (kbd "M-d") 'end-of-buffer)
(define-key draft-mode-map (kbd "C-w") 'end-of-buffer)
(define-key draft-mode-map (kbd "C-k") 'end-of-buffer)
(define-key draft-mode-map (kbd "M-<backspace>") 'end-of-buffer)
(define-key draft-mode-map (kbd "<backspace>") 'end-of-buffer)

;;;###autoload
(define-minor-mode draft-mode "draft mode" nil " Draft" draft-mode-map)

(provide 'draft-mode)
;;; draft-mode.el ends here
