ExUnit.start()

defmodule HappyPancakesTest do
  use ExUnit.Case

  doctest HappyPancakes

  import ExUnit.CaptureIO

  @test_cases [
    ~w[++- --+ ---++ ++--- ++++- -++++ -+-+-+ +-+-+- +---+- -+---+ +-+++- -+++-+],
    ~w[- -+ +- +++ --+-],
  ]

  @expected_outputs [
    "Case #1: 2\nCase #2: 1\nCase #3: 1\nCase #4: 2\nCase #5: 2\nCase #6: 1\nCase #7: 5\nCase #8: 6\nCase #9: 4\nCase #10: 3\nCase #11: 4\nCase #12: 3\n",
    "Case #1: 1\nCase #2: 1\nCase #3: 2\nCase #4: 0\nCase #5: 3\n",
  ]

  test "solution/2" do
    get_solution = fn cases ->
      HappyPancakes.solution(length(cases), cases)
    end

    @test_cases
    |> Enum.with_index()
    |> Enum.each(fn {dataset, index} ->
      assert capture_io(fn -> get_solution.(dataset) end) == Enum.at(@expected_outputs, index)
    end)
  end
end
