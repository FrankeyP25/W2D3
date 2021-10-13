class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
  
  attr_reader :pegs
  def self.valid_pegs?(arr)
    keys = POSSIBLE_PEGS.keys
    arr.all? { |el| keys.include?(el.upcase) }
  end

  def initialize(arr_chars)
    raise "Error" if !Code.valid_pegs?(arr_chars)
    @pegs = arr_chars.map(&:upcase)
  end

  def self.random(num)
    eles = POSSIBLE_PEGS.keys
    arr = []
    while arr.length < num
      arr << eles[rand(0...eles.length)]
    end
    Code.new(arr)
  end

  def self.from_string(str)
      # arr = Code.random(str.length)
      Code.new(str.split(""))
  end
  
  def [](position)
    @pegs[position]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    count = 0
    @pegs.each_with_index do |el,i|
      if guess[i] == el
        count += 1
      end
    end
    count
  end

  def num_near_matches(code)
    count = 0
    (0...code.length).each do |i|
      if code[i] != self[i] && self.pegs.include?(code[i])
        count += 1 
      end
    end
    return 0 if count == num_exact_matches(code)
    count
  end

  # def ==(other)
  #   self == other
  # end
end
