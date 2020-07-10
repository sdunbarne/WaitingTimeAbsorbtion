player_index <- function(j) {
    ((j-1) %% player_count) + 1
}


game <- function(bills, player_count){

    turn <- function(player) {
        rolls <- sample(6, 3, replace=TRUE)
        for (roll in rolls) {
            if (players[player] > 0) {      #player has money
                if (roll <= 2) {            #pass dollar to Left
                    players[player_index(player - 1)] =
                        players[player_index(player - 1)] + 1 
                    players[player] = players[player] - 1
                } else if (roll <= 4) {     #pass dollar to right
                    players[player_index(player + 1)] =
                        players[player_index(player + 1)] + 1
                    players[player] = players[player] - 1
                } else {                    #dollar goes to center
                    players[player] = players[player] - 1
                }
            }
        }
        return(players)
    }

    players <- rep(bills, player_count)
    turns <- 1
    current_player <- 1

    while ( length( players[ players > 0] ) > 1 ) {
        players <- turn(current_player)
        current_player <- player_index(current_player + 1)
        turns <- turns + 1
    }

    return(turns)
}

M <- matrix(0, 4, 4)
V <- matrix(0, 4, 4)
simulations <- 5000

for (player_count in c(6:9)) {
    for (bills in c(3:6)) {

        sim_results <- c()
        for (i in 1:simulations) {
            sim_results <- c( sim_results, game(bills, player_count) )
        }

        M[player_count-5, bills-2] <- mean(sim_results)
        V[player_count-5, bills-2] <- sd(sim_results)
    }
}

## NAME: waitingtimeabsorbtion.R
##
## USAGE: within R, at interactive prompt
##        source("waitingtimeabsorbtion.R")
## REQUIRED ARGUMENTS: none
##
## OPTIONS: none
## DESCRIPTION: Do simulations of the Left-Center-Right game
##  to make estimates of the waiting time to the game end,            
## DIAGNOSTICS: none
## CONFIGURATION AND ENVIRONMENT: requires R
## DEPENDENCIES:  R
## INCOMPATIBILITIES: none known
## PROVENANCE: Steve Dunbar, revised 
## BUGS AND LIMITATIONS: none at this time
## FEATURES AND POTENTIAL IMPROVEMENTS:

## AUTHOR:  Steve Dunbar
## VERSION: Version 1.0 as of Thu 09 Jul 2020 05:31:23 AM CDT
## KEYWORDS: simulation, game, waiting time absorbtion

