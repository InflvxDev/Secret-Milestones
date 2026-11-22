# Registro de hitos: el panel se arma solo con esta lista (un hito = un bloque, sin tocar admin/).
#   id     = carpeta en function/milestone/ (necesita complete y progress)
#   reward = función en function/reward/
#   item   = vista previa, igual a lo que da reward
#   sprite = ícono del botón (atlas de ítems)
#   goal   = condición en una línea, rules = la letra chica
data modify storage secret_milestones:db milestones set value []

data modify storage secret_milestones:db milestones append value {id:"stone_1m",reward:"chunk_destroyer",name:"Chunk Destroyer Infinitum",color:"red",sprite:"item/netherite_pickaxe",goal:"Minar 1.000.000 de piedra",rules:"Cada zona de 16x16x16 cuenta hasta 5500. Mucho fuera de cupo suele ser un generador.",item:{id:"minecraft:netherite_pickaxe",components:{"minecraft:custom_name":{text:"Chunk Destroyer Infinitum",color:"red",italic:false},"minecraft:enchantments":{"minecraft:efficiency":10,"minecraft:silk_touch":1},"minecraft:unbreakable":{}}}}

data modify storage secret_milestones:db milestones append value {id:"bow_all",reward:"chaos_bow",name:"Españita Chaos Bow",color:"dark_purple",sprite:"item/bow",goal:"Matar con arco a todo tipo de mobs",rules:"Enderman: con flecha y montado. Breeze y Wither: último golpe con el arco en la mano. No entran Creaking, Giant ni Illusioner.",item:{id:"minecraft:bow",components:{"minecraft:custom_name":{text:"Españita Chaos Bow",color:"dark_purple",italic:false},"minecraft:enchantments":{"minecraft:power":5,"minecraft:unbreaking":3,"minecraft:infinity":1,"minecraft:mending":1}}}}
