# WaitingTimeAbsorption
Section 2 of tentative book on theory and examples of Markov Chains 
##  Key Concepts

This section gives proofs and examples of the following key concepts.
1.      Let  \( X_n \) be a finite-state absorbing Markov chain
        with \( a \) absorbing states and \( t \) transient states.  Let
        the \( (a + t) \times (a + t) \) transition probability matrix
        be \( P \).  Order the states so the absorbing states come first
        and non-absorbing, i.e.
        transient, states come last. Then the transition probability
        matrix has the block-matrix form
        \[
            P =
            \begin{pmatrix}
                I_a & 0 \\
                A & T
            \end{pmatrix}
            .
        \] Here \( I_{a} \) is an \( a \times a \) identity matrix, \( A
        \) is the \( t \times a \) matrix of single-step transition
        probabilities from the \( t \) transient states to the \( a \)
        absorbing states, \( T \) is a \( t \times t \) submatrix of
        single-step transition probabilities among the transient states,
        and \( 0 \) is a \( a \times t \) matrix of \( 0 \)s
        representing the single-step transition probabilities from
        absorbing states to transient states.
1.      The matrix \( N = (I-T)^{-1} \) is the **fundamental matrix**
        for the absorbing Markov chain.  The entries \( N_{ij} \) of
        this matrix have a probabilistic interpretation.  The entries \(
        N_{ij} \) are the expected number of times that the chain
        started from state \( i \) will be in state \( j \) before
        ultimate absorption.
1.      First-step analysis gives a compact expression in vector-matrix
        form for the waiting time \( \mathbf{w} \) to absorption:
        \[
            (I - T) \mathbf{w} = \mathbf{1}
        \] so \( \mathbf{w} = (I-T)^{-1} \mathbf{1} \).
