class MaxIntSet
  attr_reader :store, :max
  def initialize(max)
    @store = Array.new(max, false)
    @max = max 
  end

  def insert(num)
    raise "Out of bounds" if num >= @max or num < 0  
    @store[num] = true 
  end

  def remove(num)
    raise "Out of bounds" if num >= @max or num < 0
    @store[num] = false
  end

  def include?(num)
    store[num] == true
  end

  private

  def is_valid?(num)

  end

  def validate!(num)
  end
end


class IntSet
  attr_reader :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    sub_idx = num % 20
    @store[sub_idx] << num    
  end

  def remove(num)
    sub_idx = num % 20
    @store.delete_at(sub_idx)
  end

  def include?(num)
    sub_idx = num % 20
    @store[sub_idx].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end















class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end
  
  def has_room?
    @store.any? { |sub| sub.empty? }
  end

  def insert(num)
    # if
    # !@store.include?(num)
    if self.has_room? && !@store.include?(num)
      idx = num % 20
      @store[idx] << num
      @count += 1
    elsif !self.has_room? && !@store.include?(num) 
      half = num_buckets
      @store.concat(Array.new(num_buckets) {Array.new}) 
      (0...half).each do |i|
        @store.each do |num|
          new_sub_idx = num % num_buckets
          @store[new_sub_idx] << num
          
        end
      end
      @count += 1
    end
  end


  def remove(num)
  end

  def include?(num)
    idx = num % num_buckets
    @store[idx].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
