library(shiny)
library(ggplot2)
library(readr)
library(reshape2) # Ensure reshape2 is loaded

ui <- fluidPage(
  titlePanel("Currency Analysis"),
  sidebarLayout(
    sidebarPanel(
      fileInput("file", "Choose CSV File")
    ),
    mainPanel(
      plotOutput("currency_plot"),
      plotOutput("correlation_heatmap")
    )
  )
)

server <- function(input, output) {
  currency_data <- reactive({
    req(input$file)
    read_csv(input$file$datapath)
  })
  typeof(currency_data)
  output$currency_plot <- renderPlot({
    plot_currency_over_time(currency_data())
  })
  
  output$correlation_heatmap <- renderPlot({
    plot_correlation_heatmap(currency_data())
  })
}

plot_currency_over_time <- function(data) {
  p <- ggplot(data, aes(x = Year)) +
    geom_line(aes(y = USD, color = "USD")) +
    geom_line(aes(y = Yen, color = "Yen")) +
    geom_line(aes(y = Peso, color = "Peso")) +
    geom_line(aes(y = Ruble, color = "Ruble")) +
    geom_line(aes(y = SGD, color = "SGD")) +
    geom_line(aes(y = EURO, color = "EURO")) +
    labs(x = "Year", y = "Exchange Rate", color = "Currency") +
    scale_color_manual(values = c("USD" = "blue", "Yen" = "red", "Peso" = "green", 
                                  "Ruble" = "orange", "SGD" = "purple", "EURO" = "black")) +
    theme_minimal() +
    theme(legend.position = "top")
  return(p)
}

plot_correlation_heatmap <- function(data) {
  # Calculate correlations
  correlations <- cor(data[, -1])
  
  # Convert correlations to a data frame suitable for ggplot
  correlations_df <- as.data.frame(as.table(correlations))
  
  colnames(correlations_df)[1] <- "Var1"
  colnames(correlations_df)[2] <- "Var2"
  colnames(correlations_df)[3] <- "value"
  
  p <- ggplot(data = correlations_df, aes(x = Var1, y = Var2, fill = value)) +
    geom_tile() +
    scale_fill_gradient(low = "lightblue", high = "darkblue") +
    labs(x = "", y = "", title = "Correlation Heatmap") +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
  
  return(p)
}

shinyApp(ui = ui, server = server)
