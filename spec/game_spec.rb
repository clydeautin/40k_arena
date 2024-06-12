require './spec/spec_helper'

RSpec.describe Game do

    describe "#initialize" do
        it 'is an instance of Game' do
            game = Game.new

            expect(game).to be_an_instance_of Game
        end
    end
end