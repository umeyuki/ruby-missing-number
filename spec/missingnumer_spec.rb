require 'spec_helper'
require 'pry'
describe MissingNumber do

  describe :parse do
    
    context 'String argument' do
      before(:each) do
        @numbers = (1..10000).to_a.shuffle
      end

      context 'Success' do
        it 'should be 2' do
          expected = @numbers.delete(2)
          expect(MissingNumber.parse(@numbers.to_s)).to eq(expected)
        end

        it 'should be 12' do
          expected = @numbers.delete(12)
          expect(MissingNumber.parse(@numbers.to_s)).to eq(expected)
        end

        it 'should be 123' do
          expected = @numbers.delete(123)
          expect(MissingNumber.parse(@numbers.to_s)).to eq(expected)
        end

        it 'should be 1234' do
          expected = @numbers.delete(1234)
          expect(MissingNumber.parse(@numbers.to_s)).to eq(expected)
        end

        it 'should be 10000' do
          expected = @numbers.delete(1234)
          expect(MissingNumber.parse(@numbers.to_s)).to eq(expected)
        end
      end

      # context 'Error' do

      #   it 'should return size error' do
      #     @numbers = (1..9999).to_a.shuffle
      #     expect{MissingNumber.parse(@numbers)}.to raise_error("Number should be 9,999 elements")  
      #   end

      #   it 'should return type error' do
      #     @numbers = (1..9999).to_a.shuffle
      #     @numbers.delete(1234)
      #     @numbers.push("1234")
      #     expect{MissingNumber.parse(@numbers)}.to raise_error("Numbers should be Fixnum")  
      #   end
        
      # end

      
    end

    # context 'IO argument' do
    #   it 'should be 9999' do
    #     expect(MissingNumber.parse(File.open("#{File.dirname(__FILE__)}/test.txt"))).to eq(9999)
    #   end
    # end
  end

  
end
