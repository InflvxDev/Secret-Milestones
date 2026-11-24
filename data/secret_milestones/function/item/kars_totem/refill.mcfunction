# Interno: recompensa del advancement kars_use. El Kars Totem salvó a @s y ya se gastó:
# vuelve a la misma mano (sm.khand dice cuál era, del principio de este tick).
# Si lo cambias, cambia también reward/kars_totem.
advancement revoke @s only secret_milestones:kars_use
execute if score @s sm.khand matches 1 unless items entity @s weapon.mainhand * run return run item replace entity @s weapon.mainhand with minecraft:totem_of_undying[minecraft:custom_name={text:"Kars Totem",color:"gold",italic:false},minecraft:lore=[{text:"I am the Ultimate Life Form",color:"light_purple",italic:true}],minecraft:enchantment_glint_override=true,minecraft:custom_data={secret_milestones:"kars_totem"}]
execute if score @s sm.khand matches 2 unless items entity @s weapon.offhand * run return run item replace entity @s weapon.offhand with minecraft:totem_of_undying[minecraft:custom_name={text:"Kars Totem",color:"gold",italic:false},minecraft:lore=[{text:"I am the Ultimate Life Form",color:"light_purple",italic:true}],minecraft:enchantment_glint_override=true,minecraft:custom_data={secret_milestones:"kars_totem"}]
function secret_milestones:reward/kars_totem
