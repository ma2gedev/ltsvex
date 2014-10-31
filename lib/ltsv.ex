defmodule LTSV do
  @doc """
  # parse ltsv string

  iex> LTSV.parse("name:taka\taddress:Seattle") |> Enum.map(&Dict.to_list/1)
  [[{"name", "taka"}, {"address", "Seattle"}]]

  """
  def parse(ltsv_string) do
    String.split(ltsv_string, ~r{\r?\n})
      |> Enum.map(fn(record) -> parse_line(record) end)
  end

  def parse_line(record) do
    String.split(record, "\t")
      |> Enum.map(fn(field) -> List.to_tuple(String.split(field, ":")) end)
      |> Enum.into(HashDict.new)
  end

  @doc """
  # Dump the HashDict lists into a ltsv string

  iex> LTSV.dump [%{"address" => "Seattle", "name" => "taka"}, %{"address" => "Chicago", "name" => "tetsuo"}]
  "address:Seattle\tname:taka\naddress:Chicago\tname:tetsuo"

  iex> LTSV.dump [%{name: "taka"}]
  "name:taka"
  """
  def dump(values) do
    Enum.map_join(values, "\n", fn(record) ->
      Enum.map_join(record, "\t", fn(field) ->
        {label, value} = field
        if is_atom(label), do: label = Atom.to_string(label)
        label <> ":" <> value
      end)
    end)
  end
end
