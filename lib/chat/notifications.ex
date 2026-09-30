defmodule Chat.Notifications do
  use Solve.Controller, events: [:notify]

  def init(_params, _depencies) do
    []
  end

  def notify(payload, state) do
    :timer.send_after(5000, :clear_last)
    [payload | state]
  end

  def expose(state, _, _) do
    %{notifications: state}
  end

  def handle_info(:clear_last, state) do
     Enum.drop(state, -1)
  end
end
