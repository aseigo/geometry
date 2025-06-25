defmodule DecodeWkbNdrBinBench do
  use BencheeDsl.Benchmark

  require Support
  import Support

  formatters(__MODULE__, "Decode WKB (NDR/bin)")

  inputs(data(:wkb, :ndr, :bin))

  job geo(wkbs) do
    Enum.map(wkbs, fn wkb -> Geo.WKB.decode!(wkb) end)
  end

  job geometry(wkbs) do
    Enum.map(wkbs, fn wkb -> Geometry.from_wkb!(wkb) end)
  end
end
