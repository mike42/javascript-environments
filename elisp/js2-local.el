;; Copyright (C) 2015, 2016 The MathJax Consortium

;; Author: Volker Sorge <v.sorge@mathjax.org>

;;  Licensed under the Apache License, Version 2.0 (the "License");
;;  you may not use this file except in compliance with the License.
;;  You may obtain a copy of the License at
;; 
;;      http://www.apache.org/licenses/LICENSE-2.0
;; 
;;  Unless required by applicable law or agreed to in writing, software
;;  distributed under the License is distributed on an "AS IS" BASIS,
;;  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;;  See the License for the specific language governing permissions and
;;  limitations under the License.

;; 
;; Augmentations for the js2 mode.
;;


(autoload 'js2-mode "js2-mode" nil t)
;;(load-library "js2-mode")
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))
(load-library "jsdoc-helpers")
(load-library "nodejs-helpers")
;;
;; Some Java Script extensions
;;

(add-hook 'js2-mode-hook
          '(lambda ()
             (setq js2-basic-offset 2)
             (setq column-number-mode t)
             (setq autopair-dont-activate t)
             (flymake-mode)
             (flycheck-mode +1)
             (setq flycheck-check-syntax-automatically '(save mode-enabled))
             (jsdoc-local-mode-map)
             (node-js-local-mode-map)
             (electric-pair-mode)
             )
          )

(defun jslint-buffer ()
  (interactive)
  (compile (format "gjslint --unix_mode --strict --jsdoc %s" (buffer-file-name)) nil)
  )


(load-library "closure-glslint")
