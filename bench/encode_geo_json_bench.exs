defmodule EncodeGeoJsonBench do
  use BencheeDsl.Benchmark

  require Support
  import Support

  formatters(__MODULE__, "Encode GeoJson")

  inputs(data(:elixir))

  job geometry({geometries, _geo}) do
    Enum.map(geometries, fn geometry -> Geometry.to_geo_json(geometry) end)
  end

  job geo({_geometry, geos}) do
    Enum.map(geos, fn geo -> Geo.JSON.encode!(geo) end)
  end
end
