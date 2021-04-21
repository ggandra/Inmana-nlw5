defmodule Inmana do
  alias Inmana.{Restaurants, Supplies}

  defdelegate create_restaurant(params), to: Restaurants.Create, as: :call
  defdelegate create_supply(params), to: Supplies.Create, as: :call
  defdelegate get_supply(uuid), to: Supplies.Get, as: :call
end
