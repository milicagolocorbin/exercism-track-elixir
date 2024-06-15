defmodule FreelancerRates do
  def daily_rate(hourly_rate), do: hourly_rate * 8.0

  def apply_discount(before_discount, discount),
    do: before_discount - before_discount * discount / 100

  def monthly_rate(hourly_rate, discount) do
    (daily_rate(hourly_rate) * 22)
    |> apply_discount(discount)
    |> Kernel.ceil()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    workdays =
      FreelancerRates.apply_discount(hourly_rate, discount)
      |> FreelancerRates.daily_rate()

    (budget / workdays) |> Float.floor(1)
  end
end
