fluidPage(    
  
  titlePanel("Lesson 1 - Homework"),
  

  sidebarLayout(      
    

    sidebarPanel(selectInput("select", label = h3("Colouring var:"), 
    choices = list("Region" = "Region", "Unit" = "Unit", "Segment" = "Segment", "Business" = "Business", "Year" = "Year"), 
    selected = 1)

    ),
    
    
    mainPanel(plotOutput(outputId = "plot")
       
    )
    
  )
)
