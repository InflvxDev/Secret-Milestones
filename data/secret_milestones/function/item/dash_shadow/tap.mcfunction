# Interno: @s acaba de apretar el espacio. Si es el segundo dentro de la ventana, intenta el dash.
execute if score @s sm.dtap matches 1.. run return run function secret_milestones:item/dash_shadow/try
scoreboard players operation @s sm.dtap = #dash_window sm.calc
