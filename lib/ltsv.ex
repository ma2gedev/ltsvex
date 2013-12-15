defmodule LTSV do
  @doc """
  # parse ltsv string

  # TODO: following cause TokenMissingError
  iex> LTSV.parse "name:taka\taddress:Seattle"
  [#HashDict<[{"address", "Seattle"}, {"name", "taka"}]>]

  """
  def parse(ltsv_string) do
    String.split(ltsv_string, %r{\r?\n})
      |> Enum.map(fn(record) -> parse_line(record) end)
  end

  def parse_line(record) do
    String.split(record, "\t")
      |> Enum.map(fn(field) -> list_to_tuple(String.split(field, ":")) end)
      |> HashDict.new
  end

  @doc """
  # Dump the HashDict lists into a ltsv string

  iex> LTSV.dump [HashDict.new([{"address", "Seattle"}, {"name", "taka"}]), HashDict.new([{"address", "Chicago"}, {"name", "tetsuo"}])]
  "address:Seattle\tname:taka\naddress:Chicago\tname:tetsuo"

  """
  def dump(values) do
    Enum.map_join(values, "\n", fn(record) ->
      Enum.map_join(record, "\t", fn(field) ->
        {label, value} = field
        label <> ":" <> value
      end)
    end)
  end
end
