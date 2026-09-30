defmodule Chat.Greeter do
  use Solve.Controller

  def init(_params, _depencies) do
    nil
  end

  def expose(_state, deps, params) do
    count = deps.credits.count
    %{greet: "Hello #{params}, you have #{count} credits"}
  end
end
