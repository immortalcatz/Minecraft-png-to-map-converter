require "chunky_png"

png = ChunkyPNG::Image.from_file('file.png')

colors = {
  [255, 255, 255] => 0,
  [255, 128, 0  ] => 1,
  [255, 0  , 255] => 2,
  [0  , 230, 255] => 3,
  [255, 255, 0  ] => 4,
  [0  , 255, 0  ] => 5,
  [255, 127, 255] => 6,
  [64 , 64 , 64 ] => 7,
  [127, 127, 127] => 8,
  [0  , 190, 255] => 9,
  [127, 0, 127] => 10,
  [0  , 0  , 255] => 11,
  [150, 100, 0  ] => 12,
  [0  , 127, 0  ] => 13,
  [255, 0  , 0  ] => 14,
  [0  , 0  , 0  ] => 15
}

File.open("function.txt", "w") do |file|
  128.times do |y|
    128.times do |x|
      arr = [ChunkyPNG::Color.r(png[x,y]),
             ChunkyPNG::Color.g(png[x,y]),
             ChunkyPNG::Color.b(png[x,y])]
      data_tag = colors[arr]
      file.puts "/setblock #{x - 64} 100 #{y - 64} concrete #{data_tag}\n"
    end
  end
end

