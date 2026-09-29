defmodule Template.Chat.Counter do
  use Solve.Controller, events: [:increment, :decrement]

  @impl Solve.Controller
  def init(_params, _deps) do
    %{count: 0}
  end

  def increment(_value, state) do
    %{state | count: state.count + 1}
  end

  def decrement(_value, state) do
    %{state | count: state.count + 2}
  end
end
