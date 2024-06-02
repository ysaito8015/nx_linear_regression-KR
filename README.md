## NxLinearRegression

[Linear Regression with Elixir and Nx -- written by Konrad Ryłko](https://agileandcode.com/linear-regression-with-elixir-and-nx)


### Setup

```sh
$ mix deps.get
```

### Set Data

```sh
$ iex -S mix
```

```iex
iex> data = NxLinearRegression.load_data("./data/auto-mpg.csv")
iex> {train_data, test_data} =
      data
      |> Enum.shuffle()
      |> Enum.split(data |> length() |> Kernel.*(0.8) |> ceil())
```
