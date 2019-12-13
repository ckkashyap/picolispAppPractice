(action
        (html 0 Ttl "@lib.css" NIL
            (idForm "TITLE" '(choTask) 'nm '+Name *CanEdit *CanDelete '("The " (: ttl) " Title")
                (<grid> 2
                        "Title" (gui '(+E/R +Cue +TextField) '(ttl : home obj) "title" 40)

                        (gui '(+Set +E/R +Chart) '((L) (filter bool L)) '(tgs : home obj) 3
                              '( (This) (list (: nm)))
                                 '((L D)
                                        (when D
                                             (put!> D 'nm (car L) ) )
                                        D ) 
                        )
                        (<table> 'chart "Tags1"
                              '((NIL) ("em1")("em1"))
                              (do 6
                                 (<row> (alternating)
                                    (gui 1 '(+TextField) 40)
                                    (gui 2 '(+DelRowButton))
                                    (gui 3 '(+BubbleButton)) ) )
                        )
                        (scroll 6 T)
                )
             )
        )
    )
