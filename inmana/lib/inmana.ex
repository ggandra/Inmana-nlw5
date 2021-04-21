defmodule Inmana do
  alias Inmana.Restaurants

  defdelegate create_restaurant(params), to: Restaurants.Create, as: :call
end
