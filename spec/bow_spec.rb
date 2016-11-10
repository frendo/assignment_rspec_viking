# Your code here
require_relative "../lib/weapons/bow.rb"
require 'spec_helper'

describe Bow do

  let(:b){Bow.new}

  describe '#initialize' do

    it 'should read the bow count' do
      expect(b.arrows).to  be_a(Fixnum)
    end

    it 'bow should default to 10 arrows' do
      expect(b.arrows).to eq(10)
    end

    it 'created with a specified #arrows start with #arrows' do
      new_bow = Bow.new(69)
      expect(new_bow.arrows).to eq(69)
    end
    
  end

  describe '#use' do

    it 'using a bow reduces arrows by 1' do
      allow(b).to receive(:puts)
      b.use
      expect(b.arrows).to eq(9)
    end

    it 'using a bow with 0 arrows throws an error' do
      allow(b).to receive(:out_of_arrows?).and_return(true)
      expect{b.use}.to raise_error("Out of arrows")
    end

  end

end
