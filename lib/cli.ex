defmodule ProjectArticlesElixir.Cli do
  def questions(filename) do
    IO.puts("================ Formulario =====================")
    IO.puts("File: #{filename}")
    username = ExPrompt.string_required("Username: ")
    title = ExPrompt.string_required("Titulo do Artigo: ")
    organization_id_string = ExPrompt.string("Organization id: ")
    serie_name = ExPrompt.string("Serie name: ")
    tags = ExPrompt.string("Tags: ")
    IO.puts("================================================")
    IO.puts("============== Dados Enviados ==================")


    organization_id = parse_organization_id(organization_id_string)

    fetch_data(username, title, filename, tags, organization_id, serie_name)
  end

  defp parse_organization_id(organization_id_string) do
    case organization_id_string do
     "" -> nil
     _ -> do_parse(organization_id_string)
    end
  end

  defp do_parse(organization_id_string) do
    organization_id_string
    |> String.trim()
    |> String.to_integer()
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
