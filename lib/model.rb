class Model

    attr_reader :name,
                :tougness,
                :save,
                :invul_save,
                :wounds,
                :leadership,
                :objective_control,
                :abilities

    def initialize(name, t, sv, inv_sv, w, ld, oc, abilities = nil)
        @name = name
        @toughness = t
        @save = sv
        @invul_save = inv_sv
        @wounds = w
        @leadership = ld
        @objective_control = oc
        @abilities = abilities
    end
end