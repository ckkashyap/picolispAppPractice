(load "er.l" "@lib/http.l" "@lib/xhtml.l" "@lib/form.l")

(setq *CanEdit T)
(setq *CanDelete T)
(setq *ROWS 10)

(de work ()
    (app)
    (action
        (html 0 Ttl "@lib.css" NIL
            (idForm "TITLE" '(choTask) 'nm '+Name *CanEdit *CanDelete '("The" (: ttl) " Title"))
        )
    )
)

(setq Goal '(goal 
                     '(
                         @Names XXX
                         @Gen (mapcan '((Nm) (list 'nm '+TagNm Nm)) 'XXX)
                         (select (@@)
                          ((@Gen (nm +Tag) tsk))
                          (^ @ 
                           (fully 
                            '((Nm) 
                                (find 
                                 '((This) (member Nm (: nm nm))) 
                                 (; (-> @@) tgs) ) ) 
                            (-> @Names) ) )
                         )
                      )
                  )
)
(patch Goal 'XXX '(filter '((X) X) (mapcar '((X) (uppc (pack X)))  *Tags)))

(de choTask (Dst)
   (diaform '(Dst)
                (<grid> "--"
                     "Name" (gui 'ttl '(+DbHint +Var +TextField) '(ttl +Task) '*Name 20)
                     "Tags" (gui 'tags '(+Var +ListTextField) '*Tags '(","," ") 20)
                     (searchButton '(init> (: home query)))
                 )
                (gui 'query '(+QueryChart) *ROWS 
                          Goal
                          1
                         '((This) (list This))
                 )
                 (<table> NIL (choTtl "Entries" '+Task)
                     (quote
                        ("em20 align" "Name")
                     )

                     (do *ROWS 
                         (<row> NIL
                             (gui 1 '(+ObjView +TextField) '(: ttl))
                         )
                     )
                 )
                 (<spread>
                    (scroll *ROWS)
                    (newButton T Dst '(+Task)))
     )
)

(de main () 
    (load "init.l")
    (prinl "READY"))

(de go ()
(server 8080 "!work"))
