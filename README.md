# Happy Pancakes Coding Test

This is Dan Rasband's solution to the Happy Pancakes coding test.

## Solution

I've completed the test using Elixir.

I have been using Elixir more frequently lately, so I decided to use it for my
solution. I have used Go fairly extensively in the past, but I am a bit rusty
at the moment.

The solution is located with the `happy_pancakes.ex` file, and is implemented in
the `HappyPancakes.solution/2` function. Tests are written in the
`happy_pancakes_test.exs` file. To run the tests, do the following:

1. Make sure elixir is installed
2. In this folder, run `elixirc happy_pancakes.ex` to compile the
   `HappyPancakes` module.
3. Run the tests with this command: `elixir happy_pancakes_test.exs`.

## Process

The process I used to come up with these solutions was to first come up with
example sets, then examine them to understand the problem better. I then thought
through several ways of looking at the problem, finally settling on a solution
that was easy to implement, efficient, and correct.

## The Algorithm

The algorithm I came up with for determining the number of flips required for
a particular stack of pancakes, moving from top to bottom, to get all the
pancakes into a happy state is as follows:

Given the set of possible pancake states S = {"-", "+"]}, and a particular
ordered array of pancakes P, where P_0, P_1, P_2, ..., P_n ∈ S,

1. Set count `c ← 0`.
2. Set `i ← 0`.
3. Set state `s ← P_0` (the first pancake).
4. Increment i: `i ← 1`.
5. If no more pancakes (`i = |P|`), go to 10.
6. Set new state `z ← P_i`.
7. If `s ≠ z`, increment count: `c ← c + 1`.
8. Update state: `s ← z`.
9. Go to 4.
10. If `s = "-"`, then return `c + 1`; otherwise return `c`.
