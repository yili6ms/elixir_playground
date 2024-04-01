defmodule Solution191 do
  @spec statistical_result(array_a :: [integer]) :: [integer]
  def statistical_result(array_a) do
    total =
      array_a
      |> Enum.filter(&(&1 != 0))
      |> Enum.reduce(1, &*/2)

    totalz =
      array_a
      |> Enum.filter(fn x -> x == 0 end)
      |> Enum.count()

    cond do
      totalz == 0 ->
        Enum.map(array_a, fn x -> div(total, x) end)

      totalz == 1 ->
        Enum.map(array_a, fn x ->
          if x == 0 do
            total
          else
            0
          end
        end)

      true ->
        Enum.map(array_a, fn x -> 0 end)
    end
  end
end
