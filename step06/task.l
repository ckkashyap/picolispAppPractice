(de updateTask ()
   (let Cmt (get *ID 'cmt)
      (when Cmt
         (put!> *ID 'cmt NIL)
         (put!> *ID 'cmts (new! '(+Cmt) 'cmt Cmt 'tsk *ID ))
      )
   )
)

(updateTask)
(action
   (html 0 Ttl "@lib.css" NIL
       (idForm "TITLE" '(choTask) 'ttl '+Task *CanEdit *CanDelete '( (: ttl) )
           (<grid> 2
               "Title" (gui '(+E/R +Cue +TextField) '(ttl : home obj) "title" 40)
               "Update" (gui '(+E/R +TextField) '(cmt : home obj) 40)

           )

           (gui '(+E/R +Chart) '(cmts : home obj) 2
                 '( (This) (list (: cmt) NIL))
                 '((L D)
                      (cond
                         ((and D (car L)) (put!> D 'cmt (car L) ) D)
                         (T D))
                  )
           )
           (<table> 'chart "Updates"
                 '(NIL)
                 (do 6
                    (<row> (alternating)
                       (gui 1 '(+ObjView +TextField) '(: cmt) )
                       (gui 2 '(+DelRowButton))

                       ) )
           )
           (scroll 6 T)

           (gui '(+E/R +Chart) '(tgs : home obj) 3
                 '( (This) (list (: nm nm)))
                 '((L D)
                      (cond
                         ((and D (car L)) (put!> D 'nm (request! '(+TagNm) 'nm (car L)) ) D)
                         ((car L) (new! '(+Tag) 'nm (request! '(+TagNm) 'nm (uppc (car L))) 'tsk (: home obj)))
                         (T D))
                  )
           )
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
