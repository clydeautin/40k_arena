require './spec/spec_helper'


RSpec.describe Ranged_weapon do
    let(:heavy_bolt_rifle) { Ranged_weapon.new('Heavy Boltgun', 24, 2, 3, 4, 1, 1) }
    let(:plasma_pistol) { Ranged_weapon.new('Plasma Gun', 12, 1, 3, 7, 2, 1) }
    let(:bolt_p2) { Ranged_weapon.new('Bolt Pistol', 12, 1, 2, 4, 0, 1, 'Pistol') }
    let(:cultist) {Model.new('Cultist Mob', 6, 3, 6, 1, 7, 1, nil)}
    let(:terminator) {Model.new('Terminator', 5, 5, 2, 3, 6, 1, 4)}

    describe '#initialize' do
        it 'is an instance of Ranged_weapon' do
            bolt_p2 = Ranged_weapon.new('Bolt Pistol', 12, 1, 2, 4, 0, 1, 'Pistol')

            expect(bolt_p2).to be_an_instance_of Ranged_weapon
        end
    end

    describe '#shoot' do
        context 'using Heavy Boltgun against Cultist' do
            it 'applies at least one wound to the Cultist' do
                # Stub rand to ensure hits and wounds
                allow(heavy_bolt_rifle).to receive(:rand).and_return(4, 4, 
                                                                    5, 5)  # Successful hit and wound rolls

                # Execute the shoot method
                result = heavy_bolt_rifle.shoot(cultist)

                # Check the resulting wounds after being shot
                expect(result).to eq(2)
                expect(cultist.dead?).to be true 
            end
        end

        context 'using Bolt Pistol against Cultist' do
            it 'fails to wound the Cultist' do
                allow(bolt_p2).to receive(:rand).and_return(3, 2, 6)  # Hit but fail to wound
                
                expect(bolt_p2.shoot(cultist)).to eq(0)
                expect(cultist.wounds).to be 1
            end
        end

        context 'Plasma Pistol overkills Cultist' do
            it 'kills the Cultist' do
                allow(plasma_pistol).to receive(:rand).and_return(6, 5)  # Successful hit and wound
                plasma_pistol.shoot(cultist)
                expect(cultist.dead?).to be true  # Cultist is dead after taking a wound
            end
        end

        context 'Heavy Boltgun shoots twice at Terminator' do
            it 'applies two wounds to the Terminator' do
                allow(heavy_bolt_rifle).to receive(:rand).and_return(6, 6, 5, 4, 2)  # Successful hits and wounds, Terminator fails to save
                
                expect(heavy_bolt_rifle.shoot(terminator)).to eq(1)
                expect(terminator.wounds).to eq 2
            end
        end
    end
end