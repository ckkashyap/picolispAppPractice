(action
   (html 0 Ttl "@lib.css" NIL
       (idForm "TITLE" '(choTask) 'ttl '+Task *CanEdit *CanDelete '( (: ttl) )

           (<grid> 1
            (gui '(+E/R +DateField) '(dt : home obj) 40)
            (gui '(+E/R +Cue +TextField) '(ttl : home obj) "title" 100 2)
           )

           (<table> '((style . "border: dotted 1px;")) "Updates" '(NIL NIL)
                (<row> NIL
                    (<td> NIL
                        (gui '(+E/R +Chart) '(cmts : home obj) 4
                              '( (This) (list (: cmt) (: dt) (: tm) ))
                              '((L D)
                                   (cond
                                      ((and D (car L)) (put!> D 'cmt (car L) ) D)
                                      ((car L) (new! '(+Cmt) 'cmt (car L) 'dt (date) 'tm (time) 'tsk (: home obj)))
                                      (T D))
                               )
                        )
                        (<table> NIL NIL
                              '(NIL NIL NIL NIL)
                              (do 3
                                 (<row> (alternating)
                                    (gui 1 '(+TextField) 150 3)
                                    (gui 2 '(+DateField))
                                    (gui 3 '(+TimeField))
                                    (gui 4 '(+DelRowButton))
                                 )
                              )
                        )
                        (scroll 3 T)
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
)
