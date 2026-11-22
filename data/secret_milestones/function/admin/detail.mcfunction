# Interno: detalle del hito tmp m, posición #i. Si hay un mensaje en tmp status, sale arriba.
scoreboard players operation #v sm.calc = #i sm.calc
scoreboard players add #v sm.calc 1
scoreboard players operation #v sm.calc *= #10 sm.calc
data modify storage secret_milestones:tmp b set value {}
execute store result storage secret_milestones:tmp b.get int 1 run scoreboard players add #v sm.calc 1
execute store result storage secret_milestones:tmp b.test int 1 run scoreboard players add #v sm.calc 1
execute store result storage secret_milestones:tmp b.progress int 1 run scoreboard players add #v sm.calc 1
# Volver regresa a la página donde está este hito
scoreboard players operation #v sm.calc = #i sm.calc
scoreboard players operation #v sm.calc /= #page sm.calc
scoreboard players operation #v sm.calc += #100000 sm.calc
execute store result storage secret_milestones:tmp b.back int 1 run scoreboard players get #v sm.calc
function secret_milestones:admin/detail_ui with storage secret_milestones:tmp b

data modify storage secret_milestones:tmp ui.title.text set from storage secret_milestones:tmp m.name
data modify storage secret_milestones:tmp ui.title.color set from storage secret_milestones:tmp m.color
data modify storage secret_milestones:tmp ui.body[0].item set from storage secret_milestones:tmp m.item
data modify storage secret_milestones:tmp ui.body[0].description.contents.text set from storage secret_milestones:tmp m.goal
data modify storage secret_milestones:tmp ui.body[1].contents.text set from storage secret_milestones:tmp m.rules
execute if data storage secret_milestones:tmp status run data modify storage secret_milestones:tmp ui.body prepend value {type:"minecraft:plain_message",width:310,contents:""}
execute if data storage secret_milestones:tmp status run data modify storage secret_milestones:tmp ui.body[0].contents set from storage secret_milestones:tmp status
data remove storage secret_milestones:tmp status
function secret_milestones:admin/show with storage secret_milestones:tmp
