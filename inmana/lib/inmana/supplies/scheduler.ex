defmodule Inmana.Supplies.Scheduler do
  use GenServer

  alias Inmana.Supplies.ExpirationNotification

  # Client
  def start_link(_state) do
    GenServer.start_link(__MODULE__, %{})
  end

  # Server
  @impl true # get warning on impl errors
  def init(state \\ %{}) do # \\ means a default value to our state
    schedule_notification()
    {:ok, state}
  end

  # # async
  # def handle_cast({:put, key, value}, state) do
  #   {:noreply, Map.put(state, key, value)}
  # end

  # # sync
  # def handle_call({:get, key}, _from, state)  do
  #   {:reply, Map.get(state, key), state}
  # end

  @impl true
  def handle_info(_message, state) do
    ExpirationNotification.send()

    schedule_notification()

    {:noreply, state}
  end

  defp schedule_notification do
    # one_week =
    ten_seconds = 1000 * 10
    Process.send_after(self(), :generate, ten_seconds)
  end
end
