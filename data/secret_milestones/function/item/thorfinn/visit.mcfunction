# Interno: @s es un marker de la ola actual, en su cultivo. Lo corta si está maduro y sigue a los de al lado,
# hasta #harvest_reach bloques del primero (cada ola es un bloque más lejos).
tag @s remove sm.hq
function secret_milestones:gen/harvest_cut
execute if score @s sm.hg >= #harvest_reach sm.calc run return 0
scoreboard players operation #gen sm.calc = @s sm.hg
scoreboard players add #gen sm.calc 1
function secret_milestones:gen/harvest_spread
