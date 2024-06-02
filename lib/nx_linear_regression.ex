defmodule NxLinearRegression do
  @moduledoc """
  Documentation for `NxLinearRegression`.
  """

  alias NimbleCSV.RFC4180, as: CSV

  def load_data(data_path) do
    data_path
    |> File.stream!()
    |> CSV.parse_stream()
    |> Stream.map(fn row ->
      [
        #passedemissions,
        mpg,
        cylinders,
        displacement,
        horsepower,
        weight,
        acceleration,
        modelyear,
        _origin,
        _carname
      ] = row


      if horsepower != "?" do 
        {
          [
            #parse_boolean(passedemissions),
            parse_int(cylinders),
            parse_int(horsepower),
            parse_float(displacement),
            parse_float(weight),
            parse_float(acceleration),
            parse_int(modelyear)
          ],
          [parse_float(mpg)]
        }
      end
    end)
    |> Enum.to_list()
  end

  def parse_boolean("TRUE"), do: 1
  def parse_boolean("FALSE"), do: 0

  defp parse_float(string_float) do
    string_float |> Float.parse() |> elem(0)
  end

  defp parse_int(string_int) do
    string_int |> String.to_integer()
  end
end


