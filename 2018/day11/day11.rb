class Day11
  class << self
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

    def key(x, y)
      "#{x},#{y}"
    end

    def calc_total_power(grid, square_size, start_x, start_y)
      total_power = 0
      (start_x...start_x+square_size).each do |x|
        (start_y...start_y+square_size).each do |y|
          total_power += grid[key(x,y)]
        end
      end
      total_power
    end

    def search_max_pos(serial_number, square_size)
      grid = {}

      (1..300).each do |x|
        (1..300).each do |y|
          power_level = calc_power_level(serial_number, x, y)
          grid[key(x, y)] = power_level
        end
      end

      total_power = {}
      max = -1000000
      max_pos = ""

      (1..300-square_size+1).each do |x|
        (1..300-square_size+1).each do |y|
          start_time = Time.now
          total_power[key(x,y)] = calc_total_power(grid, square_size, x, y)
          puts "x1 #{Time.now-start_time}"

          if max < total_power[key(x,y)]
            max = total_power[key(x,y)]
            max_pos = key(x,y)
          end
        end

      end

      return max_pos, max
    end
  end
end
