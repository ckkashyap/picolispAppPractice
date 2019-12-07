(de updateTags (L) 
    (for I (get *ID 'tgs) (lose!> I))
    (for I L
         (put!> *ID 'tgs (new! '(+Tag) 'tsk *ID 'nm  (or (db 'nm '+TagNm I) (new! '+TagNm 'nm I)  )    ) ))
    L
    )

(action
        (html 0 Ttl "@lib.css" NIL
            (idForm "TITLE" '(choTask) 'nm '+Name *CanEdit *CanDelete '("The " (: ttl) " Title")
                (<grid> 2
                        "Title" (gui '(+E/R +Cue +TextField) '(ttl : home obj) "title" 40)
                        "Tags" (gui '(+Init +Set +ListTextField) (extract '((Tg) (get (get Tg 'nm) 'nm)) (get *ID 'tgs)) '((L) (updateTags L))  '(","," ")  40  )
                 )
             )
        )
    )
