defmodule HappyPancakes do
  @moduledoc """
  Happy pancakes flipping calculator.
  """

  # The number of flips and the state of the last pancake looked at.
  @initial_state {0, nil}

  # The unhappy state of a particular pancake is represented by a minus.
  @unhappy_state "-"

  @doc """
  Count the number of flips it takes to get a stack of pancakes in a consistently happy state (happy
  face chocolate chips on top). When flipping a particular pancake, all pancakes above it must also
  be flipped. The pancake stacks are represented by strings of pluses and minuses.
  """
  def solution(_, stacks) do
    stacks
    |> Stream.with_index()
    |> Enum.each(fn {stack, index} ->
      stack
      |> String.graphemes()
      |> count_flips()
      |> IO.inspect(label: "Case ##{index + 1}")
    end)
  end

  defp count_flips([first_pancake | rest_of_pancakes]) do
    initial_state = @initial_state |> put_elem(1, first_pancake)

    rest_of_pancakes
    |> Enum.reduce(initial_state, &next_pancake/2)
    |> final_flip_count()
  end

  # Implementation of a simplistic state machine while moving through the pancakes.
  defp next_pancake(new_state, {count, state} = acc) do
    acc
    |> put_elem(0, if(state != new_state, do: count + 1, else: count))
    |> put_elem(1, new_state)
  end

  defp final_flip_count({count, state}),
    do: if state == @unhappy_state, do: count + 1, else: count
end
