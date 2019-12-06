(action
        (html 0 Ttl "@lib.css" NIL
            (idForm "TITLE" '(choTask) 'nm '+Name *CanEdit *CanDelete '("The" (: ttl) " Title")
                (<grid> 2
                        "Title" (gui '(+E/R +Cue +TextField) '(ttl : home obj) "title" 40)
                 )
             )
        )
    )
