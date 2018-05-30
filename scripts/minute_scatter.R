library(plotly)
library(dplyr)

minute_scatter <- function(df, amount){
  choice <- filter(df, amount > runtime) %>% 
    select(profit_per_minute, runtime, title)
  plot_ly(choice, x = ~ runtime, y = ~ profit_per_minute, color = ~ title,
          colors = "Spectral")
}
