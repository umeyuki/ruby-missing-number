require 'spec_helper'
describe MissingNumber do

  describe :parse do
    
    context 'String argument' do
      before(:each) do
        @numbers = (1..10000).to_a.shuffle
      end

      context 'Success' do
        it 'should return 2' do
          expected = @numbers.delete(2)
          expect(MissingNumber.parse(@numbers.to_s)).to eq(expected)
        end

        it 'should return 12' do
          expected = @numbers.delete(12)
          expect(MissingNumber.parse(@numbers.to_s)).to eq(expected)
        end

        it 'should return 123' do
          expected = @numbers.delete(123)
          expect(MissingNumber.parse(@numbers.to_s)).to eq(expected)
        end

        it 'should return 1234' do
          expected = @numbers.delete(1234)
          expect(MissingNumber.parse(@numbers.to_s)).to eq(expected)
        end

        it 'should return 10000' do
          expected = @numbers.delete(10000)
          expect(MissingNumber.parse(@numbers.to_s)).to eq(expected)
        end
      end

      context 'Error' do

        it 'should return size error' do
          expect{MissingNumber.parse(@numbers.to_s)}.to raise_error("Number should be 9,999 elements")  
        end

        it 'should return type error' do
          @numbers = (1..9999).to_a.shuffle
          @numbers.delete(1234)
          @numbers.push("1234")
          expect{MissingNumber.parse(@numbers.to_s)}.to raise_error("Numbers should be Fixnum")  
        end
      end
    end

    context 'IO argument' do
      context 'Success' do
        it 'should return 9380 from file' do
          missing_num = 9380
          io = File.open("#{File.dirname(__FILE__)}/successed_9380.txt")
          numbers = eval io.gets
          expect(numbers.size).to eq(9999)
          expect(numbers.grep(/#{missing_num}/).empty?).to be true

          io.rewind
          expect(MissingNumber.parse(io)).to eq(missing_num)
        end
      end

      context 'Error' do
        it 'should return type error from file' do
          expect{MissingNumber.parse(File.open("#{File.dirname(__FILE__)}/failed_few_elements.txt"))}.to raise_error("Number should be 9,999 elements")  
        end
        
        it 'should return size error from file' do
          expect{MissingNumber.parse(File.open("#{File.dirname(__FILE__)}/failed_include_string.txt"))}.to raise_error("Numbers should be Fixnum")  
        end
      end
    end
  end
end
