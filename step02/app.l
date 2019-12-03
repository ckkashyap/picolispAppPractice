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

(de choTask (Dst)
   (diaform '(Dst)
                (<grid> "--"
                     "Name" (gui 'ttl '(+DbHint +Var +TextField) '(ttl +Task) '*Name 20)
                     (searchButton '(init> (: home query)))
                 )
                 (gui 'query '(+QueryChart) *ROWS 
                          '(goal
                              (quote
                                  @Nm *Name
                                  (select (@@)
                                      ( (ttl +Task @Nm) )
                                  )
                               )
                           )
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
    (call 'rm '-f "test.db")
    (pool "test.db")
    (for I (range 1 15)
        (new! '(+Task) 'ttl (pack "Item " (pad 3 I))))
    (prinl "READY"))

(de go ()
(server 8080 "!work"))
