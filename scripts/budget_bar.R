library(plotly)
library(dplyr)
library(RColorBrewer)

budget_bar <- function(df, movie) {
  choice <- filter(df, title == movie)
  plot_ly(choice, x = ~ title, y = ~ budget, type = "bar", name = "budget") %>%
    add_trace(y = ~revenue, name = "revenue") %>%
    add_trace(y = ~earnings, name = "earnings") %>% 
    layout(yaxis = list(title = "USD"), barmode = "group")
}