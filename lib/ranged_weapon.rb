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

    def shoot(target)
        hits = 0
        @attacks.times do
            roll = rand(1..6)  # Simulate a d6 roll
            hits += 1 if roll > @bs
        end
        if hits > 0
            wound_rolls = wound_roll(hits)
            wounds = check_wounds(wound_rolls, target)
            saved_wounds = armor_saves(wounds, target)
            final_wounds = wounds - saved_wounds
            
            final_wounds.times { target.wound }

            return final_wounds 
        else
            return 0
        end
    end

    def check_wounds(wound_rolls, target)
        wound_needed = wound_check(target)
        wound_rolls.count { |roll| roll >= wound_needed }
    end

    def wound_roll(hits)
        hits.times.map { rand(1..6) }
    end

    def wound_check(target)
        if @strength >= target.toughness * 2
            return 2
        elsif @strength > target.toughness
            return 3
        elsif @strength == target.toughness
            return 4
        elsif @strength >= target.toughness / 2
            return 5
        else
            return 6
        end
    end

    def armor_saves(wounds, target)
        modified_save = target.save + @ap
        # Determine the best save option: use invulnerable save if it's lower than the modified armor save
        # and the modified save is above 1, otherwise use the modified save if it's 2 or better.
        best_save = if target.invul_save && (target.invul_save < modified_save || modified_save > 6)
                        target.invul_save
                    else
                        [modified_save, 7].min # Ensures the save cannot be worse than 6+
                    end
        # If the best save required is greater than 6, then no save roll can succeed.
        if best_save > 6
            return 0  # All wounds are effective, as saves are impossible
        else
            # Count how many wounds are saved based on the best save option available
            wounds.times.count { rand(1..6) >= best_save }
        end
    end
end