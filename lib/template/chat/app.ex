defmodule Template.Chat.App do
  use Solve

  @impl Solve
  def controllers do
    [
      controller!(name: :credits, module: Template.Chat.Counter)
    ]
  end
end
