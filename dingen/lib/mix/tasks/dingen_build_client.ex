defmodule Mix.Tasks.Dingen.BuildClient do
  use Mix.Task

  @shortdoc "Build the client javascript for production"

  def run(_args) do
    Mix.shell.info("Building the frontend")
    0 = Mix.shell.cmd("cd client/frontend; npm run build")
    Mix.shell.info("copying the files to priv/static")
    0 = Mix.shell.cmd("rsync -av --delete client/frontend/build/ priv/static/frontend/")

    Mix.shell.info("Building the admin")
    0 = Mix.shell.cmd("cd client/admin; npm run build")
    Mix.shell.info("copying the files to priv/static")
    0 = Mix.shell.cmd("rsync -av --delete client/admin/build/ priv/static/admin/")
  end
end
