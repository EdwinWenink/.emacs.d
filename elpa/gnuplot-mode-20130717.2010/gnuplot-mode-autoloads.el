;;; gnuplot-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (gnuplot-mode gnuplot-run-buffer) "gnuplot-mode"
;;;;;;  "gnuplot-mode.el" (20968 41130))
;;; Generated autoloads from gnuplot-mode.el

(autoload 'gnuplot-run-buffer "gnuplot-mode" "\
Runs gnuplot -persist as a synchronous process and passes the
current buffer to it.  Buffer must be visiting a file for it to
work.

\(fn)" t nil)

(autoload 'gnuplot-mode "gnuplot-mode" "\
Major mode for editing gnuplot files

\(fn)" t nil)

(dolist (pattern '("\\.gnuplot\\'" "\\.gp\\'")) (add-to-list 'auto-mode-alist (cons pattern 'gnuplot-mode)))

;;;***

;;;### (autoloads nil nil ("gnuplot-mode-pkg.el") (20968 41131 63931))

;;;***

(provide 'gnuplot-mode-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; gnuplot-mode-autoloads.el ends here
