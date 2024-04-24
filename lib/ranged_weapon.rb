class Ranged_weapon

    attr_reader :name,
                :range,
                :attacks,
                :bs,
                :strength,
                :ap,
                :damage,
                :abilities
                
    def initialize(name, range, attacks, bs, strength, ap, damage, abilities=nil)
        @name = name
        @range = range
        @attacks = attacks
        @bs = bs
        @strength = strength
        @ap = ap
        @damage = damage
        @abilities = []
    end

    def shoot
        hits = 0
        @attacks.times do
            roll = rand(1..6)  # Simulate a d6 roll
            its += 1 if roll > @bs
        end
        hits
    end
end