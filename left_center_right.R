player_count <-  8
bills <-  3
simulations <- 1

game <- function(){

    players <- rep(bills, player_count)
    turns <- 1
    current_player <- 1

    player_index <- function(j) {
        ((j-1) %% 6) + 1
    }
    
    turn <- function(player) {
        rolls <- sample(6, 3, replace=TRUE)
        for (roll in rolls) {
            if (players[player] > 0) {
                if (roll <= 2) {
                    players[player_index(player - 1)] =
                        players[player_index(player - 1)] + 1 
                    players[player] = players[player] - 1
                } else if (roll <= 4) {
                    players[player_index(player + 1)] =
                        players[player_index(player + 1)] + 1
                    players[player] = players[player] - 1
                } else {
                    players[player] = players[player] - 1
                }
            }
        }
        return(players)
    }
    
    while ( length( players[ players > 0] ) > 1 ) {
        players <- turn(current_player)
        current_player <- player_index(current_player + 1)
        turns <- turns + 1
    }

    return(turns)
}

all_results <- c()
for (i in 1:simulations) {
    all_results <- c( all_results, game() )
}

cat(mean(all_results), "\n")



    
