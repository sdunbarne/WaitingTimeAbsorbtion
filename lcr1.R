player_count <-  8
bills <-  3
simulations <- 5

players <- rep(bills, player_count)

turns <- 1
current_player <- 1

all_results <- c()

player_index <- function(j) {
    ((j-1) %% 6) + 1
}


turn <- function(player) {
    rolls <- sample(6, 3, replace=TRUE)
    cat(rolls, "\n")
    for (roll in rolls) {
        if (players[player] > 0) {
            if (roll <= 2) {
                cat(roll, "to left\n")
                players[player_index(player - 1)] =
                    players[player_index(player - 1)] + 1 
                players[player] = players[player] - 1
                cat("turn:",  turns, " players:", players, " total:", sum(players),  "\n")
            } else if (roll <= 4) {
                cat(roll, "to right\n")
                players[player_index(player + 1)] =
                    players[player_index(player + 1)] + 1
                players[player] = players[player] - 1
                cat("turn:",  turns, " players:", players, " total:", sum(players),  "\n")
            } else {
                cat(roll, "to center\n")
                players[player] = players[player] - 1
                cat("turn:",  turns, " players:", players, " total:", sum(players),  "\n")
            }
        }
    }
    cat("end turn:",  turns, " players:", players, " total:", sum(players),  "\n")
    return(players)
}


while ( length( players[ players > 0] ) > 0 ) {
    cat("start turn:", turns,  " players:", players, " total:", sum(players),  "\n")
    players <- turn(current_player)
    current_player <- player_index(current_player + 1)
    turns <- turns + 1
}

all_results <- c()
for (i in 1:simulations) {

    while ( length( players[ players > 0] ) > 0 ) {
        cat("start turn:", turns,  " players:", players, " total:", sum(players),  "\n")
        players <- turn(current_player)
        current_player <- player_index(current_player + 1)
        turns <- turns + 1
    }

    all_results <- c( all_results, turns )
}

mean(all_results)





    
