(class +Task +Entity)
(rel ttl (+IdxFold +String))
(rel cmt (+IdxFold +String))
(rel cmts (+List +Joint) tsk (+Cmt))
(rel tgs (+List +Joint) tsk (+Tag))

(dm url> (Tab)
  (and (list "task.l" '*ID This)) )

(class +Tag +Entity)
(rel tsk (+Joint) tgs (+Task))
(rel nm (+Ref +Link) NIL (+TagNm))

(class +TagNm +Entity)
(rel nm (+IdxFold +String))
(dm url> (Tab)
  (and (list "tag.l" '*ID This)) )

(class +Cmt +Entity)
(rel tsk (+Joint) cmts (+Task))
(rel cmt (+String))
(dm url> (Tab)
  (and (list "update.l" '*ID This)) )
