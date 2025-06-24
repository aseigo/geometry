defmodule EncodeWkbNdrHexBench do
  use BencheeDsl.Benchmark

  require Support
  import Support

  formatters(__MODULE__, "Encode WKB (NDR/hex)")

  @endian :ndr

  inputs(data(:elixir))

  job geo({_geometry, geos}) do
    Enum.map(geos, fn geo -> Geo.WKB.encode!(geo, @endian) end)
  end

  job geometry({geometries, _geo}) do
    Enum.map(geometries, fn geometry ->
      geometry |> Geometry.to_wkb(@endian) |> Base.encode16()
    end)
  end
end
