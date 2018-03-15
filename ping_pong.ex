defmodule PingPong do
  @doc """
  iex(1)> ping = spawn(PingPong, :start, [])
  #PID<0.89.0>

  iex(2)> pong = spawn(PingPong, :start, [])
  #PID<0.91.0>

  iex(3)> send(ping, {:pong, pong})
  ping ->
  {:pong, #PID<0.91.0>}
             <- pong
  ping ->
             <- pong
  ping ->
  """

  def start do
    loop()
  end

  def loop do
    receive do
      {:pong, from} ->
        IO.puts("ping ->")
        :timer.sleep(500)
        send(from, {:ping, self()})

      {:ping, from} ->
        IO.puts("           <- pong")
        :timer.sleep(500)
        send(from, {:pong, self()})
    end

    loop()
  end
end
