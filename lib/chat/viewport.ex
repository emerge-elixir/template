defmodule Chat.Viewport do
  use Emerge
  use Solve.Lookup

  @impl Viewport
  def mount(opts) do
    {:ok, Keyword.merge([title: "Counter"], opts)}
  end

  @impl Solve.Lookup
  def handle_solve_updated(_updated, state) do
    {:ok, Viewport.rerender(state)}
  end

  @impl Viewport
  def render() do
    column(
      [
        padding(20),
        spacing(20),
        width(fill()),
        height(fill()),
        Background.color(color(:white)),
        Nearby.in_front(notifications())
      ],
      [
        hello_world(),
        counter()
      ]
    )
  end

  def notifications() do
    %{notifications: notifications} =
      solve(Chat.App, :notifications)

    el(
      [
        align_right(),
        padding(20)
      ],
      column(
        [spacing(8)],
        Enum.map(notifications, &notification/1)
      )
    )
  end

  def notification(text) do
    el(
      [
        Animation.animate_enter(
          [
            [Transform.alpha(0.0), Transform.move_y(100)],
            [Transform.alpha(1.0), Transform.move_y(0)],
          ],
          1000,
          :linear
        ),
        Animation.animate_exit(
          [
            [Transform.alpha(1.0)],
            [Transform.alpha(0.0)]
          ],
          1000,
          :linear
        ),
        padding(5),
        Background.color(color(:slate, 800)),
        Font.color(color(:white))
      ],
      text(text)
    )
  end

  def hello_world() do
    greeter = solve(Chat.App, :greeter)

    el(
      [
        width(fill()),
        height(fill()),
        center_x(),
        Font.size(30)
      ],
      text(greeter.greet)
    )
  end

  def counter() do
    credits = solve(Chat.App, :credits)

    el(
      [
        width(fill()),
        height(fill())
      ],
      row(
        [
          center_x(),
          center_y()
        ],
        [
          button(
            Event.on_press(event(credits, :decrement)),
            text("-")
          ),
          el([padding(10)], text("Count: #{credits.count}")),
          button(
            Event.on_press(event(credits, :increment)),
            text("+")
          )
        ]
      )
    )
  end

  def button(event, content) do
    Input.button(
      [
        event,
        Background.color(color(:slate, 800)),
        Font.color(color(:white)),
        padding(10)
      ],
      content
    )
  end
end
