# Interno: {b}. Cambia el bloque por su versión girada sin perder lo que tiene adentro.
# setblock vacía los contenedores: se copia su contenido antes y se devuelve después.
data remove storage secret_milestones:tmp be
data modify storage secret_milestones:tmp be set from block ~ ~ ~
$setblock ~ ~ ~ $(b)
execute if data storage secret_milestones:tmp be.Items run data modify block ~ ~ ~ Items set from storage secret_milestones:tmp be.Items
execute if data storage secret_milestones:tmp be.CustomName run data modify block ~ ~ ~ CustomName set from storage secret_milestones:tmp be.CustomName
execute if data storage secret_milestones:tmp be.lock run data modify block ~ ~ ~ lock set from storage secret_milestones:tmp be.lock
execute if data storage secret_milestones:tmp be.components run data modify block ~ ~ ~ components set from storage secret_milestones:tmp be.components
execute if data storage secret_milestones:tmp be.LootTable run data modify block ~ ~ ~ LootTable set from storage secret_milestones:tmp be.LootTable
execute if data storage secret_milestones:tmp be.LootTableSeed run data modify block ~ ~ ~ LootTableSeed set from storage secret_milestones:tmp be.LootTableSeed
execute if data storage secret_milestones:tmp be.TransferCooldown run data modify block ~ ~ ~ TransferCooldown set from storage secret_milestones:tmp be.TransferCooldown
execute if data storage secret_milestones:tmp be.OutputSignal run data modify block ~ ~ ~ OutputSignal set from storage secret_milestones:tmp be.OutputSignal
data remove storage secret_milestones:tmp be
playsound minecraft:block.lever.click block @a ~ ~ ~ 0.5 1.6
particle minecraft:dust{color:[1.0,0.1,0.1],scale:0.8} ~ ~ ~ 0.3 0.3 0.3 0 8
return 1
