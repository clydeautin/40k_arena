class Game

    def initialize
        @uriel_v = Model.new('Uriel Ventris', 6, 4, 3, 5, 6, 1, 4)
        @cultist = Model.new('Cultist Mob', 6, 3, 6, 1, 7, 1, nil)
        @terminator = Model.new('Terminator', 5, 5, 2, 3, 6, 1, 4)
        @sword_oi = Melee_weapon.new('Sword of Idaeus', 6, 2, 6, 2, 2, 'Sustained Hits 1')
        
        @uriel_v.add_melee_weapon(@sword_oi)
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
        puts 'Enter P to play. Enter Q to quit'

        start_answer = gets.chomp.upcase
        case start_answer
        when 'P'
            play
        when 'Q'
            puts "Thanks for playing!"
        else
            puts "Invalid input. Exiting game."
        end
    end

    def play
        puts "Pick your opponent: Enter A for Cultist or B for Chaos Terminator"
        opponent_answer = gets.chomp.upcase

        case opponent_answer
        when 'A'
            cultist_battle
        when 'B'
            terminator_battle
        else
            puts "Invalid choice. Exiting battle setup."
        end
    end

    def cultist_battle
        puts 'You are fighting a chaos cultist, enter A to start the battle and roll to hit'

        player_attack = gets.chomp.upcase
        if player_attack == 'A'
            hit_result = @uriel_v.melee_weapons[0].attack(@cultist) # need to find a way to call the exact weapon on the melee_weapon array
            puts "You landed #{hit_result} wounds on the cultist"
        else
            puts "Invalid choice. Exiting battle setup."
        end
    end
    def terminator_battle
        puts 'You are fighting a chaos Terminator, enter A to start the battle and roll to hit'

        player_attack = gets.chomp.upcase
        if player_attack == 'A'
            hit_result = @uriel_v.melee_weapons[0].attack(@terminator) # need to find a way to call the exact weapon on the melee_weapon array
            puts "You landed #{hit_result} wounds on the terminator"
        else
            puts "Invalid choice. Exiting battle setup."
        end
    end
end