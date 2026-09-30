defmodule Chat.Counter do
  use Solve.Controller, events: [:increment, :decrement]

  def init(_params, _depencies) do
    %{count: 0}
  end

  def increment(_payload, state, _deps, callbacks) do
    new_count = state.count + 1
    callbacks.count_changed.(new_count)
    %{state | count: new_count}
  end

  def decrement(_payload, state, _deps, callbacks) do
    new_count = state.count - 1
    callbacks.count_changed.(new_count)
    %{state | count: new_count}
  end
end
