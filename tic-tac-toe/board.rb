
class Board
    def initialize
        @grid = Array.new(3) {Array.new(["_"] * 3)}
    end

    def [](pos)
        @grid[pos[1]][pos[1]]
    end

    def []=(pos,val)
        @grid[pos[0]][pos[1]] = val
    end

    def valid?(pos)
        r, c = pos
        pos.all? { |i| 0 <= i && i < @grid.length }
    end

    def empty?(pos)
        self[pos] == "_"
    end

    def place_mark(pos, val)
        raise "invalid mark" if !valid?(pos) || !empty?(pos)
        self[pos] = val
    end

    def print
        @grid.each { |sub| puts sub.join(" ") } 
    end

    def win_row?(mark)
        @grid.all? { |row| row.uniq.length == 1 && row.uniq[0] == mark }
    end

    def win_col?(mark)
        @grid.transpose.all? { |col| col.uniq.length == 1 && col.uniq[0] == mark }
    end

    def win_diagonal?(mark)
        length = @grid.length
        arr1 = []
        arr2 = []
        (0...length).each do |i|
           arr1 << @grid[i][i]
           arr2 << @grid[i][-1 - i]
        end

       return true if arr1.uniq.length == 1 && arr1.uniq[0] == mark || arr2.uniq.length == 1 && arr2.uniq[0] == mark
       false
    end

    def win?(ma)
        win_row?(ma) || win_diagonal?(ma) || win_col?(ma)
    end

    def empty_positions?
    indices = (0...@grind.length).to_a
    positions = indices.product(indices)
    positions.any? { |pos| empty?(pos) }
    end
end

