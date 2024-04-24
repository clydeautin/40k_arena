require './spec/spec_helper'


RSpec.describe Ranged_weapon do

    describe '#initialize' do
        it 'is an instance of Ranged_weapon' do
            bolt_p2 = Ranged_weapon.new('Bolt Pistol', 12, 1, 2, 4, 0, 1, 'Pistol')

            expect(bolt_p2).to be_an_instance_of Ranged_weapon
        end
    end

    describe '#attack' do
        it 'a weapon should be able to shoot' do
            bolt_p2 = Ranged_weapon.new('Bolt Pistol', 12, 1, 2, 4, 0, 1, 'Pistol')
            hits = bolt_p2.shoot

            expect(hits).to be_between(0, 1).inclusive
        end

        it 'a weapon should be able to wound' do
            bolt_p2 = Ranged_weapon.new('Bolt Pistol', 12, 1, 2, 4, 0, 1, 'Pistol')
            cultist = Model.new('Cultist Mob', 6, 3, 6, nil, 1, 7, 1)
            hits = bolt_p2.shoot

            expect(hits).to be_between(0, 1).inclusive
        end
    end
end