require './lib/model.rb'
require 'pry'

# frozen_string_literal: true
RSpec.describe Model do

    describe '#initialize' do
        it 'is is an instance of Model' do
            uriel_v = Model.new('Uriel Ventris', 6, 4, 3, 4, 5, 6, 1)

            expect(uriel_v).to be_an_instance_of(Model)
        end
    end

end


