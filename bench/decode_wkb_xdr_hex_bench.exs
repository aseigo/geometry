defmodule DecodeWkbXdrHexBench do
  use BencheeDsl.Benchmark

  require Support
  import Support

  formatters(__MODULE__, "Decode WKB (XDR/hex)")

  inputs(data(:wkb, :xdr, :hex))

  job geo(wkbs) do
    Enum.map(wkbs, fn wkb -> Geo.WKB.decode!(wkb) end)
  end

  job geometry(wkbs) do
    Enum.map(wkbs, fn wkb -> wkb |> Base.decode16!() |> Geometry.from_wkb!() end)
  end
end
