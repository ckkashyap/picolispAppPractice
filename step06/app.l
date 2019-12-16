(load "er.l" "@lib/http.l" "@lib/xhtml.l" "@lib/form.l")

(setq *CanEdit T)
(setq *CanDelete T)
(setq *ROWS 10)

(de work ()
    (app)
    (action
        (html 0 Ttl "@lib.css" NIL
            (idForm "TITLE" '(choTask) 'ttl '+Task *CanEdit *CanDelete '((: ttl)))
        )
    )
)

(de choTask (Dst)
   (diaform '(Dst)
      (<grid> "--"
          "Name" (gui 'ttl '(+DbHint +Var +TextField) '(ttl +Task) '*Name 20)
          "Tags" (gui 'tags '(+Var +Val +ListTextField) '*Tags '((L) (extract uppc L)) '(","," ") 20)
          (searchButton '(init> (: home query)))
      )
      (gui 'query '(+QueryChart) *ROWS 
        '(goal 
           '(@Names *Tags
                @Key (car *Tags)
                (select (@@)
                   ((nm +TagNm @Key (nm +Tag) tsk))
                   (^ @ 
                      (fully 
                          '((Nm) 
                              (find 
                                 '((This) (member Nm (: nm nm))) 
                                 (; (-> @@) tgs) ) ) 
                          (-> @Names)
                      )
                   )
                )
            )
        )
        2
        '((This) (list This (glue " " (mapcar '((This) (: nm nm)) (: tgs) )) ))
      )
      (<table> NIL (choTtl "Entries" '+Task)
          (quote
             ("em20 align" "Name")
             ("em20 align" "Tags")
          )

          (do *ROWS 
              (<row> NIL
                  (gui 1 '(+ObjView +TextField) '(: ttl))
                  (gui 2 '(+TextField))
              )
          )
      )
      (<spread>
         (scroll *ROWS)
         (newButton T Dst '(+Task)))
   )
)

(de choTag (Dst)
   (diaform '(Dst)
      (<grid> "--"
          "Name" (gui 'nm '(+DbHint +Var +TextField) '(nm +TagNm) '*Name 20)
          (searchButton '(init> (: home query)))
      )
      (gui 'query '(+QueryChart) *ROWS 
        '(goal 
           '(@Name *Name
             (select (@@)
                ((nm +TagNm @Name))
             )
            )
        )
        1
        '((This) (list This ))
      )
      (<table> NIL (choTtl "Entries" '+TagNm)
          (quote
             ("em20 align" "Name")
          )

          (do *ROWS 
              (<row> NIL
                  (gui 1 '(+ObjView +TextField) '(: nm))
              )
          )
      )
      (<spread>
         (scroll *ROWS)
         (newButton T Dst '(+TagNm)))
   )
)

(de main () 
    (load "init.l")
    (print-all)
    (prinl "READY"))

(de go ()
(pool "test.db")
(server 8080 "!work"))
