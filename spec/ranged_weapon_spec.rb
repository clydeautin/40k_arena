require './spec/spec_helper'


RSpec.describe Ranged_weapon do

    describe '#initialize' do
        it 'is an instance of Ranged_weapon' do
            bolt_p2 = Ranged_weapon.new('Bolt Pistol', 12, 1, 2, 4, 0, 1, 'Pistol')

            expect(bolt_p2).to be_an_instance_of Ranged_weapon
        end
    end
end