# Interno: cada tick, para quien tiene el Woodozer en la mano (sin agacharse), desde sus ojos.
# Anota con un marker el tronco al que apunta: si al tick siguiente lo rompió, de ahí sale la tala.
scoreboard players operation #me sm.calc = @s sm.id
scoreboard players set #ray sm.calc 0
function secret_milestones:item/woodozer/ray
