defmodule ProjectArticlesElixir do
  alias ProjectArticlesElixir.Cli

  @moduledoc """
  Este projeto tem como fim fazer uma conexão com a API do Dev.to alêm de facilitar a colaboração de todo o squad na produção de novos artigos
  """

  @api_key ProjectArticlesElixir.Helper.api_key_string()
  def main(filename) do
    data =
      verify_file(filename)
      |> do_questions(filename)

    filename
    |> File.read!()
    |> create_body(data)
    |> input_options(data.organization_id, data.series)
    |> Jason.encode!()
    |> post_article(data.username)
  end

  defp do_questions({:ok, _content}, filename) do
    Cli.questions(filename)
  end

  defp do_questions({:error, _content}, _filename) do
    IO.puts("Try again...")
  end

  defp verify_file(file) do
    IO.puts("Searching file....")

    File.read(file)
    |> check_file()
  end

  defp check_file({:error, _reason} = resp) do
    IO.puts("File not found!")
    resp
  end

  defp check_file({:ok, _content} = resp) do
    IO.puts("File found, go on!")
    resp
  end

  defp create_body(content, data) do
    %{
      article: %{
        title: data.title,
        published: true,
        body_markdown: content,
        tags: data.tags
      }
    }
  end

  defp input_options(body, organization_id, series) do
    body
    |> input_organization_id_if_exist(organization_id)
    |> input_series_if_exist(series, String.length(series))
  end

  defp input_organization_id_if_exist(body, organization_id) when organization_id > 0,
    do: Map.put_new(body, "organization_id", organization_id)

  defp input_organization_id_if_exist(body, _data), do: body

  defp input_series_if_exist(body, series, series_length) when series_length > 0,
    do: Map.put_new(body, "series", series)

  defp input_series_if_exist(body, _series, _series_length), do: body

  def post_article(body, username) do
    IO.inspect(body)
    headers = [{:"Content-type", "application/json"}, {:"api-key", @api_key}]

    url = "https://dev.to/api/articles?username=#{username}"

    HTTPoison.post!(url, body, headers, [])
  end
end
