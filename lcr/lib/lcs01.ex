defmodule Solution01 do
  @spec least_minutes(n :: integer) :: integer
  def least_minutes(n) when n <= 1 do
    1
  end

  def least_minutes(n) do
    1 +
      least_minutes(
        if rem(n, 2) == 0 do
          div(n, 2)
        else
          div(n, 2) + 1
        end
      )
  end
end
