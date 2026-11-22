#!/usr/bin/env python3
"""Secret-Milestones - genera la lista de mobs del hito 2 (Españita Chaos Bow).

Escribe advancement/bow_kill.json y function/gen/*, para la base (26.3) y para
el overlay de 26.4. Uso: python tools/generate.py

Casos especiales:
  enderman           solo recibe flechas montado (bote, vagoneta): regla normal
  breeze, wither     inmunes a flechas: se rematan a golpes con el arco (MELEE)

No entran (con ellos el hito sería imposible en survival):
  creaking           el natural solo muere al romper su corazón
  giant, illusioner  no aparecen en survival
"""
import json
import os

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
NS = "secret_milestones"

MOBS = """
allay armadillo axolotl bat bee blaze bogged breeze camel camel_husk cat cave_spider
chicken cod copper_golem cow creeper dolphin donkey drowned elder_guardian
ender_dragon enderman endermite evoker fox frog ghast glow_squid goat guardian
happy_ghast hoglin horse husk iron_golem llama magma_cube mooshroom mule
nautilus ocelot panda parched parrot phantom pig piglin piglin_brute pillager
polar_bear pufferfish rabbit ravager salmon sheep shulker silverfish skeleton
skeleton_horse slime sniffer snow_golem spider squid stray strider sulfur_cube
tadpole trader_llama tropical_fish turtle vex villager vindicator
wandering_trader warden witch wither wither_skeleton wolf zoglin zombie zombie_horse
zombie_nautilus zombie_villager zombified_piglin
""".split()

# Solo estos se rematan con un golpe directo, con el arco en la mano principal
MELEE = {"breeze", "wither"}

# Carpeta del overlay (ver pack.mcmeta) -> mobs que agrega esa versión
OVERLAYS = {"overlay_26_4": ["frostbite"]}

HEADER = "# GENERADO por tools/generate.py: no editar a mano\n"


def is_type(mob):
    return {
        "type": "minecraft:entity_properties",
        "entity": "this",
        "predicate": {"minecraft:entity_type": "minecraft:" + mob},
    }


def criterion(mob):
    if mob in MELEE:
        return {
            "trigger": "minecraft:player_killed_entity",
            "conditions": {
                "entity": is_type(mob),
                "killing_blow": {
                    # Este tag deja fuera Espinas, que también es daño directo del jugador
                    "tags": [{"id": "#minecraft:is_player_attack", "expected": True}],
                    "direct_entity": {
                        "minecraft:entity_type": "minecraft:player",
                        "minecraft:equipment": {"mainhand": {"items": "minecraft:bow"}},
                    },
                },
            },
        }
    if mob == "ender_dragon":
        # La flecha le da a una parte del dragón y killed_by_arrow no salta:
        # se mira el golpe final y el arma guardada en la flecha.
        return {
            "trigger": "minecraft:player_killed_entity",
            "conditions": {
                "entity": is_type(mob),
                "killing_blow": {
                    "tags": [{"id": "#minecraft:is_projectile", "expected": True}],
                    "source_entity": {"minecraft:entity_type": "minecraft:player"},
                    "direct_entity": {
                        "minecraft:entity_type": "#minecraft:arrows",
                        "minecraft:nbt": '{weapon:{id:"minecraft:bow"}}',
                    },
                },
            },
        }
    # Solo salta si la flecha dio el golpe final, y revisa el arma antes que el mob
    return {
        "trigger": "minecraft:killed_by_arrow",
        "conditions": {
            "fired_from_weapon": {"items": "minecraft:bow"},
            "victims": [is_type(mob)],
        },
    }


def write(path, text):
    path = os.path.join(ROOT, path)
    os.makedirs(os.path.dirname(path), exist_ok=True)
    with open(path, "w", encoding="utf-8", newline="\n") as f:
        f.write(text)


def generate(folder, mobs):
    base = os.path.join(folder, "data", NS)
    # Sin display: no sale aviso ni aparece en la pantalla de logros.
    # Con un solo mob basta para completarlo; on_kill lo anota y lo revoca.
    advancement = {
        "criteria": {m: criterion(m) for m in mobs},
        "requirements": [mobs],
        "rewards": {"function": f"{NS}:milestone/bow_all/on_kill"},
    }
    write(os.path.join(base, "advancement", "bow_kill.json"), json.dumps(advancement, indent=2) + "\n")

    hits = [HEADER + "# Qué mob completó el advancement\n"]
    for m in mobs:
        hits.append(
            f"execute if entity @s[advancements={{{NS}:bow_kill={{{m}=true}}}}] "
            f'run function {NS}:milestone/bow_all/hit {{m:"{m}"}}\n'
        )
    write(os.path.join(base, "function", "gen", "bow_hits.mcfunction"), "".join(hits))
    write(
        os.path.join(base, "function", "gen", "bow_goal.mcfunction"),
        HEADER + f"scoreboard players set #bow_goal sm.calc {len(mobs)}\n",
    )


generate("", sorted(MOBS))
for directory, extra in OVERLAYS.items():
    generate(directory, sorted(MOBS + extra))
print(f"base: {len(MOBS)} mobs, " + ", ".join(f"{d}: {len(MOBS) + len(e)}" for d, e in OVERLAYS.items()))
