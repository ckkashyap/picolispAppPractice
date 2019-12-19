(load "er.l" "@lib/http.l" "@lib/xhtml.l" "@lib/form.l")

(setq *Css '("@lib.css" "lib.css" "menu.css"))

(setq *CanEdit T)
(setq *CanDelete T)
(setq *ROWS 10)


(de menu (Ttl . Prg)
   (action
      (html 0 Ttl *Css NIL
         (<ping> 7)
         (<layout>
            ((180 0 'menu)
               (<div> @
                  (expires)
                  (<menu>
                     ("Home" "!work")
                     (NIL (<hr>))
                     (T ""
                        ("Tasks" (and "task.l")))
                      ) )
               ((NIL NIL 'main)
                  (<div> @ (run Prg 1)) ) ) ) ) ) )

(de work ()
   (setq *Url "!work")
   (and (app) (setq *Menu 1))
   (menu "PicoLisp App"
      )
   )


(de choTask (Dst)
   (diaform '(Dst)
      (<grid> "--"
          "Name" (gui 'ttl '(+DbHint +Var +TextField) '(ttl +Task) '*Title 20)
          "Tags" (gui 'tags '(+Var +Val +ListTextField) '*Tags '((L) (extract uppc L)) '(","," ") 20)
          (searchButton '(init> (: home query)))
      )
      (gui 'query '(+QueryChart) *ROWS 
        '(goal 
           '(   @Ttl *Title
                @Names *Tags
                @Key (car *Tags)
                (select (@@)
                   ((nm +TagNm @Key (nm +Tag) tsk))
                   (part @Ttl @@ ttl)
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
