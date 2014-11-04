defmodule LTSV do
  @doc """
  # Parse ltsv string

  iex> LTSV.parse("name:taka\taddress:Seattle\\nname:neko\taddress:near") |> Enum.map(&Dict.to_list/1)
  [[{"name", "taka"}, {"address", "Seattle"}], [{"name", "neko"}, {"address", "near"}]]

  """
  def parse(ltsv_string) do
    String.split(ltsv_string, ~r{\r?\n})
      |> Enum.map(fn(record) -> parse_line(record) end)
  end

  @doc """
  # Parse ltsv record

  iex> LTSV.parse_line("name:taka\tneko:nya-")
  #HashDict<[{"name", "taka"}, {"neko", "nya-"}]>
  """
  def parse_line(record) do
    String.split(record, "\t")
      |> Enum.reduce(%HashDict{}, fn(field, acc) ->
        case String.split(field, ":", parts: 2) do
          [key, value] ->
            acc = HashDict.put(acc, key, value)
          _ ->
            # Do nothing
        end
        acc
      end)
  end

  @doc """
  # Dump the Dict lists into a ltsv string

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
