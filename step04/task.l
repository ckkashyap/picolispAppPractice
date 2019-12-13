(action
   (html 0 Ttl "@lib.css" NIL
       (idForm "TITLE" '(choTask) 'nm '+Name *CanEdit *CanDelete '("The " (: ttl) " Title")
           (<grid> 2
               "Title" (gui '(+E/R +Cue +TextField) '(ttl : home obj) "title" 40)

               (gui '(+E/R +Chart) '(tgs : home obj) 3
                     '( (This) (list (: nm nm)))
                     '((L D)
                          (cond
                             ((and D (car L)) (put!> D 'nm (request! '(+TagNm) 'nm (car L)) ) D)
                             ((car L) (new! '(+Tag) 'nm (request! '(+TagNm) 'nm (uppc (car L))) 'tsk (: home obj)))
                             (T D))
                      )
               )
           )
           (--)
           (<table> NIL "Tags"
                 '(NIL NIL NIL)
                 (do 6
                    (<row> (alternating)
                       (gui 1 '(+DbHint +TextField) '(nm +TagNm) 40)
                       (gui 2 '(+DelRowButton))
                       (gui 3 '(+BubbleButton)) ) )
           )
           (scroll 6 T)
       )
   )
)
