defmodule ProjectArticlesElixir.Cli do
  def questions(filename) do
    IO.puts("================ Formulario =====================")
    IO.puts("File: #{filename}")
    username = ExPrompt.string_required("Username: ")
    title = ExPrompt.string_required("Titulo do Artigo: ")
    organization_id_string = ExPrompt.string_required("Organization id: ")
    serie_name = ExPrompt.string("Serie name: ")
    tags = ExPrompt.string("Tags: ")
    IO.puts("================================================")

    IO.puts("============== Dados Enviados ==================")
    organization_id =
      organization_id_string
      |> String.trim()
      |> String.to_integer()

    fetch_data(username, title, filename, tags, organization_id, serie_name)
  end

  defp fetch_data(username, title, filename, tags, organization_id, serie_name) do
    %{
      username: String.trim(username),
      title: String.trim(title),
      filename: String.trim(filename),
      tags: String.split(tags),
      organization_id: organization_id,
      series: String.trim(serie_name)
    }
  end
end
