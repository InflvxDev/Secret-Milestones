# Interno: progreso del hito tmp m de todos los jugadores, también los desconectados.
# Lo que dice cada fila lo pone milestone/<id>/progress.
scoreboard players operation #v sm.calc = #i sm.calc
scoreboard players add #v sm.calc 1
scoreboard players operation #v sm.calc *= #10 sm.calc
data modify storage secret_milestones:tmp b set value {}
execute store result storage secret_milestones:tmp b.back int 1 run scoreboard players get #v sm.calc
execute store result storage secret_milestones:tmp b.refresh int 1 run scoreboard players add #v sm.calc 3
function secret_milestones:admin/progress_ui with storage secret_milestones:tmp b
data modify storage secret_milestones:tmp ui.title.text set from storage secret_milestones:tmp m.name
data modify storage secret_milestones:tmp ui.title.color set from storage secret_milestones:tmp m.color
data modify storage secret_milestones:tmp ui.body[0].contents.text set from storage secret_milestones:tmp m.goal

data modify storage secret_milestones:tmp queue set from storage secret_milestones:players list
execute if data storage secret_milestones:tmp queue[0] run function secret_milestones:admin/progress_loop
execute unless data storage secret_milestones:tmp ui.body[1] run data modify storage secret_milestones:tmp ui.body append value {type:"minecraft:plain_message",contents:{text:"Todavía no hay jugadores registrados.",color:"gray",italic:true}}
function secret_milestones:admin/show with storage secret_milestones:tmp
