require './spec/spec_helper'

RSpec.describe Dice do

    describe '#initialize' do
        it 'is an instance of Dice' do
            d6 = Dice.new(6)

            expect(d6).to be_an_instance_of Dice
        end
    end

    describe '#roll' do
        it'returns an integer' do
            d6 = Dice.new(6)
            d3 = Dice.new(3)

            expect(d6.roll).to be_between(1, 6).inclusive
            expect(d3.roll).to be_between(1, 3).inclusive
        end
    end
end