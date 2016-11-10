require_relative "../lib/warmup.rb"
require 'spec_helper'

describe Warmup do

  let (:w) { Warmup.new}

  describe '#gets_shout' do
    before do
	allow(w).to receive(:puts)
    end
    it 'inputs a string and outputs uppercased string' do
      allow(w).to receive(:gets).and_return("graeme")
      expect(w.gets_shout).to eq("GRAEME")
    end
  end

  describe '#triple_size' do
    it 'returns a triple sized array' do
    
    fake_array = double('Array', :size => 3)
    
    expect(w.triple_size(fake_array)).to eq(9)
    end

  end

  describe '#call_some_methods' do
    
    it ' The string you pass in receives the #upcase!' do 
      a_string = "Monkey"
      expect(a_string).to receive(:upcase!).and_return("MONKEY")
      w.calls_some_methods(a_string)
    end

    it 'The string you pass in receives the #reverse!  ' do 
      a_string = "Monkey"
      expect(a_string).to receive(:reverse!).and_return("YEKNOM")
      w.calls_some_methods(a_string)
    end
    
    it 'returns a completely different object' do 
      expect(w.calls_some_methods("hi")).to eq("I am unrelated")
     end


  end

end
