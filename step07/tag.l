(action
   (html 0 Ttl "@lib.css" NIL
       (idForm "TAG" '(choTag) 'nm '+TagNm *CanEdit *CanDelete '( (: nm) )
           (<grid> 2
               "Name" (gui '(+E/R +TextField) '(nm : home obj) 40)
               "Description" (gui '(+E/R +TextField) '(dsc : home obj) 40)
           )
       )
   )
)
