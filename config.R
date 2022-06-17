### local host and port
options( shiny.host = '192.168.128.110' )
options( shiny.port = 8283 )
#options( shiny.maxRequestSize = 100*1024^2 ) 

user_base <- tibble::tibble(
  user = c("mary", "yenifer","veronica","wendy"),
  password = sapply(c("mary001", "yenifer001","veronica123",
                      "wendy001"), sodium::password_store),
  permissions = c("admin", "admin", "admin", "admin"),
  name = c("User1", "User2","User3", "User4")
)
