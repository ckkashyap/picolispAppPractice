(call 'rm '-f "test.db")
(pool "test.db")


(setq *RED (new! '(+TagNm) 'yy "TGNM1"))
(setq *BLUE (new! '(+TagNm) 'yy "TGNM2"))

(de new-task (Ttl Tgs)
    (let N (new! '(+Task) 'ttl Ttl)
         (for Tg (cons "ALL" Tgs)
              (put!> N 'tgs (new! '(+Tag) 'nm Tg 'tsk N ))
         )
    )
)

(new-task "Item 1" (list "RED" "GREEN" "BLUE"))
(new-task "Item 2" (list "GREEN" "RED"))
(new-task "Item 3" (list "GREEN" "BLUE"))
(new-task "Item 4" (list "RED"))
(new-task "Item 5" (list "GREEN"))
(new-task "Item 6" (list "BLUE"))
(new-task "Item 7" NIL)
(new-task "Item 8" (list "RED" "BLUE"))

(de print-task (This)
    (prinl (: ttl) "<" This  ">: " " [" (glue ", " (mapcar '( (This)  (pack (: nm) "<" This ">" " " (: xx yy) "<" (: xx)  ">"   )) (: tgs) ) ) "]" )
)

(de print-all ()
    (for Tsk (collect 'ttl '(+Task))
         (print-task Tsk)))
