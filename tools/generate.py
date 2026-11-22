#!/usr/bin/env python3
"""Secret-Milestones - genera lo repetitivo de los hitos 2 y 3.

Hito 2 (Españita Chaos Bow): advancement/bow_kill.json y gen/bow_*, para la base
(26.3) y para el overlay de 26.4.
Hito 3 (Debris Finder): advancement/debris_place.json, gen/debris_* y gen/radar.
Uso: python tools/generate.py

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


# --- Hito 3: posición exacta del debris colocado
# placed_block evalúa con origen en el centro del bloque, así que la distancia al
# jugador en cada eje dice en qué franja [k, k+1) está. Quedan 8 bloques posibles
# (+ o - en cada eje) y debris_candidates prueba cuál es.
PLACE_REACH = 12
RADAR_RADIUS = 8


def generate_debris():
    base = os.path.join("data", NS)
    criteria, groups, hits = {}, [], [HEADER + "# En qué franja de cada eje quedó el bloque colocado\n"]
    for axis in "xyz":
        group = []
        for k in range(PLACE_REACH + 1):
            far = k == PLACE_REACH
            name = f"{axis}{k}"
            band = {"min": float(k)} if far else {"min": float(k), "max": k + 1 - 1e-9}
            criteria[name] = {
                "trigger": "minecraft:placed_block",
                "conditions": {
                    "location": {
                        "type": "minecraft:all_of",
                        "terms": [
                            {"type": "minecraft:match_block", "blocks": "minecraft:ancient_debris"},
                            {
                                "type": "minecraft:entity_properties",
                                "entity": "this",
                                "predicate": {"minecraft:distance": {axis: band}},
                            },
                        ],
                    }
                },
            }
            group.append(name)
            hits.append(
                f"execute if entity @s[advancements={{{NS}:debris_place={{{name}=true}}}}] "
                f'run function {NS}:milestone/debris_beacon/hit {{axis:"{axis}",o:"{k + 0.5 - 1e-6:.6f}",e:"{k + 0.5 + 1e-6:.6f}"}}\n'
            )
        groups.append(group)
    advancement = {
        "criteria": criteria,
        "requirements": groups,
        "rewards": {"function": f"{NS}:milestone/debris_beacon/on_place"},
    }
    write(os.path.join(base, "advancement", "debris_place.json"), json.dumps(advancement, indent=2) + "\n")
    write(os.path.join(base, "function", "gen", "debris_hits.mcfunction"), "".join(hits))

    # El predicate compara en float: a una millonésima del borde de una franja el bloque
    # puede ser el de al lado. Se prueba el punto normal y, solo si no, el del borde (xe, ye, ze).
    cand = [HEADER + "# Interno: {x, y, z, xe, ye, ze}. Los bloques donde pudo quedar, el más probable primero\n"]
    edges = sorted([(i, j, k) for i in (0, 1) for j in (0, 1) for k in (0, 1)], key=sum)
    for edge in edges:
        for sx in ("", "-"):
            for sy in ("", "-"):
                for sz in ("", "-"):
                    where = " ".join(
                        f"~{sign}$({axis}{'e' if e else ''})" for sign, axis, e in zip((sx, sy, sz), "xyz", edge)
                    )
                    cand.append(
                        f"$execute if score #found sm.calc matches 0 positioned {where} "
                        f"if block ~ ~ ~ minecraft:ancient_debris run function {NS}:milestone/debris_beacon/candidate\n"
                    )
    write(os.path.join(base, "function", "gen", "debris_candidates.mcfunction"), "".join(cand))

    around = [HEADER + "# Las 27 zonas alrededor del jugador, primero la suya\n"]
    zones = [(x, y, z) for x in (0, -1, 1) for y in (0, -1, 1) for z in (0, -1, 1)]
    for x, y, z in zones:
        around.append(
            f"execute if score #left sm.calc matches 1.. "
            f"run function {NS}:milestone/debris_beacon/scan {{x:{x},y:{y},z:{z}}}\n"
        )
    write(os.path.join(base, "function", "gen", "debris_around.mcfunction"), "".join(around))

    r = range(-RADAR_RADIUS, RADAR_RADIUS + 1)
    cells = [(x, y, z) for x in r for y in r for z in r if 0 < x * x + y * y + z * z <= RADAR_RADIUS ** 2]
    cells.sort(key=lambda c: (c[0] ** 2 + c[1] ** 2 + c[2] ** 2, abs(c[1]), c))
    radar = [HEADER + "# Del más cercano al más lejano: el primero que aparece es el más cercano\n"]
    for x, y, z in cells:
        parts = []
        for v, plus, minus in ((z, "al sur", "al norte"), (x, "al este", "al oeste"), (y, "arriba", "abajo")):
            if v:
                parts.append(f"{abs(v)} {plus if v > 0 else minus}")
        d = round((x * x + y * y + z * z) ** 0.5)
        radar.append(
            f"execute if block ~{x} ~{y} ~{z} minecraft:ancient_debris run return run "
            f'function {NS}:item/debris_finder/found {{x:{x},y:{y},z:{z},d:{d},t:"{" · ".join(parts)}"}}\n'
        )
    radar.append("return fail\n")
    write(os.path.join(base, "function", "gen", "radar.mcfunction"), "".join(radar))
    print(f"radar: {len(cells)} bloques")


generate_debris()
generate("", sorted(MOBS))
for directory, extra in OVERLAYS.items():
    generate(directory, sorted(MOBS + extra))
print(f"base: {len(MOBS)} mobs, " + ", ".join(f"{d}: {len(MOBS) + len(e)}" for d, e in OVERLAYS.items()))
