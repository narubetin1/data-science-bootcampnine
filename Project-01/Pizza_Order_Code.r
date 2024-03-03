df_menu <- data.frame (
    No.id = 1:7,
    MENU_PIZZA = c("Bacon Hawaiian",
                    "Spicy Seafood",
                    "Popeye & Olive",
                    "Smoked Salmon Cream",
                    "Parma Ham Rocket & Black Truffle Cream",
                    "Bacon & Mushroom",
                    "Magherita"),
    PRICE = c(290, 460, 280, 420, 350, 280, 250)
)
pizza_shop <- function() {
    message("Welcome Pizzeria Zizza 🍕")
    print(df_menu)
    message("\nPlease select Pizza that you want ")

    quit_order <- TRUE
    summarize <- list()
    order_cnt <- 1
    grand_total <- 0

        while (quit_order) {
            order_menu <- readline("Please select Pizza (ID): ")
            order_qty <- readline("How many Pizza?: ")
            summary_list <- list (No = order_menu,
                             pizza_detail = df_menu[df_menu$id == order_menu, 2],
                             pizza_order = order_qty,
                             price_ea = df_menu[df_menu$id == order_menu, 3],
                             tt_price = as.integer(order_qty) * df_menu[df_menu$id == order_menu, 3])
            summarize[[length(summarize) + 1]] <- summary_list
            order_again <- toupper(readline ("You need to Anything else? (Yes/No) : "))
                if (order_again == 'Y'){
                    order_cnt <- order_cnt + 1
                } else {
                    quit_order <- FALSE
                }
        }
    cat(sprintf("\n===== Summarize Order =====\n"))
    cat(sprintf("--------------------------------------------------------------------------------------\n"))
    cat(sprintf("%-5s%-45s%-13s%-10s%-10s\n","No", "Order Pizza","Quantity","Price", "Total Price"))
    cat(sprintf("--------------------------------------------------------------------------------------\n"))

    for (i in 1:length(summarize)) {
    bill <- summarize[[i]]
    cat(sprintf("%-5s%-45s%-13s%-10s%-10s\n", i, bill$pizza_detail, bill$pizza_order, as.character(bill$price_ea), as.character(bill$tt_price)))
    grand_total <- grand_total + bill$tt_price
    }
    cat(sprintf("--------------------------------------------------------------------------------------\n"))
    cat(sprintf("Grand Total : %-15s\n", as.character(grand_total)))

}
