class Melee_weapon
    
        attr_reader :name,
                    :attacks,
                    :ws,
                    :strength,
                    :ap,
                    :damage,
                    :abilities
        
    def initialize(name, attacks, ws, strength, ap, damage, abilities=nil)
        @name = name
        @attacks = attacks
        @ws= ws
        @strength = strength
        @ap = ap
        @damage = damage
        @abilities = abilities || []
    end
    def attack(target)
        hits = roll_to_hit
        wounds = roll_to_wound(hits, target)
        final_wounds = apply_saves(wounds, target)
        apply_damage(final_wounds, target)
    end

    # Roll to hit based on weapon skill
    def roll_to_hit
        (1..@attacks).count do
            roll = rand(1..6)
            roll >= @ws
        end
    end

    # Roll to wound the target based on hits achieved
    def roll_to_wound(hits, target)
        hits.times.count do
            roll = rand(1..6)
            roll >= wound_check(target)
        end
    end

    # Check wound necessity based on target's toughness
    def wound_check(target)
        if @strength >= target.toughness * 2
            2
        elsif @strength > target.toughness
            3
        elsif @strength == target.toughness
            4
        elsif @strength >= target.toughness / 2
            5
        else
            6
        end
    end

    # Apply armor saves to reduce the number of effective wounds
    def apply_saves(wounds, target)
        best_save = calculate_best_save(target)
        wounds - wounds.times.count { rand(1..6) >= best_save }
    end

    # Calculate the best save possible, considering invulnerable saves
    def calculate_best_save(target)
        modified_save = target.save + @ap
        [target.invul_save, modified_save].compact.min
    end

    # Apply damage based on the final number of wounds that were not saved
    def apply_damage(final_wounds, target)
        damage_dealt = final_wounds * @damage
        damage_dealt.times { target.wound }
        damage_dealt

    end
end