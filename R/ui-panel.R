################################################################################################################################################################
# Ui panel


################################################################################################################################################################

DataExp <- tabPanel("EXPLORACION",
                    
                    column(3, 
                           h3(p(style="color:black;text-align:left", 
                                tags$img(src="https://raw.githubusercontent.com/rstudio/hex-stickers/master/thumbs/shiny.png",width="60px",height="60px"),
                                tags$img(src="https://i1.wp.com/fileserialkey.com/wp-content/uploads/2019/07/2-2.png?fit=300%2C300&ssl=1",width="60px",height="60px"),
                           )),
                           
                           textInput(inputId = "BNetlab",
                                     label = "Ingrese Cod. Netlab",
                                     value = NULL),
                           
                           numericInput(inputId = "FCorrida",
                                        label = "Selecciona Corrida",
                                        value = 42, min = 1, max = 1000),
                           selectInput(inputId = "Placa",
                                       label = "Seleccionar Placa",
                                       choices = c("placa1","placa2","placa3","placa4"),
                                       selected = "placa1")
                    ),
                    
                    
                    column(9,
                           shinycssloaders::withSpinner(
                             DT::dataTableOutput("tablemysql"), type = 3, color.background = "white", color = "blue")
                    )
)
###############################################################################################################################################################

UploadData <- navbarPage(theme = shinytheme("flatly"), 
                         "RMyAdmin-Ingreso", 
                         id="nav", tabPanel("INGRESO DE DATOS",
                                            useShinyjs(),
                                            column(3, 
                                                   h3(p(style="color:black;text-align:left", 
                                                        tags$img(src="https://raw.githubusercontent.com/rstudio/hex-stickers/master/thumbs/shiny.png",width="60px",height="60px"),
                                                        tags$img(src="https://i1.wp.com/fileserialkey.com/wp-content/uploads/2019/07/2-2.png?fit=300%2C300&ssl=1",width="60px",height="60px")
                                                   )),
                                                   textInput(inputId = "Oficio",
                                                             label = h4("Ingrese Oficio"),
                                                             value = NULL),
                                                   textInput(inputId = "Netlab",
                                                             label = "Netlab",
                                                             value = NULL),
                                                   actionButton(inputId = "Guardar", 
                                                                label =  "Guardar",
                                                                width = "200px"),
                                                   h1(" "),
                                                   actionButton(inputId = "Buscar", 
                                                                label =  "Buscar Oficio",
                                                                width = "200px"),
                                                   
                                                   
                                            ),
                                            shiny::includeScript("script.js"),
                                            column(8,
                                                   DT::dataTableOutput("SqlInput")
                                            ),
                                            column(1," "),
                                            
                         ), DataExp)



################################################################################################################################################################


