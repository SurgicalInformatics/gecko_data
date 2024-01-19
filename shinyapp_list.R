library(tidyverse)
library(pins)

board = board_connect()
appdata = pin_read(board, "rots/gecko_appdata")

colnames(appdata) %>% 
  tail(-1) %>% 
  write("shinyviz_varlist.txt")
