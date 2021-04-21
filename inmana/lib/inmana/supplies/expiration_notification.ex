defmodule Inmana.Supplies.ExpirationNotification do
  alias Inmana.Supplies.{GetByExpiration, ExpirationEmail}
  alias Inmana.Mailer

  def send do
    supplies_by_email = GetByExpiration.call()
    |> Enum.each(fn {email, supplies} ->
      email
      |> ExpirationEmail.create(supplies)
      |> Mailer.deliver_later!()
    end)
  end
end
