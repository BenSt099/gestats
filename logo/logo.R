library(tidyverse)
library(giscoR)

GE_States <- gisco_get_nuts(
  nuts_level = 1,
  resolution = 10,
  country = "Germany",
  year = 2021
)

data <- read.table(text = "
      state value
      Sachsen 1
      Bayern 1
      Rheinland-Pfalz 1
      Saarland 1
      Schleswig-Holstein 2
      Niedersachsen  2
      Nordrhein-Westfalen 2
      Brandenburg 2
      Baden-Württemberg 2
      Hamburg 2
      Mecklenburg-Vorpommern 2
      Hessen 3
      Berlin 3
      Thüringen 3
      Bremen 2
      Sachsen-Anhalt 3
", header = T)

states <- GE_States %>%
  left_join(data, by = c("NUTS_NAME" = "state"))
colors <- c("black", "red2", "black", "black", "red2", "red2", "red2", "red2", "black", "gold2", "gold2", "black", "black", "black", "black", "red2")

ggplot(states) +
  geom_sf(fill = colors)+
  geom_sf(fill = NA, color = "azure3", size = 1) +
  theme(axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank(),
        #rect = element_blank()
        panel.background = element_rect(fill = "black"),
        panel.grid.major = element_line(color = "black")
        )

  