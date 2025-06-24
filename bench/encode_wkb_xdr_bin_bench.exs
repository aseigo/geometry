defmodule EncodeWkbXdrBinBench do
  use BencheeDsl.Benchmark

  require Support
  import Support

  formatters(__MODULE__, "Encode WKB (XDR/bin)")

  @endian :xdr

  inputs(data(:elixir))

  job geo({_geometry, geos}) do
    Enum.map(geos, fn geo -> geo |> Geo.WKB.encode_to_iodata(@endian) |> IO.iodata_to_binary() end)
  end

  job geometry({geometries, _geo}) do
    Enum.map(geometries, fn geometry -> Geometry.to_wkb(geometry, @endian) end)
  end
end
