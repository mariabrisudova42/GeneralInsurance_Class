function(input, output) {
    output$plot <- renderPlot(
        ggplot(data = dt_KPI,
       mapping = aes_string(x = "Premium", y = "Expenses", colour = input$select)
) +
geom_point() +
geom_smooth()
    )
}
