require './lib/model.rb'
require 'pry'

# frozen_string_literal: true
RSpec.describe Model do

    describe '#initialize' do
        it 'is is an instance of Model' do
            uriel_v = Model.new('Uriel Ventris', 6, 4, 3, 4, 5, 6, 1)

            expect(uriel_v).to be_an_instance_of(Model)
        end

        it 'has a name do' do
            uriel_v = Model.new('Uriel Ventris', 6, 4, 3, 4, 5, 6, 1)

            expect(uriel_v.name).to eq('Uriel Ventris')
        end

        it 'has a movement do' do
            uriel_v = Model.new('Uriel Ventris', 6, 4, 3, 4, 5, 6, 1)

            expect(uriel_v.movement).to eq(6)
        end

        it 'has a toughness do' do
            uriel_v = Model.new('Uriel Ventris', 6, 4, 3, 4, 5, 6, 1)

            expect(uriel_v.toughness).to eq(4)
        end

      
        it 'has a save' do
            uriel_v = Model.new('Uriel Ventris', 6, 4, 3, 4, 5, 6, 1)
            expect(uriel_v.save).to eq(3)
        end

        it 'has an invulnerable save' do
            uriel_v = Model.new('Uriel Ventris', 6, 4, 3, 4, 5, 6, 1)
            expect(uriel_v.invul_save).to eq(4)
        end

        it 'has wounds' do
            uriel_v = Model.new('Uriel Ventris', 6, 4, 3, 4, 5, 6, 1)
            expect(uriel_v.wounds).to eq(5)
        end

        it 'has leadership' do
            uriel_v = Model.new('Uriel Ventris', 6, 4, 3, 4, 5, 6, 1)
            expect(uriel_v.leadership).to eq(6)
        end

        it 'has objective control' do
            uriel_v = Model.new('Uriel Ventris', 6, 4, 3, 4, 5, 6, 1)
            expect(uriel_v.objective_control).to eq(1)
        end

        it 'has abilities which defaults to nil' do
            uriel_v = Model.new('Uriel Ventris', 6, 4, 3, 4, 5, 6, 1)
            expect(uriel_v.abilities).to eq(nil)
        end
    end

end


