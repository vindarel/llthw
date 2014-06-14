;;;; -*- Mode: LISP; Syntax: COMMON-LISP; Package: LLTHW; Base: 10 -*-
;;;; file: templates.lisp

;;;; Copyright (c) 2012--2014 "the Phoeron" Colin J.E. Lupton <//thephoeron.com>
;;;; See LICENSE for additional information.

(in-package :llthw)

(defun llthw-footer ()
  (cl-who:with-html-output (hunchentoot::*standard-output*)
    (:div :id "footer"
      (:div :class "container"
        (:p :align "center"
          (:a :href "http://common-lisp.net/" :alt "Crafted in Common Lisp" :title "Crafted in Common Lisp" "(λ)"))
        (:p :align "center"
          "Copyright &copy; 2012 &ndash; 2014, \"the Phoeron\" Colin J.E. Lupton ("
          (:a :href "http://thephoeron.com/" :target "_blank" :alt "//thephoeron.com/" :title "//thephoeron.com/" "//thephoeron.com/")
          "). All Rights Reserved.")
        (:p :align "center"
          "Powered by "
          (:a :href "http://www.webfaction.com/?affiliate=thephoeron" :target "_blank" "Webfaction") ", "
          (:a :href "http://www.sbcl.org/" :target "_blank" "SBCL") ", "
          (:a :href "https://github.com/davazp/jscl" :target "_blank" "JSCL") ", "
          (:a :href "http://www.quicklisp.org/" :target "_blank" "Quicklisp") ", "
          (:a :href "http://weitz.de/hunchentoot/" :target "_blank" "Hunchentoot") ", "
          (:a :href "https://github.com/Inaimathi/cl-css" :target "_blank" "CL-CSS") ", "
          (:a :href "http://weitz.de/cl-who/" :target "_blank" "CL-WHO") ", "
          (:a :href "https://github.com/vsedach/Parenscript" :target "_blank" "Parenscript") ", "
          (:a :href "https://github.com/3b/3bmd" :target "_blank" "3bmd") ", "
          (:a :href "https://github.com/redline6561/colorize" :target "_blank" "Colorize") ", "
          (:a :href "http://jquery.com/" :target "_blank" "jQuery") ", and "
          (:a :href "http://getbootstrap.com/" :target "_blank" "Bootstrap") ".")))))

(defmacro basic-llthw-page ((&key (title "L(λ)THW")) &body body)
  `(cl-who:with-html-output-to-string (hunchentoot::*standard-output* nil :prologue t :indent t)
    (:html :lang "en"
      (:head
        (:meta :charset "utf-8")
        (:meta :name "viewport" :content "width=device-width, initial-scale=1.0")
        (:meta :name "description" :content "Learn Lisp The Hard Way")
        (:meta :name "author" :content "\"the Phoeron\" Colin J.E. Lupton")
        (:link :rel "stylesheet" :href "//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css")
        (:link :rel "stylesheet" :href "//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css")
        (:link :rel "stylesheet" :href "//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css")
        (:link :rel "stylesheet" :href "/static/css/llthw.css")
        (google-analytics)
        (:title ,title))
      (:body
        (:nav :class "navbar navbar-inverse navbar-fixed-top" :role "navigation"
          (:div :class "container"
            (:div :class "navbar-header"
              ;(:a :class "navbar-brand" :href "#" (str (format nil "L(~C)THW" #\greek_small_letter_lamda)))
              )
            ;(:ul :class "nav navbar-nav"
            ;  (:li :class "active" (:a :href "/" "Home"))
            ;  (:li (:a :href "/try-lisp/" "Try Lisp"))
            ;  (:li (:a :href "/book/" "Book"))
            ;  (:li (:a :href "/resources/" "Resources")))
              ))
        ,@body
        (llthw-footer)
        (:script :src "//code.jquery.com/jquery-1.11.0.min.js")
        (:script :src "//code.jquery.com/jquery-migrate-1.2.1.min.js")
        (:script :src "//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js")))))

(defmacro llthw-page ((&key (title "L(λ)THW") (subtitle "Draft v0.2.0 (alpha) &mdash; \"the Phoeron\" Colin J.E. Lupton") (section "book")) &body body)
  `(cl-who:with-html-output-to-string (hunchentoot::*standard-output* nil :prologue t :indent t)
    (:html :lang "en"
      (:head
        (:meta :charset "utf-8")
        (:meta :name "viewport" :content "width=device-width, initial-scale=1.0")
        (:meta :name "description" :content "Learn Lisp The Hard Way")
        (:meta :name "author" :content "\"the Phoeron\" Colin J.E. Lupton")
        (:link :rel "stylesheet" :href "//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css")
        (:link :rel "stylesheet" :href "//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css")
        (:link :rel "stylesheet" :href "//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css")
        (:link :rel "stylesheet" :href "/static/css/llthw.css")
        ;(:style :type "text/css" (str colorize:*coloring-css*))
        (google-analytics)
        (:title ,title))
      (:body :data-spy "scroll" :data-target ".sidebar" :data-offset "90"
        (:nav :class "navbar navbar-inverse navbar-fixed-top" :role "navigation"
          (:div :class "container"
            (:div :class "navbar-header"
              (:a :class "navbar-brand" :href "/" (str (format nil "L(~C)THW" #\greek_small_letter_lamda))))
            (:ul :class "nav navbar-nav"
              (:li :title "Home" (:a :href "/" "Home"))
              (:li :title "Book" :class (str (if (string= ,section "book") "active" " "))
                (:a :href "/book/" "Book"))
              (:li :title "Resources" :class (str (if (string= ,section "resources") "active" " "))
                (:a :href "/resources/" "Resources"))
              (:li :title "Try Lisp" :class (str (if (string= ,section "try-lisp") "active" " "))
                (:a :href "/try-lisp/" "Try Lisp"))
              (:li :title "Get Lisp" :class (str (if (string= ,section "get-lisp") "active" " "))
                (:a :href "/get-lisp/" "Get Lisp"))
              (:li :title "Donations" :class (str (if (string= ,section "donations") "active" " "))
                (:a :href "/donate/" "Donations")))))
        (:div :class "jumbotron subhead" :id "overview"
          (:div :class "container"
            (:h1 :class "title" "L(λ)THW " (:small "Learn Lisp The Hard Way"))
            (:p :class "lead" ,subtitle)))
        (:div :class "container" :id "body"
          (:div :class "row"
            (:div :class "col-md-9" :id "llthwdoc"
              (:a :name "top")
              ,@body
              (:h2 "Comments"))
            (:div :class "col-md-3"
              (:div :class "sidebar hidden-print affix" :data-spy "affix" :data-offset-top "250" :role "complementary"
                (:ul :class "nav sidenav"))))
          (:div :class "row"
            (:div :class "col-md-9"
              (:div :id "disqus_thread")
              (:script :type "text/javascript"
                "/* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
                var disqus_shortname = 'learnlispthehardway'; // required: replace example with your forum shortname

                /* * * DON'T EDIT BELOW THIS LINE * * */
                (function() {
                  var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
                  dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
                  (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
                })();")
              (:noscript "Please enable JavaScript to view the " (:a :href "http://disqus.com/?ref_noscript" "comments powered by Disqus."))
              (:a :href "http://disqus.com" :class "dsq-brlink" "comments powered by " (:span :class "logo-disqus" "Disqus")))))
        (llthw-footer)
        (:script :src "//code.jquery.com/jquery-1.11.0.min.js")
        (:script :src "//code.jquery.com/jquery-migrate-1.2.1.min.js")
        (:script :src "//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js")
        ;(:script :src "/static/js/jscl.js" :type "text/javascript")
        ;(:script :src "/static/js/jqconsole.min.js" :type "text/javascript")
        (:script :src "/static/js/llthw.js" :type "text/javascript")
        (:script :src "/llthw.js" :type "text/javascript")))))

(defmacro try-lisp-page ((&key (title "L(λ)THW")) &body body)
  `(cl-who:with-html-output-to-string (hunchentoot::*standard-output* nil :prologue t :indent t)
    (:html :lang "en"
      (:head
        (:meta :charset "utf-8")
        (:meta :name "viewport" :content "width=device-width, initial-scale=1.0")
        (:meta :name "description" :content "Learn Lisp The Hard Way")
        (:meta :name "author" :content "\"the Phoeron\" Colin J.E. Lupton")
        (:link :rel "stylesheet" :href "//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css")
        (:link :rel "stylesheet" :href "//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css")
        (:link :rel "stylesheet" :href "//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css")
        (:link :rel "stylesheet" :href "/static/css/llthw.css")
        (google-analytics)
        (:title ,title))
      (:body :data-spy "scroll" :data-target ".sidebar" :data-offset "90"
        (:nav :class "navbar navbar-inverse navbar-fixed-top" :role "navigation"
          (:div :class "container"
            (:div :class "navbar-header"
              (:a :class "navbar-brand" :href "/" (str (format nil "L(~C)THW" #\greek_small_letter_lamda))))
            (:ul :class "nav navbar-nav"
              (:li (:a :href "/" "Home"))
              (:li (:a :href "/book/" "Book"))
              (:li (:a :href "/resources/" "Resources"))
              (:li :class "active" (:a :href "/try-lisp/" "Try Lisp"))
              (:li (:a :href "/get-lisp/" "Get Lisp"))
              (:li (:a :href "/donate/" "Donations")))))
        (:div :class "jumbotron trylisphead" :id "overview"
          (:div :class "container"
            (:div :class "row"
              (:div :class "col-md-12"
                (:h1 "L(λ)THW" (:small "Try Common Lisp"))
                (:p "&nbsp;")))
            (:div :class "row"
              (:div :class "col-md-6" :id "trylispbody"
                ,@body)
              (:div :class "col-md-6"
                (:div :id "console")))))
        (llthw-footer)
        (:script :src "//code.jquery.com/jquery-1.11.0.min.js")
        (:script :src "//code.jquery.com/jquery-migrate-1.2.1.min.js")
        (:script :src "//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js")
        (:script :src "/static/js/jscl.js" :type "text/javascript")
        (:script :src "/static/js/jqconsole.min.js" :type "text/javascript")
        (:script :src "/static/js/llthw.js" :type "text/javascript")
        (:script :src "/llthw.js" :type "text/javascript")))))

;; EOF
