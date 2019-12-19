(menu "Item"
    (idForm "TITLE" '(choTask) 'ttl '+Task *CanEdit *CanDelete '( (: ttl) )

        (<grid> 2
         "Due" (gui '(+E/R +DateField) '(dt : home obj) 10)
         "Title" (gui '(+E/R +Cue +TextField) '(ttl : home obj) "title" 100)
        )

        (<table> '((style . "border: dotted 1px;")) "Updates" '(NIL NIL)
             (<row> NIL
                 (<td> NIL
                     (gui '(+E/R +Chart) '(cmts : home obj) 4
                           '( (This) (list NIL (: cmt) (: dt) (: tm)  ))
                           '((L D)
                                (cond
                                   ((and D (cadr L))  D)
                                   ((cadr L) (new! '(+Cmt) 'cmt (cadr L) 'dt (date) 'tm (time) 'tsk (: home obj)))
                                   (T D))
                            )
                     )
                     (<table> NIL NIL
                           '(NIL NIL NIL NIL)
                           (for R (range 1 5)
                              (<row> (alternating)
                                 (if (= R 1) (gui 1 '(+InsRowButton)) (gui 1 '(+DelRowButton)))
                                 (gui 2 '(+TextField) 150 3)
                                 (gui 3 '(+DateField))
                                 (gui 4 '(+TimeField))
                              )
                           )
                     )
                     (scroll 5 T)
                 )
                 (<td> '((style . "vertical-align:top;")) 

                     (gui '(+E/R +Chart) '(tgs : home obj) 4
                           '( (This) (list (: nm) (: nm nm)))
                           '((L D)
                                (cond
                                   ((and D (cadr L)) (put!> D 'nm (request! '(+TagNm) 'nm (cadr L)) ) D)
                                   ((cadr L) (new! '(+Tag) 'nm (request! '(+TagNm) 'nm (uppc (cadr L))) 'tsk (: home obj)))
                                   (T D))
                            )
                     )
                     (<table> NIL NIL
                           '(NIL NIL NIL NIL)
                           (do 10
                              (<row> (alternating)
                                 (gui 1 '(+DstButton))
                                 (gui 2 '(+DbHint +TextField) '(nm +TagNm) 10)
                                 (gui 3 '(+DelRowButton))
                                 (gui 4 '(+BubbleButton)) ) )
                     )
                     (scroll 10 T)
                  )
             )
        )
    )
)
