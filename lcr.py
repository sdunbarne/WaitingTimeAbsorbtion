def expected_rolls(x, y):
    #The first state, where all players have $Y:
    starting_state = [y for i in range(x)]
    starting_state.append(0)

    #The first probability distribution of states:
    states = {tuple(starting_state):1.}
    rolls = 0
    expected = 0.
    prob_over = 0.

    for t in range(20): #Within 20 rounds, the probability that the game is still going is negligible for what we need.
        for i in range(x): #Each player's turn
            for rolls_per_turn in range(3): #Each player's roll
                rolls += 1
                new_states = {}
                for state, prob in states.items():
                    if state[i]>0: #Only roll if player i has at least $1
                        new_state_left = list(state)
                        new_state_left[i] -= 1
                        new_state_left[(i-1)%x] += 1
                        new_state_left = tuple(new_state_left)
                    
                        new_state_right = list(state)
                        new_state_right[i] -= 1
                        new_state_right[(i+1)%x] += 1
                        new_state_right = tuple(new_state_right)

                        new_state_center = list(state)
                        new_state_center[i] -= 1
                        new_state_center[x] += 1
                        new_state_center = tuple(new_state_center)
                    
                        left_sum = sum(new_state_left[:x])
                        right_sum = sum(new_state_right[:x])
                        center_sum = sum(new_state_center[:x])
                    
                        new_prob = prob/3.
                    
                        if sum([1 for k in range(x) if new_state_left[k]==left_sum])==1: #End of game
                            expected += new_prob*rolls
                            prob_over += new_prob
                        else: #The distribution after this turn
                            if new_state_left not in new_states:
                                new_states[new_state_left] = new_prob
                            else:
                                new_states[new_state_left] += new_prob
                    
                        if sum([1 for k in range(x) if new_state_right[k]==right_sum])==1:
                            expected += new_prob*rolls
                            prob_over += new_prob
                        else:
                            if new_state_right not in new_states:
                                new_states[new_state_right] = new_prob
                            else:
                                new_states[new_state_right] += new_prob
                    
                        if sum([1 for k in range(x) if new_state_center[k]==center_sum])==1:
                            expected += new_prob*rolls
                            prob_over += new_prob
                        else:
                            if new_state_center not in new_states:
                                new_states[new_state_center] = new_prob
                            else:
                                new_states[new_state_center] += new_prob
                    else:
                        if state not in new_states:
                            new_states[state] = prob
                        else:
                            new_states[state] += prob

                states = new_states
    return expected
