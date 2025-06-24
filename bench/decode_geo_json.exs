defmodule DecodeGeoJsonBench do
  use BencheeDsl.Benchmark

  require Support
  import Support

  formatters(__MODULE__, "Decode WKB (NDR/hex)")

  inputs(data(:geo_json))

  job geo(input) do
    Geo.JSON.decode!(input)
  end

  job geometry(input) do
    Geometry.from_geo_json!(input)
  end
end
