
(require 'package) 
(add-to-list 'package-archives
	      '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
   ;; For important compatibility libraries like cl-lib
   (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

(require 'god-mode)
(global-set-key (kbd "<escape>") 'god-local-mode)
(defun my-update-cursor ()
  (setq cursor-type (if (or god-local-mode buffer-read-only)
                        'box
                      'bar)))
(add-hook 'god-mode-enabled-hook 'my-update-cursor)
(add-hook 'god-mode-disabled-hook 'my-update-cursor)
(defun c/god-mode-update-cursor ()
   (let ((limited-colors-p (> 257 (length (defined-colors)))))
    (cond (god-local-mode (progn
                            (set-face-background 'mode-line (if limited-colors-p "white" "#e9e2cb"))
                            (set-face-background 'mode-line-inactive (if limited-colors-p "white" "#e9e2cb"))))
          (t (progn
               (set-face-background 'mode-line (if limited-colors-p "black" "#0a2832"))
               (set-face-background 'mode-line-inactive (if limited-colors-p "black" "#0a2832")))))))
(global-set-key (kbd "C-x C-1") 'delete-other-windows)
(global-set-key (kbd "C-x C-2") 'split-window-below)
(global-set-key (kbd "C-x C-3") 'split-window-right)
(global-set-key (kbd "C-x C-0") 'delete-window)
(define-key god-local-mode-map (kbd ".") 'repeat)

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))
;remove emacs splash screen
(setq inhibit-splash-screen t)
;activate helm search by default
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key [f8] 'neotree-toggle)
(require 'helm-config)
(load-theme 'misterioso)
(desktop-save-mode 1)
(helm-mode 1)
(vimish-fold-global-mode 1)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook #'rainbow-mode) 
(ac-config-default) ;autocorrect
(global-set-key (kbd "C-M-f") #'vimish-fold)
(global-set-key (kbd "C-M-v") #'vimish-fold-delete)
(global-set-key [f9] 'org-board-keymap)
(show-paren-mode t)
(setq org-log-done 'time)
(setq org-agenda-files (list "~/Documents/live/org/school.org"))
					;(global-set-key (kbd "C-k") "p")
					;(global-set-key (kbd "C-p") "y")
					;(global-set-key (kbd "C-y") "w")
					;(global-set-key (kbd "C-j") "n")
					;(global-set-key (kbd "C-l") "f")
(setq initial-scratch-message "\
#
#
#                     __gggrgM**M#mggg__
#                __wgNN@'B*P''mp''@d#'@N#Nw__
#              _g#@0F_a*F#  _*F9m_ ,F9*__9NG#g_
#           _mN#F  aM'    #p'    !q@    9NL '9#Qu_
#          g#MF _pP'L  _g@'9L_  _g''#__  g'9w_ 0N#p
#        _0F jL*'   7_wF     #_gF     9gjF   'bJ  9h_
#       j#  gAF    _@NL     _g@#_      J@u_    2#_  #_
#      ,FF_#' 9_ _#'  'b_  g@   'hg  _#'  !q_ jF '*_09_
#      F N'    #p'      Ng@       `#g'      'w@    '# t
#     j p#    g'9_     g@'9_      gP'#_     gF'q    Pb L
#     0J  k _@   9g_ j#'   'b_  j#'   'b_ _d'   q_ g  ##    Get to Work.
#     #F  'NF     '#g'       'Md'       5N#      9W'  j#    [[link][description]]
#     #k  jFb_    g@'q_     _*'9m_     _*'R_    _#Np  J#     
#     tApjF  9g  J'   9M_ _m'    9%_ _*'   '#  gF  9_jNF
#      k'N    'q#       9g@        #gF       ##'    #'j
#      '_0q_   #'q_    _&'9p_    _g''L_    _*'#   jAF,'
#       9# 'b_j   'b_ g'    *g _gF    9_ g#'  'L_*'qNF
#        'b_ '#_    'NL      _B#      _I@     j#' _#'
#          NM_0'*g_ j''9u_  gP  q_  _w@ ]_ _g*'F_g@
#           'NNh_ !w#_   9#g'    'm*'   _#*' _dN@'
#              9##g_0@q__ #'4_  j*'k __*NF_g#@P'
#                '9NN#gIPNL_ 'b@' _2M'Lg#N@F'
#                    ''P@*NN#gEZgNN@#@P''
#")
