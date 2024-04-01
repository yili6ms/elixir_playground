defmodule Solution02 do
  @spec half_questions(questions :: [integer]) :: integer
  def half_questions(questions) do
    Enum.frequencies(questions)
    |> Enum.sort_by(&elem(&1, 1), &>=/2)
    |> Enum.reduce_while({0, 0}, fn {item, count}, acc ->
      if count + elem(acc, 1) >= div(Enum.count(questions), 2) do
        {:halt, elem(acc, 0) + 1}
      else
        {:cont, {elem(acc, 0) + 1, elem(acc, 1) + count}}
      end
    end)
  end
end
