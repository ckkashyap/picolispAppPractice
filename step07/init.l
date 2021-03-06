(call 'rm '-f "test.db")
(pool *DBNM)

(setq *RED (new! '(+TagNm) 'nm "RED" 'dsc "All RED items"))
(setq *BLUE (new! '(+TagNm) 'nm "BLUE" 'dsc "All BLUE items"))
(setq *GREEN (new! '(+TagNm) 'nm "GREEN" 'dsc "All GREEN items"))

(de new-task (Ttl Tgs)
    (let N (new! '(+Task) 'ttl Ttl  'dt (date 2019 12 1))
         (for Tg Tgs
              (put!> N 'tgs (new! '(+Tag) 'nm Tg 'tsk N ))
         )
         (put!> N 'cmts (new! '(+Cmt) 'cmt "UPDATE1" 'tsk N 'dt (date 2019 12 1) 'tm (time) ))
         (put!> N 'cmts (new! '(+Cmt) 'cmt "UPDATE2" 'tsk N 'dt (date 2019 12 2) 'tm (time) ))
         (put!> N 'cmts (new! '(+Cmt) 'cmt "UPDATE3" 'tsk N 'dt (date 2019 12 3) 'tm (time) ))
         
    )
)

(new-task "Item 1" (list *RED *GREEN *BLUE))
(new-task "Item 2" (list *GREEN *RED))
(new-task "Item 3" (list *GREEN *BLUE))
(new-task "Item 4" (list *RED))
(new-task "Item 5" (list *GREEN))
(new-task "Item 6" (list *BLUE))
(new-task "Item 7" NIL)
(new-task "Item 8" (list *RED *BLUE))

(de print-task (This)
    (prinl (: ttl) "<" This  ">: " " [" (glue ", " (mapcar '( (This)  (pack (: nm nm) "<" This " " (: nm) ">"   )) (: tgs) ) ) "]" )
)

(de print-all ()
    (for Tsk (collect 'ttl '(+Task))
         (print-task Tsk)))
