class T
  def initialize(params, &block)
    puts "the params are #{params}"
    arr = [1,2,3,4,5]
    arr.each { |e| yield e } if block_given?
  end
end


test = T.new(one: 1, two: 2) {|v| puts "the block yielded #{v}"}

