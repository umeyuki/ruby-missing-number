module MissingNumber
  VERSION = "0.0.1"
  @@total_sum = 50005000
  
  def parse(io_or_string)
    case io_or_string
    when String
      parse_string(io_or_string)
    when IO
      parse_io(io_or_string)
    end
  end

  private
  
  def parse_string(string)
    numbers = eval string
    validate(numbers)
    @@total_sum - numbers.inject(:+)
  end
  
  def parse_io(io)
    parse_string(io.gets)
  end
  
  def validate(numbers)
    raise "Number should be 9,999 elements" if numbers.size != 9999
    raise "Numbers should be Fixnum" if numbers.find_all {|num| num.class != Fixnum }.any?
  end
  
  module_function :parse,:parse_io, :parse_string, :validate
  
  class <<self
    private :parse_io, :parse_string, :validate 
  end
  
end
