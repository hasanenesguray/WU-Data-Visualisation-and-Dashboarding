install.packages(c("sf", "rnaturalearth", "rnaturalearthdata", "rgeos",
                   "eurostat", "tidyverse", "cartogram", "s2", "eurostat"))
library(ggplot2)
library(sf)
library(rnaturalearth)

world <- ne_countries(returnclass = "sf", scale="medium")
ggplot(world) + geom_sf()

ggplot(world) + geom_sf() +
  theme_bw() + coord_sf(ylim = c(-80, 90), expand = F)


ggplot(world) + geom_sf() + aes(fill = pop_est) +
  scale_fill_viridis_c(option = "plasma", trans = "sqrt", label = scales::comma) +
  labs(fill = "Population") +
  theme_bw() + coord_sf(ylim = c(-80, 90), expand = F)


ggplot(world) + geom_sf() + aes(fill = pop_est) +
  scale_fill_viridis_c(option = "plasma", trans = "sqrt", label = scales::comma) +
  labs(fill = "Population") +
  theme_bw() +
  coord_sf(crs = st_crs(3035))

ggplot(world) + geom_sf() + aes(fill = pop_est) +
  scale_fill_viridis_c(option = "plasma", trans = "sqrt", label = scales::comma) +
  labs(fill = "Population") +
  theme_bw() +
  coord_sf(crs="+proj=moll")

ggplot(world) + geom_sf() + aes(fill = pop_est) +
  scale_fill_viridis_c(option = "plasma", trans = "sqrt", label = scales::comma) +
  labs(fill = "Population") +
  theme_bw() +
  coord_sf(crs="+proj=cea +lon_0=0 +lat_ts=45")

ggplot(world) + geom_sf() + theme_bw() +
  coord_sf(ylim = c(34, 71), xlim = c(-24, 41))

install.packages(c("eurostat"))

library(eurostat)

eurostat.map <- get_eurostat_geospatial(nuts = 0)
ggplot(eurostat.map) + geom_sf() +
  geom_sf_label(aes(label = id), size = 2) +
  theme_bw() +
  labs(caption = "© EuroGeographics for the administrative boundaries",
       x = NULL, y = NULL)

