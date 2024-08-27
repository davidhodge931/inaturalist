library(tidyverse)
library(ggblanket)
library(rinat)

set_blanket()

d <- get_inat_obs_project(grpid = "native-plants-of-east-harbour-northern-forest") |>
  tibble() |>
  janitor::clean_names()

class(d)

d |> glimpse()

d |> distinct()

d |> 
  arrange(taxon_name) |> 
  distinct(taxon_name) |> 
  View()

d |> 
  arrange(taxon_common_name_name) |> 
  distinct(taxon_common_name_name) |> 
  View()

d |> distinct(iconic_taxon_name_2)