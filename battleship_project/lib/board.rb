require "byebug"

class Board
    attr_reader :size
  def initialize(num)
    @grid = Array.new(num) {Array.new([:N] * num)}
    @size = num * num
  end

  def [](position)
    @grid[position[0]][position[1]]
  end

  def []=(position, v)
    @grid[position[0]][position[1]] = v
  end

  def num_ships
    @grid.flatten.count { |el| el == :S }
  end

  #part 2

  def attack(position)
    # debugger
    if self[position] == :S
        self[position] = :H
        puts "you sunk m batlleship!"
        return true
    else
        self[position] = :X
        return false
    end
  end

  def place_random_ships
    num = (@size * 25) / 100
    while self.num_ships < num
        length = @grid.length
        row = rand(0...length)
        col = rand(0...length)
        position = [ row, col]
        self[position] = :S
    end
  end

  def hidden_ships_grid
    @grid.map do |row|
        row.map { |el| el == :S ? :N : el }
    end
  end

  def self.print_grid(arrs)
    arrs.each { |sub| puts sub.join(" ") }
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(self.hidden_ships_grid)
  end
end
