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
                                     value = NULL)),
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
                              
                       ),
                       shiny::includeScript("script.js"),
                       column(8,
                              DT::dataTableOutput("SqlInput")
                       ),
                       column(1," "),
                       
), DataExp, 
footer = tags$div(
  class = "footer",h3(p(style="color:black;text-align:left", 
                        tags$img(src="https://media.slid.es/uploads/1121994/images/6529504/minsa.jpg",width="190px",height="70px"))),
  tags$style(".footer{position:absolute;bottom:0; width:100%;}"))
)



################################################################################################################################################################


