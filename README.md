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

1. Make sure elixir is installed.
2. In this folder, run `elixirc happy_pancakes.ex` to compile the
   `HappyPancakes` module.
3. Run the tests with this command: `elixir happy_pancakes_test.exs`.

## The Algorithm

The algorithm I came up with for determining the number of flips required for
a particular stack of pancakes, moving from top to bottom, to get all the
pancakes into a happy state, is as follows:

Given the set of possible pancake states S = {"-", "+"}, and a particular
ordered array of pancakes P, where P<sub>0</sub>, P<sub>1</sub>, P<sub>2</sub>, ..., P<sub>n</sub> ∈ S,

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
