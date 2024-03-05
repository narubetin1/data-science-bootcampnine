game <- function() {

      print("welcome to pao-ying-choob game")
      flush.console()
      username <- readline("What's your name :")
      print(paste("Hi!" , username ))

      hands <- c("rock","scissors","paper")
      userscore <- 0
      computerscore <- 0

    while (TRUE) {
      flush.console()
       user_hand <- readline("Choose rock , scissors , paper  , quit : ")
       computer_hand <- sample(hands,1)

       if (user_hand == computer_hand) {
          print(paste("user_turn:",user_hand))
          print(paste("computer_turn:",computer_hand))
          print ("scores are tied!")
          flush.console()

      }   else if (user_hand == "rock" & computer_hand == "scissors"|
                  user_hand == "paper" & computer_hand == "rock"|
                  user_hand == "scissors" & computer_hand == "paper" ) {
                    print(paste("user_turn:",user_hand))
                    print(paste("computer_turn:",computer_hand))
                    userscore <- userscore + 1
                    print("You Win")

      }   else if (user_hand == "rock" & computer_hand == "paper"|
                  user_hand == "paper" & computer_hand == "scissors"|
                  user_hand == "scissors" & computer_hand == "rock" ) {
                    print(paste("user_turn:",user_hand))
                    print(paste("computer_turn:",computer_hand))
                    computerscore <- computerscore + 1
                    print("You lose")

      }   else if (user_hand == "quit") {
                    print(paste("Final_user_scores:",userscore))
                    print(paste("Final_computer_scores:",computerscore))

                     if (userscore > computerscore) {
                      print("Congratulations! You are the winner")
                      print("Thank you for playing")
                  }  else if (userscore < computerscore) {
                      print("You lose")
                      print("Thank you for playing")
                  }  else {
                      print("scores are tied!")
                      print("Thank you for playing")
                  }
                  break }
}

}

game()
