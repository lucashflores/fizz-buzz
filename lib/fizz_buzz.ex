defmodule FizzBuzz do
  def build(file_name) do
    file_name
    |> File.read()
    |> handle_file_read()
  end

  defp convert_and_evaluate_number(number) do
    number
    |> String.to_integer()
    |> evaluate_number()
  end

  defp evaluate_number(number) when rem(number, 15) == 0, do: :fizzbuzz
  defp evaluate_number(number) when rem(number, 5) == 0, do: :buzz
  defp evaluate_number(number) when rem(number, 3) == 0, do: :fizz
  defp evaluate_number(number), do: number

  defp handle_file_read({:ok, result}) do
    fizz_buzz_result =
      result
      |> String.split(",")
      |> Enum.map(&convert_and_evaluate_number/1)

    {:ok, fizz_buzz_result}
  end

  defp handle_file_read({:error, reason}), do: {:error, "Error reading the file: #{reason}"}
end
