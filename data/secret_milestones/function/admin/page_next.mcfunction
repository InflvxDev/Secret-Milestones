# Interno: botón "Página siguiente >"
scoreboard players operation #v sm.calc = #p sm.calc
scoreboard players add #v sm.calc 1
scoreboard players operation #v sm.calc += #100000 sm.calc
data modify storage secret_milestones:tmp b set value {label:"Página siguiente >"}
execute store result storage secret_milestones:tmp b.v int 1 run scoreboard players get #v sm.calc
function secret_milestones:admin/page_button with storage secret_milestones:tmp b
