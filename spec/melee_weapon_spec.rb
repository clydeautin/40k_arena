require './spec/spec_helper'


RSpec.describe Melee_weapon do
    let(:sword_oi) { Melee_weapon.new('Sword of Idaeus', 6, 2, 6, 2, 2, 'Sustained Hits 1') }
    let(:brutal_aw) { Melee_weapon.new('Brutal Assault Weapon', 2, 4, 3, 0, 1, 'Sustained Hits 1') }
    let(:cultist) {Model.new('Cultist Mob', 6, 3, 6, 1, 7, 1, nil)}
    let(:terminator) {Model.new('Terminator', 5, 5, 2, 3, 6, 1, 4)}

    describe '#initialize' do
        it 'is an instance of Melee_weapon' do
            sword_oi= Melee_weapon.new('Sword of Idaeus', 6, 2, 6, 2, 2, 'Sustained Hits 1')

            expect(sword_oi).to be_an_instance_of Melee_weapon
        end
    end

    describe '#melee' do
        context 'using Sword of Idaeus against Cultist' do
            it 'applies at least one wound to the Cultist' do
                # Stub rand to ensure hits and wounds
                allow(sword_oi).to receive(:rand).and_return(4, 4, 2, 3, 5, 3, 
                                                                1, 2, 3, 4, 5, 6)  # Successful hit and wound rolls

                # Execute the melee method
                result = sword_oi.melee(cultist)

                # Check the resulting wounds after being shot
                expect(result).to eq(10)
                expect(cultist.dead?).to be true 
            end
        end

        context 'using Brutal Assault Weapon on Terminator ' do
            it 'wounds but does not kill the Terminator' do
                allow(brutal_aw).to receive(:rand).and_return(6, 5, 1, 6, 1)  # Hit, wounds and terminator fails one save
                
                result = brutal_aw.melee(terminator)

                expect(result).to eq(1)
                expect(terminator.wounds).to be 2
            end
        end

        context 'Sword of Idaeus ' do
            it 'kills the Terminator' do
                allow(sword_oi).to receive(:rand).and_return(6, 5, 4, 3, 2, 1, # 5 hits
                                                                6, 5, 4, 3, 2, # 4 wounds
                                                                2, 3, 4, 5)  # 2 failed invul saves
                
                result = sword_oi.melee(terminator)

                expect(result).to eq(4)
                expect(terminator.dead?).to be true  # Terminator is dead after taking 4 damage
            end
        end

        context 'Sword of idaeus vs terminator' do
            it 'Terminator makes all invulnerable saves' do
                allow(sword_oi).to receive(:rand).and_return(6, 5, 4, 3, 2, 1, # 5 hits
                                                                6, 5, 4, 1, 2, # 3 wounds
                                                                4, 6, 4, 5)  # 0 failed invul saves
                result = sword_oi.melee(terminator)

                expect(result).to eq(0)
                expect(terminator.wounds).to eq 3
            end
        end
    end
end