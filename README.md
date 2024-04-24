# 40k Arena 
A game that pits characters from the 40k universe in a fight to death

This game is inspired by Warhammer 40k tabletop game and more specifically the Mathhammer behind the game. Often it's hard to get an idea for how lethal or tough a model might be but finding out the killing impact a model can have can be very useful for your own army or knowing what you're going up against. There are some websites out there to find out the odds of wounds you can place on a specific model but they're all hard to use and not fun at all. So! why not make a game out of it! This project will start as a simple fun game to roll dice and see how many things one can kill next it'll involve into something useful for Warhammer tabletop players and from there it can evolve into a full on Warhammer x Pokemon crossover

 ## Iteration 1

 The game will feature one playable character: Uriel Ventris
 3 Different opponents: Termagant, Chaos Space Marine, Chaos Terminator

 Overview of how the game works:

 - Player will select opponent
 - Player melee's opponent
   - Dice roll to hit
   - Dice roll to wound
   - Behind the scenes: opponent makes saves

 The result is then displayed showing off how many wounds the player ditched out and how many enemy models were killed.

[How shooting works in 40k video](url=https://www.youtube.com/watch?v=P2ubmPDr_Ps)

<b>Hit roll:</b> 
In Warhammer 40k a model needs a successful dice roll in order to hit its intended target in range or melee. Accuracy is determined by a models Ballistic Skill (BS) for ranged weapons and Weapons Skill (WS) in melee

ie: 
- A Space Marine with a boltgun and a BS of 3+ needs to roll a 3,4,5,6 in order to hit his desired target
- An ork with a BS of 5+ needs a 5 or better
note: a dice roll of "6" is known as a critical hit

<b>Wound Roll:</b>
In order for a hit to wound we compare the weapons Strength (S) characteristics vs the targets Toughness (T)
- If Strength is double the Toughness a roll of 2 or better is need to wound
- If Strength is greater a 3+ is needed
- If S = T a 4+ is needed
- If S is less than but greater than half T a 5+ is needed
- If S is less than half a 6 is needed

ie: a Space Marine with a boltgun (S4) shoots and Ork (T5). The Space marine player will need to roll a 5 or better to wound the ork after its been hit
Note: a dice roll of "6" is known as a critical wound

<b>Save Roll</b>
War in 41 millennium is brutal, to say the least so wearing a vest is a minimum requirement
Once a hit roll is scored, a wound roll is successful the targeted model can have its armor save it by rolling a save roll denoted by the model's save characteristic (Sv+). This characteristic will be directly affected by a weapons' Armor Penetration rating (AP)

ie: 
- A Space Marine with a Heavy Boltgun wounds an Ork, the gun has AP-1 and the ork a base save of 5+. This means the ork player will need a dice roll of a 6 in order to save the shot otherwise it will lose a wound
- A plasma gun with AP-3 in the sane scenario would go staright through and the ork player would not have a chance for a save
Invulnerable saves: some armors are especially tough or magic-y so they have an invulnerable save, this ignores AP

## Iteration 2
- Multiple playable characters
- Expand list of enemies
- Implement
 - Strategemes
 - Faction Rules
 - Detachement rules

## Iteration 3

 Let's turn things up
 - Connect to 40k API to get a full list of playable and enemy characters
 - Round will now involve the enemy fighting back
 - Player can choose if he fights first or now
 - Explore units as playable and units enemey
 - Distance between two models can now come into play
   - Player needs to roll a successful dice roll in order to melee
