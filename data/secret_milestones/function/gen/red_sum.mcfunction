# GENERADO por tools/generate.py: no editar a mano
# Interno: {id}. Total para el panel (cada componente cuenta hasta la meta)
scoreboard players set #s sm.calc 0
$execute store result score #a sm.calc run data get storage secret_milestones:redstone p$(id).repeater
scoreboard players operation #s sm.calc += #a sm.calc
$execute store result score #a sm.calc run data get storage secret_milestones:redstone p$(id).comparator
scoreboard players operation #s sm.calc += #a sm.calc
$execute store result score #a sm.calc run data get storage secret_milestones:redstone p$(id).piston
scoreboard players operation #s sm.calc += #a sm.calc
$execute store result score #a sm.calc run data get storage secret_milestones:redstone p$(id).sticky_piston
scoreboard players operation #s sm.calc += #a sm.calc
$execute store result score #a sm.calc run data get storage secret_milestones:redstone p$(id).observer
scoreboard players operation #s sm.calc += #a sm.calc
$execute store result score #a sm.calc run data get storage secret_milestones:redstone p$(id).dispenser
scoreboard players operation #s sm.calc += #a sm.calc
$execute store result score #a sm.calc run data get storage secret_milestones:redstone p$(id).dropper
scoreboard players operation #s sm.calc += #a sm.calc
$execute store result score #a sm.calc run data get storage secret_milestones:redstone p$(id).hopper
scoreboard players operation #s sm.calc += #a sm.calc
$execute store result score #a sm.calc run data get storage secret_milestones:redstone p$(id).redstone_torch
scoreboard players operation #s sm.calc += #a sm.calc
$execute store result score #a sm.calc run data get storage secret_milestones:redstone p$(id).redstone_lamp
scoreboard players operation #s sm.calc += #a sm.calc
$execute store result score #a sm.calc run data get storage secret_milestones:redstone p$(id).lever
scoreboard players operation #s sm.calc += #a sm.calc
$execute store result score #a sm.calc run data get storage secret_milestones:redstone p$(id).target
scoreboard players operation #s sm.calc += #a sm.calc
$execute store result score #a sm.calc run data get storage secret_milestones:redstone p$(id).daylight_detector
scoreboard players operation #s sm.calc += #a sm.calc
$execute store result score #a sm.calc run data get storage secret_milestones:redstone p$(id).tripwire_hook
scoreboard players operation #s sm.calc += #a sm.calc
$execute store result score #a sm.calc run data get storage secret_milestones:redstone p$(id).note_block
scoreboard players operation #s sm.calc += #a sm.calc
$execute store result score #a sm.calc run data get storage secret_milestones:redstone p$(id).crafter
scoreboard players operation #s sm.calc += #a sm.calc
scoreboard players set #red_total sm.calc 16000
