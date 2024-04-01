defmodule MinHeap do
  defstruct data: []

  def insert(heap, value) do
    heap |> put_in([:data], insert_into_data(heap.data, value))
  end

  def pop(heap) do
    case heap.data do
      [] -> nil
      [root | rest] ->
        {root, %MinHeap{heap | data: bubble_down(rest ++ [Enum.last(heap.data)])}}
    end
  end

  defp insert_into_data(data, value) do
    [value | data] |> Enum.sort()
  end

  defp bubble_down(data) do
    bubble_down(data, 0)
  end

  defp bubble_down(data, index) do
    left_child_index = 2 * index + 1
    right_child_index = 2 * index + 2

    smallest =
      case {data[left_child_index], data[right_child_index]} do
        {nil, nil} -> index
        {nil, right} -> right_child_index
        {left, nil} -> left_child_index
        {left, right} -> if left < right, do: left_child_index, else: right_child_index
      end

    if smallest != index do
      bubble_down(swap(data, index, smallest), smallest)
    else
      data
    end
  end

  defp swap(data, index1, index2) do
    Enum.update_at(data, index2, Enum.at(data, index1)) |> Enum.update_at(index1, Enum.at(data, index2))
  end
end
