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
                        ("Tasks" (and "task.l"))
                        ("Tags" (and "tag.l"))
                     )
                  ) 
               )
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
      (<grid> 2 
          "Title" (gui 'ttl '(+DbHint +Var +TextField) '(ttl +Task) '*Title 100)
          "Contains" (gui 'tags '(+Var +Val +ListTextField) '*Tags1 '((L) (extract uppc L)) '(","," ") 100)
          "!Contains" (gui 'tags2 '(+Var +Val +ListTextField) '*Tags2 '((L) (extract uppc L)) '(","," ") 100)
          "Due Date" (gui 'date '(+Init +Var +DateField) (date) '*Due 100)
          (<grid> 10
          (searchButton '(init> (: home query)))
          (gui '(+Button) "Work" '(prog (setq *Due (date)) (setq *Tags1 "WORK OPEN") ) )
          (gui '(+Button) "Fun" '(prog (setq *Due (date)) (setq *Tags1 "FUN OPEN") ) )
          (gui '(+Button) "+ 1 Week" '(prog (setq *Due (+ *Due 7)) ) )
          (gui '(+Button) "- 1 Week" '(prog (setq *Due (- *Due 7)) ) )
          )
      )
      (gui 'query '(+QueryChart) *ROWS 
        '(goal 
           '(   @Ttl *Title
                @Tags1 *Tags1
                @Tags2 *Tags2
                @Key (car *Tags1)
                @Tdy (cons *Due)
                (select (@@)
                   #((nm +TagNm @Key (nm +Tag) tsk))
                   ((ttl +Task NIL))
                   (part @Ttl @@ ttl)
                   (range @Tdy @@ dt)
                   (^ @ 
                      (fully 
                          '((Nm) 
                              (find 
                                 '((This) (= Nm (: nm nm))) 
                                 (; (-> @@) tgs) ) ) 
                          (-> @Tags1)
                      )
                   )
                   (^ @ 
                      (fully 
                          '((Nm) 
                              (not (find 
                                 '((This) (= Nm (: nm nm))) 
                                 (; (-> @@) tgs) ) ) )
                          (-> @Tags2)
                      )
                   )
                )
            )
        )
        2
        '((This) (list This (: dt) ))
      )
      (<table> 'chart (choTtl "Entries" '+Task)
          (quote
             ("em20 align" "Title")
             ("em2 align" "Due")
          )

          (do *ROWS 
              (<row> (alternating)
                  (gui 1 '(+ObjView +TextField) '(: ttl))
                  (gui 2 '(+DateField))
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

(setq *DBNM "diary.db")

(de main () 
    (load "init.l")
    (print-all)
    (prinl "READY"))

(de go ()
(pool *DBNM)
(server 8080 "!work"))
