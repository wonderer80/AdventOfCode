def calc_power_level(serial_number, x, y)
  rack_id = x + 10
  power_level = rack_id * y
  power_level += serial_number
  power_level *= rack_id
  power_level = if power_level < 100
                  0
                else
                  power_level.to_s[-3].to_i
                end
  power_level -= 5
end

serial_number = 57

grid = {}

(1..10).each do |x|
  grid[x] = {}
  (1..10).each do |y|
    power_level = calc_power_level(serial_number, x, y)
    if power_level >= 0
      print " #{power_level} "
    else
      print "#{power_level} "
    end
  end
  puts ""
end