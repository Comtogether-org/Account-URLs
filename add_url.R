library(readr)
library("git2r")
library(tidyverse)
library(googlesheets4)

URL = "https://docs.google.com/spreadsheets/d/1wmzLvsvds-yGxIdJgOMT0ZjycTdh4Zb1bL1uOAgKTUI/edit#gid=0"
sheet_id = gs4_get(URL)
sheet_data = read_sheet(ss = sheet_id, sheet = "Google_shopping_feed")

sheet_data = sheet_data %>% 
    rename(bestman = hellooo)

test = read_csv("test_scott.csv")

msg <- str_c("updated_URL on the ", Sys.time())
write_csv(sheet_data, "test_scott.csv")
repo = repository()
add(repo, "*")
commit(repo, msg, session = TRUE)

# this token variable is only available for 7 days, need to update it with a new one
Sys.setenv(GITHUB_PAT = "find a way to add a token securily, maybe a google sheet")

cred <- cred_token()
push(repo, credentials = cred)

X <- read.csv(url("https://raw.githubusercontent.com/Comtogether-org/Account-URLs/master/test_scott.csv"))
head(X)
