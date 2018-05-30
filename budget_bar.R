library(plotly)
library(dplyr)

budget_bar <- function(data, movie) {
  choice <- filter(data, title == movie)
  plot_ly(choice, x = ~ title, y = ~ budget, type = "bar", name = "budget") %>%
    add_trace(y = ~revenue, name = "revenue") %>%
    layout(yaxis = list(title = "dollars"), barmode = "group")
}