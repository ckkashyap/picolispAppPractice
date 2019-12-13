(class +Task +Entity)
(rel ttl (+IdxFold +String))
(rel tgs (+List +Joint) tsk (+Tag))

(dm url> (Tab)
  (and (list "task.l" '*ID This)) )

(class +Tag +Entity)
(rel tsk (+Joint) tgs (+Task))
(rel nm (+Ref +Link) NIL (+TagNm))

(class +TagNm +Entity)
(rel nm (+IdxFold +String))
