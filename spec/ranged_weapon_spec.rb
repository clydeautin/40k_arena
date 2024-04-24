require './spec/spec_helper'


RSpec.describe Ranged_weapon do
    let(:heavy_boltgun) { Ranged_weapon.new('Heavy Boltgun', 24, 2, 3, 4, -1, 1) }
    let(:plasma_pistol) { Ranged_weapon.new('Plasma Gun', 12, 1, 3, 7, -2, 1) }
    let(:bolt_p2) { Ranged_weapon.new('Bolt Pistol', 12, 1, 2, 4, 0, 1, 'Pistol') }
    let(:cultist) {Model.new('Cultist Mob', 6, 3, 6, nil, 1, 7, 1)}
    let(:terminator) {Model.new('Terminator', 5, 5, 6, 4, 3, 6, 1)}

    describe '#initialize' do
        it 'is an instance of Ranged_weapon' do
            bolt_p2 = Ranged_weapon.new('Bolt Pistol', 12, 1, 2, 4, 0, 1, 'Pistol')

            expect(bolt_p2).to be_an_instance_of Ranged_weapon
        end
    end

    describe '#attack' do
        it 'a weapon should be able to shoot' do
            bolt_p2 = Ranged_weapon.new('Bolt Pistol', 12, 1, 2, 4, 0, 1, 'Pistol')
            cultist = Model.new('Cultist Mob', 6, 3, 6, nil, 1, 7, 1)
            hits = bolt_p2.shoot(cultist)

            expect(hits).to be_between(0, 1).inclusive
        end

        it 'a weapon should be able to wound' do
            bolt_p2 = Ranged_weapon.new('Bolt Pistol', 12, 1, 2, 4, 0, 1, 'Pistol')
            cultist = Model.new('Cultist Mob', 6, 3, 6, nil, 1, 7, 1)
            hits = bolt_p2.shoot(cultist)


            expect(hits).to be_between(0, 1).inclusive
        end
    end
end