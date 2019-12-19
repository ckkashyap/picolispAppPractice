(load "er.l" "@lib/http.l" "@lib/xhtml.l" "@lib/form.l")

(setq *Css '("@lib.css" "lib.css" "menu.css"))



(de main ()
   (pool "test.db")
   (load "init.l") )

(de go (Rpc)
   (pool "test.db")
   (when Rpc
      (task (port @)  # Set up query server in the background
         (let? Sock (accept @)
            (unless (fork)  # Child process
               (in Sock
                  (while (rd)
                     (sync)
                     (tell)
                     (out Sock
                        (pr (eval @)) ) ) )
               (bye) )
            (close Sock) ) )
      (forked) )
   (rollback)
   (retire 20)
   (server (or (format (sys "PORT")) 8080) "!work") )
