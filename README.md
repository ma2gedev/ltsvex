# LTSV - A Pure Elixir LTSV Parser

[![hex.pm version](https://img.shields.io/hexpm/v/ltsv.svg)](https://hex.pm/packages/ltsv) [![hex.pm downloads](https://img.shields.io/hexpm/dt/ltsv.svg)](https://hex.pm/packages/ltsv) [![Build Status](https://travis-ci.org/ma2gedev/ltsvex.png?branch=master)](https://travis-ci.org/ma2gedev/ltsvex) [![Coverage Status](https://img.shields.io/coveralls/ma2gedev/ltsvex.svg)](https://coveralls.io/r/ma2gedev/ltsvex)

A Labeled Tab-separated Values parser implementation in Elixir

## What's LTSV?

http://ltsv.org/

## Installation

Add `:ltsv` library to your project's dependencies in `mix.exs`:

```elixir
defp deps do
  [
    {:ltsv, "~> 0.1"}
  ]
end
```

And fetch:

```
$ mix deps.get
```

## Usage

### Parse a ltsv string

```
iex> LTSV.parse("name:taka\taddress:Seattle\\nname:neko\taddress:near") |> Enum.map(&Dict.to_list/1)
[[{"name", "taka"}, {"address", "Seattle"}], [{"name", "neko"}, {"address", "near"}]]
```

### Dump a list of `Dict`s into a ltsv string

```
iex> LTSV.dump [%{"address" => "Seattle", "name" => "taka"}, %{"address" => "Chicago", "name" => "tetsuo"}]
"address:Seattle\tname:taka\naddress:Chicago\tname:tetsuo"

iex> LTSV.dump [%{name: "taka"}]
"name:taka"
```

## Documentation

http://hexdocs.pm/ltsv/

## License

Copyright © 2014 Takayuki Matsubara, released under the MIT license.

