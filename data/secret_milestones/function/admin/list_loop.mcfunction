# Interno: agrega el botón del hito #i y sigue (recursivo)
data modify storage secret_milestones:tmp b set value {}
execute store result storage secret_milestones:tmp b.i int 1 run scoreboard players get #i sm.calc
scoreboard players add #i sm.calc 1
scoreboard players operation #v sm.calc = #i sm.calc
scoreboard players operation #v sm.calc *= #10 sm.calc
execute store result storage secret_milestones:tmp b.v int 1 run scoreboard players get #v sm.calc
function secret_milestones:admin/list_button with storage secret_milestones:tmp b
execute if score #i sm.calc < #end sm.calc run function secret_milestones:admin/list_loop
