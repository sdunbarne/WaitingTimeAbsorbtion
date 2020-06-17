M <- matrix(0, 4, 4)
V <- matrix(0, 4, 4)

for (player_count in c(6:9)) {
    for (bills in c(3:6)) {
## player_count <-  6
## bills <-  3
simulations <- 5000

game <- function(){

    players <- rep(bills, player_count)
    turns <- 1
    current_player <- 1

    player_index <- function(j) {
        ((j-1) %% player_count) + 1
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

M[player_count-5, bills-2] <- mean(all_results)
V[player_count-5, bills-2] <- sd(all_results)
}
}


## NAME: lcr_matrix.R
## USAGE: within R, at interactive prompt
##        source("lcr_matrixc.R")
## REQUIRED ARGUMENTS: none
## OPTIONS:  none
## DESCRIPTION: Make 5000 simulations of the Left-Center-Right game.
##              everyone sits in a circle and starts with some number of $\$1$
## bills. You take turns, in order around the circle, rolling three
## dice. For each die, if it comes up $1$ or $2$, you give a dollar to
## the person on your left. If it comes up $3$ or $4$, you give a
## dollar to the person on your right. And if it comes up $5$ or $6$,
## you put a dollar in the center.  Assume the following: First, if a
## player has no dollars, then her turn is skipped. Second, if a player
## has one or two dollars, then the player rolls only one or two dice,
## respectively. The game ends as soon as only a single person has any
## money left. How long is the game expected to last for six players
## each starting with three $\$1$ bills? For $X$ players each starting
## with $Y$ $\$1$ bills?
## DIAGNOSTICS:  None
## CONFIGURATION AND ENVIRONMENT: R, no libraries needed.
## DEPENDENCIES: None
## INCOMPATIBILITIES: None known
## PROVENANCE:  Steve Dunbar July 2018
## BUGS AND LIMITATIONS: Could be made faster, larger
## FEATURES AND POTENTIAL IMPROVEMENTS: Could be made faster, larger

## AUTHOR:  Steve Dunbar
## VERSION: Version 1.0 Sun Jul 22 10:26:59 CDT 2018
## KEYWORDS:  Markov chain, waiting time, absorbtion

