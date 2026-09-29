defmodule Template.Viewport do
  use Emerge

  @impl Viewport
  def mount(opts), do: {:ok, Keyword.merge([title: "Counter"], opts)}

  @impl Viewport
  def render() do
    el(
      [
        Background.color(color(:white)),
        Font.size(60),
        width(fill()),
        height(fill()),
        center_x(),
        center_y()
      ],
      text("Hello World")
    )
  end
end
