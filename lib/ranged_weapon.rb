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
            saved_wounds = armore_saves(wounds, target)
            final_wounds = wounds - saved_wounds

            final_wounds.times { target.wound }
            return final_wounds 
        else
            return 0
        end
    end

    def wound_roll(hits)
        hits.times.map { rand(1..6) }
    end

    def wound_roll(hits)
        wound_needed = wound_check(target)
        wound_rolls.count do |roll|
            roll >= wound_needed
        end
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
        saves_required = [target.save + @ap, target.invul_save].compact.min
        wounds.times.count { rand(1..6) >= saves_required }
    end
end