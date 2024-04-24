require './spec/spec_helper'

RSpec.describe Model do
    before(:all) do
        @uriel_v = Model.new('Uriel Ventris', 6, 4, 3, 4, 5, 6, 1)
    end

    describe '#initialize' do
        it 'is an instance of Model' do
            expect(@uriel_v).to be_an_instance_of(Model)
        end

        it 'has a name' do
            expect(@uriel_v.name).to eq('Uriel Ventris')
        end

        it 'has a movement' do
            expect(@uriel_v.movement).to eq(6)
        end

        it 'has a toughness' do
            expect(@uriel_v.toughness).to eq(4)
        end

        it 'has a save' do
            expect(@uriel_v.save).to eq(3)
        end

        it 'has an invulnerable save' do
            expect(@uriel_v.invul_save).to eq(4)
        end

        it 'has wounds' do
            expect(@uriel_v.wounds).to eq(5)
        end

        it 'has leadership' do
            expect(@uriel_v.leadership).to eq(6)
        end

        it 'has objective control' do
            expect(@uriel_v.objective_control).to eq(1)
        end

        it 'has abilities which defaults to nil' do
            expect(@uriel_v.abilities).to eq(nil)
        end
    end

    describe '#wounds' do
        before(:all) do

            @original_wounds = @uriel_v.wounds
        end

        it 'can lose a wound' do
            @uriel_v.wound
            expect(@uriel_v.wounds).to eq(@original_wounds - 1)
        end

        it 'can die' do
            4.times { @uriel_v.wound }
            expect(@uriel_v.dead?).to eq true
        end
    end

    describe '#ranged_weapon' do
        it 'can have ranged weapons' do
            bolt_p2 = Ranged_weapon.new('Bolt Pistol', 12, 1, 2, 4, 0, 1, 'Pistol')

            @uriel_v.add_ranged_weapon(bolt_p2)
            expect(@uriel_v.ranged_weapons).to eq([bolt_p2])
        end
    end
end
