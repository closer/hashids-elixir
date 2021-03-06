defmodule Bench.HashidsEncode do
  use Benchfella

  hashids = [
    {"long alphabet", Hashids.new(
      alphabet: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890" <>
                "~!@#$%^&*()_+\"][{}|;:/?.>,<あいうえおかきくけこさしすせそたちつ" <>
                "てとまみむめもらちるれろはひふへほやゆよんをわなにぬねの" <>
                "абвгдежзийклмнопрстуфхцчшщьыъэюяАБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЬЫЪЭЮЯ"
    )},
    {"default alphabet", Hashids.new()}
  ]

  for {alpha, h} <- hashids do
    @h h
    bench "#{alpha}: encode 1 integer" do
      Hashids.encode(@h, 100)
    end

    bench "#{alpha}: encode 10 integers" do
      Hashids.encode(@h, 1000..1010 |> Enum.to_list)
    end

    bench "#{alpha}: encode 100 integers" do
      Hashids.encode(@h, 100..200 |> Enum.to_list)
    end
  end
end
