defmodule HappyPancakes do
  @moduledoc """
  Happy pancakes flipping calculator.
  """

  @initial_state {0, nil}

  @unhappy_state "-"

  @doc """
  # Set count = 0
  # Take one pancake, set state
  # Take another pancake. If different from previous state, count += 1, set state to new pancake
  # If no more pancakes, and state is "-", count += 1.
  """
  def solution(_, test_cases) do
    test_cases
    |> Stream.with_index()
    |> Enum.each(fn {test_case, index} ->
      test_case
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

  defp next_pancake(new_state, {count, state} = acc) do
    acc
    |> put_elem(0, if(state != new_state, do: count + 1, else: count))
    |> put_elem(1, new_state)
  end

  defp final_flip_count({count, state}),
    do: if state == @unhappy_state, do: count + 1, else: count
end
