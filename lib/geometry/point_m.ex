defmodule Geometry.PointM do
  @moduledoc """
  A point struct, representing a 2D point with a measurement.
  """
  use Geometry.Protocols

  import Geometry.Guards

  alias Geometry.PointM

  defstruct coordinate: [], srid: 0

  @type t :: %PointM{coordinate: Geometry.coordinate() | [], srid: Geometry.srid()}

  @doc """
  Creates an empty `PointM`.

  ## Examples

      iex> PointM.new()
      %PointM{coordinate: []}
  """
  @spec new :: t()
  def new, do: %PointM{coordinate: []}

  @doc """
  Creates a `PointM` from the given `coordinate`.

  ## Examples

      iex> PointM.new([1.5, -2.1, 4])
      %PointM{coordinate: [1.5, -2.1, 4]}
  """
  @spec new(Geometry.coordinate(), Geometry.srid()) :: t()
  def new([x, y, m] = coordinate, srid \\ 0) when is_coordinate(x, y, m) do
    %PointM{coordinate: coordinate, srid: srid}
  end

  @doc """
  Creates a `PointM` from the given `x`, `y`, and `m`.

  ## Examples

      iex> PointM.new(-1.1, 2.2, 4)
      %PointM{coordinate: [-1.1, 2.2, 4], srid: 0}
  """
  @spec new(number(), number(), number(), Geometry.srid()) :: t()
  def new(x, y, m, srid \\ 0) when is_coordinate(x, y, m) do
    %PointM{coordinate: [x, y, m], srid: srid}
  end
end
