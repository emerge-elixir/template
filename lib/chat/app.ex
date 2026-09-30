defmodule Chat.App do
  use Solve

  @impl Solve
  def controllers() do
    [
      controller!(
        name: :credits,
        module: Chat.Counter,
        callbacks: %{
          count_changed: fn value ->
            Solve.dispatch(
              :notifications,
              :notify,
              "Count changed to #{value}"
            )
          end
        }
      ),
      controller!(
        name: :greeter,
        module: Chat.Greeter,
        dependencies: [:credits],
        params: fn _ -> "Dude" end
      ),
      controller!(name: :notifications, module: Chat.Notifications)
    ]
  end
end
