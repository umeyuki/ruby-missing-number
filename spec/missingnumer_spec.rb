require 'spec_helper'

describe MissingNumber do

  describe :parse do
    
    context 'String argument' do

      before(:each) do
        @numbers = [1..10000].shuffle
      end

      it 'should be 1' do
        expected = @numbers.delete(1)
        expect(MissingNumber.parse(@numbers)).to eq(expected)
      end

      it 'should be 12' do
        expected = @numbers.delete(12)
        expect(MissingNumber.parse(@numbers)).to eq(expected)
      end

      it 'should be 123' do
        expected = @numbers.delete(123)
        expect(MissingNumber.parse(@numbers)).to eq(expected)
      end

      it 'should be 1234' do
        expected = @numbers.delete(1234)
        expect(MissingNumber.parse(@numbers)).to eq(expected)
      end

      it 'should be 10000' do
        expected = @numbers.delete(1234)
        expect(MissingNumber.parse(@numbers)).to eq(expected)
      end

      # it 'should return ' do
      #   @numbers = (1..9999).to_a.shuffle
      #   expect{get_progress_name(input)}  
      # end
      
    end

    # context 'IO argument' do
    #   it 'should be 9999' do
    #     expect(MissingNumber.parse(File.open("#{File.dirname(__FILE__)}/test.txt"))).to eq(9999)
    #   end
    # end
  end

  
end
