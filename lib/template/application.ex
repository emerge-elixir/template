defmodule Template.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Template.Chat.App,
      Template.Viewport,
      {Emerge.Runtime.CodeReloader,
       dirs: [
         Path.expand("..", __DIR__)
       ],
       reloadable_apps: [:template]}
      # Starts a worker by calling: Template.Worker.start_link(arg)
      # {Template.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Template.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
