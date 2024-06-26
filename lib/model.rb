class Model

    attr_reader :name,
                :movement,
                :toughness,
                :save,
                :invul_save,
                :wounds,
                :leadership,
                :objective_control,
                :abilities,
                :melee_weapons,
                :ranged_weapons

    def initialize(name, m, t, sv, w, ld, oc, inv_sv = nil, abilities = nil)
        @name = name
        @movement = m
        @toughness = t
        @save = sv
        @invul_save = inv_sv # this might be tricky for models that dont have an invul
        @wounds = w
        @leadership = ld
        @objective_control = oc
        @abilities = abilities
        @melee_weapons = []
        @ranged_weapons = []
    end

    def wound
        @wounds -= 1
    end

    def dead?
        @wounds <= 0
    end

    def add_ranged_weapon(r_weapon)
        @ranged_weapons << r_weapon
    end
    def add_melee_weapon(m_weapon)
        @melee_weapons << m_weapon
    end
end