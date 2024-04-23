class Melee_weapon
    
        attr_reader :name,
                    :attacks,
                    :bs,
                    :strength,
                    :ap,
                    :damage,
                    :abilities
        
    def initialize(name, attacks, bs, strength, ap, damage, abilities=nil)
        @name = name
        @attacks = attacks
        @bs = bs
        @strength = strength
        @ap = ap
        @damage = damage
        @abilities = []
    end

end