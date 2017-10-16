defmodule Mix.Tasks.Dingen.BuildClient do
  use Mix.Task

  @shortdoc "Build the client javascript for production"

  def run(_args) do
    Mix.shell.info("Building the client")
    0 = Mix.shell.cmd("cd client; npm run build")
    Mix.shell.info("copying the files to priv/static")
    0 = Mix.shell.cmd("rsync -av --delete client/build/ priv/static/")
  end
end
