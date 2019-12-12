(action
        (html 0 Ttl "@lib.css" NIL
            (idForm "TITLE" '(choTask) 'nm '+Name *CanEdit *CanDelete '("The " (: ttl) " Title")
                (<grid> 2
                        "Title" (gui '(+E/R +Cue +TextField) '(ttl : home obj) "title" 40)
                        "Title" (gui '(+Init +TextField) "ABCD" 40)

                        (gui '(+Set +E/R +Chart) '((L) (filter bool L)) '(tgs : home obj) 4
                              '( (This) (list This (: nm)))
                                 #'((X) (car X))
                                 '((L D)                                    # 'Get'- function
                                        (out "+/tmp/dingo.txt" (prinl "L = " L " D = " D  " " (with D (: nm)) ))
                                        (when D
                                             (when (not (= (cadr L) (with D (: nm)))) (put!> D 'nm (cadr L) )) )
                                        D ) 
                              )
                        (<table> 'chart ,"Tags"
                              '(("em7" "Tags") ("em7" "Tags") ("em7" "Tags") ("em7" "Tags"))
                              (do 6
                                 (<row> (alternating)
                                    (gui 1 '(+ObjView +TextField) '(: nm))
                                    (gui 2 '(+TextField) 10)
                                    (gui 3 '(+DelRowButton))
                                    (gui 4 '(+BubbleButton)) ) ) )
                           (scroll 6 T)
                )
             )
        )
    )
