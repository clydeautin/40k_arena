class Gem

    def initialize
        @uriel_v = Model.new('Uriel Ventris', 6, 4, 3, 5, 6, 1, 4)
        @cultist = Model.new('Cultist Mob', 6, 3, 6, 1, 7, 1, nil)
        @terminator = Model.new('Terminator', 5, 5, 2, 3, 6, 1, 4)
        @sword_oi = Melee_weapon.new('Sword of Idaeus', 6, 2, 6, 2, 2, 'Sustained Hits 1')
    end

# Welcome to 40k Arena you will be fighting as Uriel Ventris against the enemies of the imperium
# Pick your opponent A = Cultist, B = Terminator
# You are fighting (A or B) press enter to roll the dice
# you landed x hit rolls
# press enter to wound
# you landed x wound rolls
# press enter to see results
# The ( A or B) took x wounds they are (dead/alive with x wounds remaining)
# play again?

    def start
        puts "Welcome to 40k Arena you will be fighting as Uriel Ventris against the enemies of the imperium"
        puts 'Enter p to play. Enter q to quit'

        start_answer = gets.chomp
        if start_answer == 'p'
            play
        elsif start_answer == 'q'
            puts "Thanks for playing!"
        end
    end

    
end