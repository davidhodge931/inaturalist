# devtools::install_github("ropensci/rinat")
library(tidyverse)
library(simplevis)
library(rinat)

selected_taxon_name <- "Prumnopitys taxifolia"
selected_bounds <- "Wellington Region"

shp <- nz

shp <- nz_region %>% 
  filter(region_name == selected_bounds)

leaflet_sf(shp)

selected_bounds <- as_vector(sf::st_bbox(shp))[c(2, 1, 4, 3)]

df <- get_inat_obs(
    taxon_name = selected_taxon_name, bounds = selected_bounds) %>% 
  filter(!is.na(longitude), !is.na(latitude)) %>% 
  sf::st_as_sf(coords = c("longitude", "latitude"), crs = 4326) %>% 
  select(1:7)

leaflet_sf(df, title = selected_taxon_name, 
           legend_labels = "Observation")
