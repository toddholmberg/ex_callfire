require IEx
defmodule ExCallfire do
  use HTTPoison.Base

  def headers() do
    username = Application.get_env(:ex_callfire, :username, System.get_env("CALLFIRE_USERNAME"))
    password = Application.get_env(:ex_callfire, :password, System.get_env("CALLFIRE_PASSWORD"))

    [{"Authorization", "Basic #{:base64.encode("#{username}:#{password}")}"},
    {"Content-Type", "application/json"}]
  end

  def url(:get, api_url, resource, data) do
    api_url <> resource <> "?" <> URI.encode_query(data)
  end

  def url(api_url, resource, data \\ "") do
    api_url <> resource <> "/" <> data
  end

  def req(:get, resource) do
    api_url = Application.get_env(:ex_callfire, :endpoint, System.get_env("CALLFIRE_ENDPOINT"))
    options = Application.get_env(:ex_callfire, :httpoison, [])
    url = url(api_url, resource)
    HTTPoison.request(:get, url, "", headers(), options)
  end

  def req(:get, resource, data) do
    api_url = Application.get_env(:ex_callfire, :endpoint, System.get_env("CALLFIRE_ENDPOINT"))
    options = Application.get_env(:ex_callfire, :httpoison, [])
    url = url(:get, api_url, resource, data)
    HTTPoison.request(:get, url, "", headers(), options)
  end

  def req(:post, resource, data) do
    api_url = Application.get_env(:ex_callfire, :endpoint, System.get_env("CALLFIRE_ENDPOINT"))
    options = Application.get_env(:ex_callfire, :httpoison, [])
    url = url(api_url, resource)
    HTTPoison.request(:post, url, Poison.encode!(data), headers(), options)
  end

  def req(:delete, resource, data) do
    api_url = Application.get_env(:ex_callfire, :endpoint, System.get_env("CALLFIRE_ENDPOINT"))
    options = Application.get_env(:ex_callfire, :httpoison, [])
    url = url(api_url, resource, data)
    HTTPoison.request(:delete, url, "", headers(), options)
  end

  def parse({:ok, %{status_code: 200, body: body}}) do
    {:ok, Poison.decode!(body)}
  end
  def parse({:ok, %{body: body}}) do
    error = Poison.decode!(body) |> Map.fetch!("error")
    {:error, error}
  end
  def parse({:error, error}), do: {:error, error}

end
