library(RPostgreSQL)
library(tidyverse)

con <- dbConnect(
  PostgreSQL(),
  host = "satao.db.elephantsql.com",
  dbname = "cqqppziv",
  user = "cqqppziv",
  password = "s2t6r3_u4OgV0uSFdncPB3pVOWNVYbdO",
  port = 5432
)

## create dataframe
products <- tribble(
~Menu_id, ~Menu_list, ~Price,
1, "Hawaiian", 200,
2, "Pepperoni", 220,
3, "Meat deluxe", 220,
4, "Traffle", 300,
5, "Seafood", 270,
)

customers <- tibble::tibble(
  Customer_id = 1:8,
  Customer_name = c("James","John","Jim","Jack","Jamies","Jennie","Joe","Jennifer"),
  Gender = c("M","M","M","M","M","W","M","W")
)

orders <- tribble(
  ~id, ~order_date, ~member_id, ~menu_id, ~quantity,
  1, '2024-02-01', 8, 2, 1,
  2, '2024-02-15', 2, 5, 2,
  3, '2024-02-16', 1, 3, 5,
  4, '2023-02-29', 3, 1, 3,
  5, '2023-02-29', 3, 4, 1,
  6, '2023-03-01', 4, 2, 2,  
)

## write table to database
dbWriteTable(con, "products", products)
dbWriteTable(con, "customers", customers)
dbWriteTable(con, "orders", orders)

## show table in database
dbListTables(con)

## show list in table
dbListFields(con, "products")

##get data
dbGetQuery(con, "select * from customers")

## disconnect database
dbDisconnect(con)
