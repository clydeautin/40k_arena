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
end