require './spec/spec_helper'


RSpec.describe Melee_weapon do

    describe '#initialize' do
        it 'is an instance of Melee_weapon' do
            sword_oi= Melee_weapon.new('Sword of Idaeus', 6, 2, 6, 2, 2, 'Sustained Hits 1')

            expect(sword_oi).to be_an_instance_of Melee_weapon
        end
    end
end