defmodule WebSearch do
  def search(url \\ 'https://elixir-lang.org/') do
    :inets.start()
    :ssl.start()

    {:ok, {status, headers, body}} = :httpc.request(url)

    %{status: status, headers: headers, body: body}
  end
end
