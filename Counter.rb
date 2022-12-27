#!/usr/bin/env ruby

require 'rspec/autorun'

def counter(initial_value = 0)
  Counter.counter(initial_value)
end

class Counter
  attr_accessor :current_count

  def self.counter(initial_counter = 0)
    @current_count = initial_counter
    return [current_counter, incremented_counter]
  end

  def self.current_counter
    @current_count
  end

  def self.incremented_counter
    @current_count + 1 
  end
end


describe Counter do
  let(:described_class) { Counter }
  let(:current_count) {rand()}
  let(:incremented_value) {current_count + 1}

  describe '#counter' do
    context 'passing no value' do
      it 'returns 0 as current value' do
        expect(described_class.counter).to include(0)
      end
      it 'returns 1 as incremented value' do
        expect(described_class.counter).to include(1)
      end
    end

    context 'passing some values' do
      it 'returns some current value' do
        expect(described_class.counter(current_count)).to include(current_count)
      end
      it 'returns some incremented value' do
        expect(described_class.counter(current_count)).to include(incremented_value)
      end
    end
  end
end
