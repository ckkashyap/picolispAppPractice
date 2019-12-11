(action
        (html 0 Ttl "@lib.css" NIL
            (idForm "TITLE" '(choTask) 'nm '+Name *CanEdit *CanDelete '("The " (: ttl) " Title")
                (<grid> 2
                        "Title" (gui '(+E/R +Cue +TextField) '(ttl : home obj) "title" 40)

                        (gui '(+E/R +Chart) '(tgs : home obj) 4
                              '( (This) (list This This))
                                 '((X) (car X))
                              )
                        (<table> 'chart ,"Tags"
                              '((NIL ,"Tags") (NIL ,"Tags"))
                              (do 6
                                 (<row> (alternating)
                                    (gui 1 '(+ObjView +TextField) '(: nm))
                                    (gui 2 '(+ObjView +TextField) '(: xx yy ))
                                    (gui 3 '(+DelRowButton))
                                    (gui 4 '(+BubbleButton)) ) ) )
                           (scroll 6 T)
                )
             )
        )
    )
