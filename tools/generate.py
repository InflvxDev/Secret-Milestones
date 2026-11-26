#!/usr/bin/env python3
"""Secret-Milestones - genera lo repetitivo de los hitos 2, 3, 6, 8, 9, 10, 11, 12 y 14.

Hito 2 (Españita Chaos Bow): advancement/bow_kill.json y gen/bow_*, para la base
(26.3) y para el overlay de 26.4.
Hito 3 (Debris Finder): advancement/debris_place.json, gen/debris_* y gen/radar.
Hito 6 (RedKeyStone): gen/red_* (lista de componentes y qué gira la llave).
Hito 8 (Woodozer): gen/log_*, gen/fell_start y gen/fell/ (tipos de tronco y la tala).
Hito 9 (DeepMine Crown): gen/deep_* (bloques, metas y la fila del panel).
Hito 10 (Terra Magnet): gen/soil_* y tags/item/soil.json (bloques blandos y lo que atrae).
Hito 11 (Dash Shadow): enchantment/dash.json (el empuje del dash en cada dirección).
Hito 12 (Aegis Heart): advancement/hurt_*, gen/hurt_* y tags/entity_type/ (tramos de daño y atacantes).
Hito 14 (Thorfinn Harvest): gen/harvest_*, tags/block/harvest_* y tags/item/harvest_* (cultivos, metas y la cadena).
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


# --- Hito 6: craftear 1000 de cada componente de redstone, y la llave RedKeyStone
# Sin el bloque de redstone: se craftea y descraftea en bucle con solo 9 de redstone.
# El crafter (bloque) no suma: no hay jugador que craftee.
RED_ITEMS = """
repeater comparator piston sticky_piston observer dispenser dropper hopper
redstone_torch redstone_lamp lever target daylight_detector tripwire_hook note_block crafter
""".split()
RED_GOAL = 1000

# La llave gira al siguiente valor de facing y deja igual los demás estados
SIX = ["north", "east", "south", "west", "up", "down"]
FOUR = ["north", "east", "south", "west"]
HOPPER = ["down", "north", "east", "south", "west"]
BOOL = ["false", "true"]
ROTATE = {
    "repeater": (FOUR, {"delay": ["1", "2", "3", "4"], "locked": BOOL, "powered": BOOL}),
    "comparator": (FOUR, {"mode": ["compare", "subtract"], "powered": BOOL}),
    # Extendido no: la cabeza quedaría suelta
    "piston": (SIX, {"extended": ["false"]}),
    "sticky_piston": (SIX, {"extended": ["false"]}),
    "observer": (SIX, {"powered": BOOL}),
    "dispenser": (SIX, {"triggered": BOOL}),
    "dropper": (SIX, {"triggered": BOOL}),
    "hopper": (HOPPER, {"enabled": BOOL}),
}


def generate_redstone():
    import itertools

    fn = os.path.join("data", NS, "function", "gen")
    write(
        os.path.join(fn, "red_load.mcfunction"),
        HEADER + "# Lo crafteado de cada componente desde el último segundo\n"
        + "".join(f"scoreboard objectives add sm.r.{i} minecraft.crafted:minecraft.{i}\n" for i in RED_ITEMS)
        + f"scoreboard players set #red_goal sm.calc {len(RED_ITEMS)}\n",
    )
    write(
        os.path.join(fn, "red_uninstall.mcfunction"),
        HEADER + "".join(f"scoreboard objectives remove sm.r.{i}\n" for i in RED_ITEMS),
    )
    write(
        os.path.join(fn, "red_discard.mcfunction"),
        HEADER + "# En creativo no suma\n" + "".join(f"scoreboard players reset @s sm.r.{i}\n" for i in RED_ITEMS),
    )
    write(
        os.path.join(fn, "red_tally.mcfunction"),
        HEADER + "# Interno: {id}. Suma lo crafteado de cada componente\n"
        + "".join(
            f"$execute if score @s sm.r.{i} matches 1.. run function {NS}:milestone/redstone_1000/add "
            f'{{id:$(id),k:"{i}"}}\n'
            for i in RED_ITEMS
        ),
    )
    write(
        os.path.join(fn, "red_sum.mcfunction"),
        HEADER + "# Interno: {id}. Total para el panel (cada componente cuenta hasta la meta)\n"
        + "scoreboard players set #s sm.calc 0\n"
        + "".join(
            f"$execute store result score #a sm.calc run data get storage {NS}:redstone p$(id).{i}\n"
            "scoreboard players operation #s sm.calc += #a sm.calc\n"
            for i in RED_ITEMS
        )
        + f"scoreboard players set #red_total sm.calc {RED_GOAL * len(RED_ITEMS)}\n",
    )

    rot = [HEADER + "# Interno: gira el bloque de esta posición. Falla si no se puede girar\n"]
    for block, (facings, others) in ROTATE.items():
        rot.append(f"execute if block ~ ~ ~ minecraft:{block} run return run function {NS}:gen/red_rotate/{block}\n")
        lines = [HEADER]
        keys = list(others)
        for combo in itertools.product(*(others[k] for k in keys)):
            rest = "".join(f",{k}={v}" for k, v in zip(keys, combo))
            for n, f in enumerate(facings):
                nxt = facings[(n + 1) % len(facings)]
                lines.append(
                    f"execute if block ~ ~ ~ minecraft:{block}[facing={f}{rest}] run return run "
                    f'function {NS}:item/red_power/set {{b:"minecraft:{block}[facing={nxt}{rest}]"}}\n'
                )
        lines.append("return fail\n")
        write(os.path.join(fn, "red_rotate", f"{block}.mcfunction"), "".join(lines))
    rot.append("return fail\n")
    write(os.path.join(fn, "red_rotate.mcfunction"), "".join(rot))
    print(f"redstone: {len(RED_ITEMS)} componentes, {len(ROTATE)} bloques que gira la llave")


# --- Hito 8: talar 100.000 troncos, y el Woodozer que tala el árbol entero
# Solo troncos y tallos de árbol: la madera (6 caras) y los pelados no salen en árboles naturales.
LOGS = """
oak_log spruce_log birch_log jungle_log acacia_log dark_oak_log mangrove_log
cherry_log pale_oak_log crimson_stem warped_stem
""".split()
# Lo que dice que es un árbol y no una construcción: hojas naturales, o la copa de los hongos del Nether
FOLIAGE = {"crimson_stem": "#secret_milestones:fungus_cap", "warped_stem": "#secret_milestones:fungus_cap"}
LEAVES = "#minecraft:leaves[persistent=false]"
# Los troncos de un árbol se tocan también en diagonal (ramas de acacia y jungla)
AROUND = sorted(
    [(x, y, z) for x in (-1, 0, 1) for y in (-1, 0, 1) for z in (-1, 0, 1) if (x, y, z) != (0, 0, 0)],
    key=lambda c: (-c[1], abs(c[0]) + abs(c[2])),
)
FACES = [(1, 0, 0), (-1, 0, 0), (0, 1, 0), (0, -1, 0), (0, 0, 1), (0, 0, -1)]


def generate_logs():
    fn = os.path.join("data", NS, "function", "gen")
    write(
        os.path.join(fn, "log_load.mcfunction"),
        HEADER + "# Troncos talados y colocados de cada tipo, desde el último tick o segundo\n"
        + "".join(
            f"scoreboard objectives add sm.l.{t} minecraft.mined:minecraft.{t}\n"
            f"scoreboard objectives add sm.lp.{t} minecraft.used:minecraft.{t}\n"
            for t in LOGS
        ),
    )
    write(
        os.path.join(fn, "log_uninstall.mcfunction"),
        HEADER + "".join(f"scoreboard objectives remove sm.l.{t}\nscoreboard objectives remove sm.lp.{t}\n" for t in LOGS),
    )
    write(
        os.path.join(fn, "log_mined.mcfunction"),
        HEADER + "# Cada tick: junta lo talado de cada tipo en sm.lmined (y anota el tipo para el Woodozer)\n"
        + "".join(
            f'execute as @a[scores={{sm.l.{t}=1..}}] run function {NS}:milestone/log_100k/take {{k:"{t}",i:{i}}}\n'
            for i, t in enumerate(LOGS, 1)
        ),
    )
    write(
        os.path.join(fn, "log_placed.mcfunction"),
        HEADER + "# Cada segundo: lo colocado de cada tipo, solo para el panel\n"
        + "".join(
            f'execute as @a[scores={{sm.lp.{t}=1..}}] run function {NS}:milestone/log_100k/placed {{k:"{t}"}}\n'
            for t in LOGS
        ),
    )
    write(
        os.path.join(fn, "fell_start.mcfunction"),
        HEADER + "# Interno: en el hueco del tronco roto. #kind dice de qué tipo era\n"
        + "".join(
            f"execute if score #kind sm.calc matches {i} run return run function {NS}:gen/fell/{t}_around\n"
            for i, t in enumerate(LOGS, 1)
        ),
    )
    for t in LOGS:
        leaf = FOLIAGE.get(t, LEAVES)
        visit = [
            HEADER,
            f"# Interno: en un {t} del árbol. Lo marca y sigue por los que toca.\n",
            'summon minecraft:marker ~ ~ ~ {Tags:["sm.fell"]}\n',
            "scoreboard players add #fell sm.calc 1\n",
        ]
        for x, y, z in FACES:
            visit.append(
                f"execute if score #leafy sm.calc matches 0 if block ~{x or ''} ~{y or ''} ~{z or ''} {leaf} "
                "run scoreboard players set #leafy sm.calc 1\n"
            )
        visit.append(f"function {NS}:gen/fell/{t}_around\n")
        write(os.path.join(fn, "fell", f"{t}.mcfunction"), "".join(visit))
        around = [HEADER, f"# Interno: los 26 bloques alrededor, primero los de arriba\n"]
        for x, y, z in AROUND:
            around.append(
                f"execute if score #fell sm.calc < #fell_cap sm.calc positioned ~{x or ''} ~{y or ''} ~{z or ''} "
                f"if block ~ ~ ~ minecraft:{t} unless entity @e[type=minecraft:marker,tag=sm.fell,distance=..0.5] "
                f"run function {NS}:gen/fell/{t}\n"
            )
        write(os.path.join(fn, "fell", f"{t}_around.mcfunction"), "".join(around))
    print(f"troncos: {len(LOGS)} tipos")


# --- Hito 9: minar en las cuevas profundas, y la DeepMine Crown
# (bloque, meta, nombre en el panel, cómo se protege)
# Metas según cuánto sale de cada uno por chunk en deepslate (datos de 26.4): diamante ~29,
# hierro ~28 más las vetas, oro ~26, redstone ~41, lapislázuli ~17, cobre ~8 (casi todo está sobre Y=0).
#   zone: se puede poner y romper -> cupo por zona (#cap_<bloque> en load), como el stone
#   ore:  con Toque de seda no cuenta. La mena solo se consigue así, y al romperla sin él ya no
#         vuelve: cada mena natural cuenta una sola vez.
DEEP = [
    ("deepslate", 100000, "Deepslate", "zone"),
    ("tuff", 25000, "Tuff", "zone"),
    ("deepslate_diamond_ore", 3500, "Diamante", "ore"),
    ("deepslate_redstone_ore", 5000, "Redstone", "ore"),
    ("deepslate_gold_ore", 3000, "Oro", "ore"),
    ("deepslate_iron_ore", 3000, "Hierro", "ore"),
    ("deepslate_copper_ore", 1000, "Cobre", "ore"),
    ("deepslate_lapis_ore", 2000, "Lapislázuli", "ore"),
]


def generate_deep():
    fn = os.path.join("data", NS, "function", "gen")
    zone = [b for b, _, _, k in DEEP if k == "zone"]
    write(
        os.path.join(fn, "deep_load.mcfunction"),
        HEADER + "# Lo minado de cada bloque desde el último tick, y lo colocado (los que tienen cupo)\n"
        + "".join(f"scoreboard objectives add sm.dp.{b} minecraft.mined:minecraft.{b}\n" for b, *_ in DEEP)
        + "".join(f"scoreboard objectives add sm.du.{b} minecraft.used:minecraft.{b}\n" for b in zone)
        + f"scoreboard players set #deep_goal sm.calc {len(DEEP)}\n",
    )
    write(
        os.path.join(fn, "deep_uninstall.mcfunction"),
        HEADER
        + "".join(f"scoreboard objectives remove sm.dp.{b}\n" for b, *_ in DEEP)
        + "".join(f"scoreboard objectives remove sm.du.{b}\n" for b in zone),
    )
    write(
        os.path.join(fn, "deep_mined.mcfunction"),
        HEADER + "# Cada tick: lo minado de cada bloque\n"
        + "".join(
            f'execute as @a[scores={{sm.dp.{b}=1..}}] run function {NS}:milestone/deep_mine/{k} {{k:"{b}",g:{g}}}\n'
            for b, g, _, k in DEEP
        ),
    )
    write(
        os.path.join(fn, "deep_placed.mcfunction"),
        HEADER + "# Cada segundo: lo colocado, solo para el panel\n"
        + "".join(
            f'execute as @a[scores={{sm.du.{b}=1..}}] run function {NS}:milestone/deep_mine/placed {{k:"{b}"}}\n'
            for b in zone
        ),
    )
    prog = [HEADER, "# Interno: {id}. Fila del panel\n",
            f"$execute store result storage {NS}:tmp row.done int 1 run data get storage {NS}:deep p$(id).done\n"]
    for b, *_ in DEEP:
        prog.append(f"$execute store result storage {NS}:tmp row.{b} int 1 run data get storage {NS}:deep p$(id).{b}\n")
    for b in zone:
        prog.append(f"$execute store result storage {NS}:tmp row.p_{b} int 1 run data get storage {NS}:deep p$(id).placed_{b}\n")
        prog.append(f"$execute store result storage {NS}:tmp row.o_{b} int 1 run data get storage {NS}:deep p$(id).over_{b}\n")
    prog.append(f"function {NS}:gen/deep_progress_text with storage {NS}:tmp row\n")
    write(os.path.join(fn, "deep_progress.mcfunction"), "".join(prog))

    rows = [DEEP[:2]] + [DEEP[i:i + 3] for i in range(2, len(DEEP), 3)]
    extra = [
        '{text:"\\n' + "  ·  ".join(f"{name} $({b})/{g}" for b, g, name, _ in row) + '",color:"gray"}'
        for row in rows
    ]
    extra.append(
        '{text:"\\nColocados: ' + "  ·  ".join(f"{b} $(p_{b})" for b in zone)
        + "  ·  Fuera de cupo: " + "  ·  ".join(f"{b} $(o_{b})" for b in zone) + '",color:"red"}'
    )
    write(
        os.path.join(fn, "deep_progress_text.mcfunction"),
        HEADER + "# Interno: lo que dejó gen/deep_progress en tmp row\n"
        + f'$data modify storage {NS}:tmp line set value {{text:"  $(done)/{len(DEEP)} bloques",color:"dark_aqua",extra:[{",".join(extra)}]}}\n',
    )
    print(f"cuevas profundas: {len(DEEP)} bloques")


# --- Hito 10: excavar 250.000 bloques blandos, y la Terra Magnet que atrae lo que excava
SOIL = """
dirt grass_block coarse_dirt podzol mycelium rooted_dirt dirt_path sand red_sand gravel clay
snow snow_block soul_sand soul_soil mud muddy_mangrove_roots
""".split()
# Lo que atrae la Terra Magnet: los mismos bloques, y lo que sueltan sin Toque de seda
SOIL_DROPS = ["flint", "clay_ball", "snowball"]


def generate_soil():
    fn = os.path.join("data", NS, "function", "gen")
    write(
        os.path.join(fn, "soil_load.mcfunction"),
        HEADER + "# Bloques blandos excavados y colocados de cada tipo, desde el último tick o segundo\n"
        + "".join(
            f"scoreboard objectives add sm.s.{b} minecraft.mined:minecraft.{b}\n"
            f"scoreboard objectives add sm.sp.{b} minecraft.used:minecraft.{b}\n"
            for b in SOIL
        ),
    )
    write(
        os.path.join(fn, "soil_uninstall.mcfunction"),
        HEADER + "".join(f"scoreboard objectives remove sm.s.{b}\nscoreboard objectives remove sm.sp.{b}\n" for b in SOIL),
    )
    write(
        os.path.join(fn, "soil_mined.mcfunction"),
        HEADER + "# Cada tick: junta lo excavado de cada tipo en sm.smined\n"
        + "".join(
            f'execute as @a[scores={{sm.s.{b}=1..}}] run function {NS}:milestone/soil_250k/take {{k:"{b}"}}\n'
            for b in SOIL
        ),
    )
    write(
        os.path.join(fn, "soil_placed.mcfunction"),
        HEADER + "# Cada segundo: lo colocado de cada tipo, solo para el panel\n"
        + "".join(
            f'execute as @a[scores={{sm.sp.{b}=1..}}] run function {NS}:milestone/soil_250k/placed {{k:"{b}"}}\n'
            for b in SOIL
        ),
    )
    write(
        os.path.join("data", NS, "tags", "item", "soil.json"),
        json.dumps({"values": [f"minecraft:{i}" for i in SOIL + SOIL_DROPS]}, indent=2) + "\n",
    )
    print(f"bloques blandos: {len(SOIL)} tipos")


# Hito 11 (Dash Shadow): el empuje del dash. item/dash_shadow/try deja en sm.dgo la dirección
# (código (f+1)*3 + s + 2: f adelante +1 / atrás -1, s izquierda +1 / derecha -1) y en sm.dpb
# el tramo de la cámara (pitch de -90 a 90 de a DASH_STEP grados). Para cada par hay una entrada
# del encantamiento con el vector ya calculado en coordenadas locales (como ^ ^ ^: x izquierda,
# y arriba, z adelante), así el dash va en horizontal mire donde mire, más un poco hacia arriba.
DASH_SPEED = 0.9  # empuje horizontal (bloques por tick)
DASH_LIFT = 0.25  # empuje hacia arriba
DASH_STEP = 10  # grados por tramo: si lo cambias, cambia también el /= #10 de item/dash_shadow/try


def generate_dash():
    import math

    entries = []
    for f in (-1, 0, 1):
        for s in (-1, 0, 1):
            if f == 0 and s == 0:
                continue
            code = (f + 1) * 3 + s + 2
            n = math.hypot(f, s)
            for b in range(180 // DASH_STEP):
                p = math.radians(-90 + DASH_STEP * b + DASH_STEP / 2)
                # horizontal hacia adelante = cos(p)*adelante + sin(p)*arriba; vertical = cos(p)*arriba - sin(p)*adelante
                x = DASH_SPEED * s / n
                y = DASH_SPEED * f / n * math.sin(p) + DASH_LIFT * math.cos(p)
                z = DASH_SPEED * f / n * math.cos(p) - DASH_LIFT * math.sin(p)
                mag = math.sqrt(x * x + y * y + z * z)
                entries.append(
                    {
                        "effect": {
                            "type": "minecraft:all_of",
                            "effects": [
                                {
                                    "type": "minecraft:apply_impulse",
                                    "direction": [round(x / mag, 4), round(y / mag, 4), round(z / mag, 4)],
                                    "coordinate_scale": [1.0, 1.0, 1.0],
                                    "magnitude": round(mag, 4),
                                },
                                {"type": "minecraft:run_function", "function": f"{NS}:item/dash_shadow/done"},
                            ],
                        },
                        "requirements": {
                            "type": "minecraft:entity_scores",
                            "entity": "this",
                            "scores": {"sm.dgo": code, "sm.dpb": b},
                        },
                    }
                )
    enchantment = {
        "description": {"text": "Dash"},
        "supported_items": "minecraft:netherite_leggings",
        "weight": 1,
        "max_level": 1,
        "min_cost": {"base": 1, "per_level_above_first": 0},
        "max_cost": {"base": 1, "per_level_above_first": 0},
        "anvil_cost": 8,
        "slots": ["legs"],
        "effects": {"minecraft:tick": entries},
    }
    write(os.path.join("data", NS, "enchantment", "dash.json"), json.dumps(enchantment, indent=2) + "\n")
    print(f"dash: {len(entries)} direcciones")


# Hito 12 (Aegis Heart): daño recibido antes de la armadura (damage.dealt de entity_hurt_player).
# Ninguna estadística guarda ese daño, así que cada tipo tiene un advancement con un criterio por
# tramo de daño, y gen/hurt_<k> suma el valor del tramo que se cumplió. Todo va en décimas de vida
# (1 corazón = 20). Tramos: de 0,5 en 0,5 hasta 40 de vida (exacto para el daño vanilla, que va
# de a medio punto), de 5 en 5 hasta 100 (cuenta el medio del tramo), y 100 o más cuenta 100.
# Los atacantes válidos son los mobs (sin jugadores): así no cuentan PvP, TNT, camas ni end crystals.
HURT_EXTRA = ["creaking", "giant", "illusioner"]  # atacan pero no están en MOBS (no se matan con arco)
BOSSES = ["wither", "ender_dragon", "warden", "elder_guardian"]
NOT = lambda tag: {"id": f"#minecraft:{tag}", "expected": False}  # noqa: E731
IS = lambda tag: {"id": f"#minecraft:{tag}", "expected": True}  # noqa: E731
MOB = {"entity_type": f"#{NS}:attackers"}
HURT = {
    # k: (qué cuenta, condiciones del daño)
    "mel": ("golpes", {"type": {"tags": [NOT("is_projectile"), NOT("is_explosion"), NOT("is_fire")]}, "source_entity": MOB}),
    "pro": ("proyectiles", {"type": {"tags": [IS("is_projectile")]}, "source_entity": MOB}),
    "exp": ("explosiones", {"type": {"tags": [IS("is_explosion")]}, "source_entity": MOB}),
    "fir": ("fuego y lava", {"type": {"tags": [IS("is_fire")]}}),
    "bos": ("jefes", {"source_entity": {"entity_type": f"#{NS}:bosses"}}),
}


def hurt_buckets():
    """(min, max, valor en décimas) de cada tramo, en puntos de vida."""
    out = [(i * 0.5, i * 0.5 + 0.4999, max(2, i * 5)) for i in range(80)]
    out += [(40 + i * 5, 40 + i * 5 + 4.9999, 400 + i * 50 + 25) for i in range(12)]
    out.append((100, 100000, 1000))
    return out


def generate_hurt():
    fn = os.path.join("data", NS, "function", "gen")
    buckets = hurt_buckets()
    for k, (label, cond) in HURT.items():
        criteria = {}
        lines = [HEADER, f"# Interno: @s recibió daño de {label}. Cuánto (#hp, en décimas de vida) según el tramo que se cumplió.\n"]
        lines.append("scoreboard players set #hp sm.calc 0\n")
        for i, (lo, hi, v) in enumerate(buckets):
            damage = {"dealt": {"min": lo, "max": hi}, "blocked": False}
            damage.update(json.loads(json.dumps(cond)))
            criteria[f"b{i}"] = {"trigger": "minecraft:entity_hurt_player", "conditions": {"damage": damage}}
            lines.append(
                f"execute if entity @s[advancements={{{NS}:hurt_{k}={{b{i}=true}}}}] run scoreboard players set #hp sm.calc {v}\n"
            )
        lines.append(f"advancement revoke @s only {NS}:hurt_{k}\n")
        lines.append(f'execute if score #hp sm.calc matches 1.. run function {NS}:milestone/hurt/add {{k:"{k}"}}\n')
        advancement = {
            "criteria": criteria,
            "requirements": [list(criteria)],
            "rewards": {"function": f"{NS}:gen/hurt_{k}"},
        }
        write(os.path.join("data", NS, "advancement", f"hurt_{k}.json"), json.dumps(advancement, indent=2) + "\n")
        write(os.path.join(fn, f"hurt_{k}.mcfunction"), "".join(lines))
    # Atacantes: los mobs del hito del arco más los que faltan. Los de un overlay van como no obligatorios,
    # así el tag carga también en la versión que no los tiene.
    extra = sorted({m for ms in OVERLAYS.values() for m in ms})
    values = [f"minecraft:{m}" for m in sorted(set(MOBS + HURT_EXTRA))]
    values += [{"id": f"minecraft:{m}", "required": False} for m in extra]
    tags = os.path.join("data", NS, "tags", "entity_type")
    write(os.path.join(tags, "attackers.json"), json.dumps({"values": values}, indent=2) + "\n")
    write(os.path.join(tags, "bosses.json"), json.dumps({"values": [f"minecraft:{m}" for m in BOSSES]}, indent=2) + "\n")
    print(f"daño: {len(HURT)} tipos, {len(buckets)} tramos, {len(values)} atacantes")


# Hito 14 (Thorfinn Harvest): cosechar cultivos maduros, y la cadena del boomerang.
# Cultivos: (bloque, producto, mínimo de producto si está maduro, edad madura, semilla, meta, nombre).
# Para saber si estaba maduro se mira lo que soltó en ese tick: el trigo y la remolacha solo sueltan su
# producto maduros; la zanahoria, la papa y la verruga sueltan 1 verdes y 2 o más maduras.
CROPS = [
    ("wheat", "wheat", 1, 7, "wheat_seeds", 10000, "Trigo"),
    ("carrots", "carrot", 2, 7, "carrot", 10000, "Zanahoria"),
    ("potatoes", "potato", 2, 7, "potato", 10000, "Papa"),
    ("beetroots", "beetroot", 1, 3, "beetroot_seeds", 10000, "Remolacha"),
    ("nether_wart", "nether_wart", 2, 3, "nether_wart", 10000, "Verruga"),
]
# Frutos: solo cuentan (y el boomerang solo corta) los que crecieron de su tallo. Los colocados se anotan
# por posición (advancement fruit_place): romper la decoración no cuenta, y ponerla no resta.
# (bloque, meta, nombre, lo que suelta, tallo, tallo con fruto)
FRUITS = [
    ("melon", 5000, "Melón", ["melon_slice", "melon"], "melon_stem", "attached_melon_stem"),
    ("pumpkin", 5000, "Calabaza", ["pumpkin"], "pumpkin_stem", "attached_pumpkin_stem"),
]
# Por dónde pasa la cadena: cultivos (también verdes) y tallos. Los frutos no: así una pared de melones
# de adorno no se corta entera. El fruto se corta desde su tallo.
CHAIN = [c[0] for c in CROPS] + [s for f in FRUITS for s in f[4:6]]
# Dónde se puede hacer clic para lanzar el boomerang
CLICK = CHAIN + [f[0] for f in FRUITS]
# Lado del fruto -> dónde está su tallo y hacia dónde mira (offset x, z del tallo, facing del tallo)
SIDES = [((1, 0), "west"), ((-1, 0), "east"), ((0, 1), "north"), ((0, -1), "south")]


def generate_harvest():
    fn = os.path.join("data", NS, "function", "gen")
    allk = [c[0] for c in CROPS] + [f[0] for f in FRUITS]
    write(
        os.path.join(fn, "harvest_load.mcfunction"),
        HEADER + "# Lo cosechado de cada cultivo desde el último tick\n"
        + "".join(f"scoreboard objectives add sm.hv.{k} minecraft.mined:minecraft.{k}\n" for k in allk)
        + f"scoreboard players set #harvest_goal sm.calc {len(allk)}\n",
    )
    write(
        os.path.join(fn, "harvest_uninstall.mcfunction"),
        HEADER + "".join(f"scoreboard objectives remove sm.hv.{k}\n" for k in allk),
    )
    lines = [HEADER, "# Cada tick: lo cosechado de cada cultivo (solo cuenta si estaba maduro) y los frutos\n"]
    for b, p, mn, _, _, g, _ in CROPS:
        lines.append(
            f'execute as @a[scores={{sm.hv.{b}=1..}}] run function {NS}:milestone/harvest/crop {{k:"{b}",p:"minecraft:{p}",min:{mn},g:{g}}}\n')
    for b, g, _, _, s, a in FRUITS:
        lines.append(
            f'execute as @a[scores={{sm.hv.{b}=1..}}] run function {NS}:milestone/harvest/fruit {{k:"{b}",g:{g},s:"{s}",a:"{a}"}}\n')
    write(os.path.join(fn, "harvest_mined.mcfunction"), "".join(lines))

    prog = [HEADER, "# Interno: {id}. Fila del panel\n",
            f"$execute store result storage {NS}:tmp row.done int 1 run data get storage {NS}:harvest p$(id).done\n"]
    for k in allk:
        prog.append(f"$execute store result score #v sm.calc run data get storage {NS}:harvest p$(id).{k}\n")
        prog.append("execute if score #v sm.calc matches ..-1 run scoreboard players set #v sm.calc 0\n")
        prog.append(f"execute store result storage {NS}:tmp row.{k} int 1 run scoreboard players get #v sm.calc\n")
    prog.append(f"function {NS}:gen/harvest_progress_text with storage {NS}:tmp row\n")
    write(os.path.join(fn, "harvest_progress.mcfunction"), "".join(prog))
    named = [(c[0], c[5], c[6]) for c in CROPS] + [f[:3] for f in FRUITS]
    rows = [named[i:i + 4] for i in range(0, len(named), 4)]
    extra = ['{text:"\\n' + "  ·  ".join(f"{n} $({k})/{g}" for k, g, n in row) + '",color:"gray"}' for row in rows]
    write(
        os.path.join(fn, "harvest_progress_text.mcfunction"),
        HEADER + "# Interno: lo que dejó gen/harvest_progress en tmp row\n"
        + f'$data modify storage {NS}:tmp line set value {{text:"  $(done)/{len(allk)} cultivos",color:"gold",extra:[{",".join(extra)}]}}\n',
    )

    # Thorfinn Harvest: lo que corta en cada bloque de la cadena (solo lo maduro) y hacia dónde sigue
    cut = [HEADER, "# Interno: como un marker de la cadena, en su bloque. Corta si está maduro y replanta.\n"]
    for b, _, _, age, seed, _, _ in CROPS:
        cut.append(
            f'execute if block ~ ~ ~ minecraft:{b}[age={age}] run return run function {NS}:item/thorfinn/crop {{b:"{b}",s:"{seed}"}}\n')
    # Un fruto solo se corta si su tallo lo está mirando: cuando se hizo clic en él, o desde el tallo.
    # Así la decoración no se toca.
    for b, _, _, _, _, a in FRUITS:
        for (dx, dz), facing in SIDES:
            cut.append(
                f"execute if block ~ ~ ~ minecraft:{b} if block ~{dx or ''} ~ ~{dz or ''} minecraft:{a}[facing={facing}]"
                f" run return run function {NS}:item/thorfinn/fruit\n")
        for (dx, dz), facing in SIDES:
            cut.append(
                f"execute if block ~ ~ ~ minecraft:{a}[facing={facing}] positioned ~{-dx or ''} ~ ~{-dz or ''}"
                f" if block ~ ~ ~ minecraft:{b} run return run function {NS}:item/thorfinn/fruit\n")
    write(os.path.join(fn, "harvest_cut.mcfunction"), "".join(cut))
    spread = [HEADER, "# Interno: como un marker de la cadena. Sigue a los 26 bloques de alrededor que sean cultivos.\n"]
    for dx in (-1, 0, 1):
        for dy in (-1, 0, 1):
            for dz in (-1, 0, 1):
                if dx == dy == dz == 0:
                    continue
                spread.append(
                    f"execute positioned ~{dx or ''} ~{dy or ''} ~{dz or ''} if block ~ ~ ~ #{NS}:harvest_chain"
                    f" unless entity @e[type=minecraft:marker,tag=sm.hx,distance=..0.5]"
                    f" summon minecraft:marker run function {NS}:item/thorfinn/new\n")
    write(os.path.join(fn, "harvest_spread.mcfunction"), "".join(spread))
    write(
        os.path.join("data", NS, "tags", "block", "harvest_chain.json"),
        json.dumps({"values": [f"minecraft:{b}" for b in CHAIN]}, indent=2) + "\n",
    )
    write(
        os.path.join("data", NS, "tags", "block", "harvest_click.json"),
        json.dumps({"values": [f"minecraft:{b}" for b in CLICK]}, indent=2) + "\n",
    )
    write(
        os.path.join("data", NS, "tags", "block", "harvest_fruit.json"),
        json.dumps({"values": [f"minecraft:{f[0]}" for f in FRUITS]}, indent=2) + "\n",
    )
    # Hito: lo que suelta cada fruto (para encontrar dónde estaba) y si su tallo está al lado
    for b, _, _, drops, _, _ in FRUITS:
        write(os.path.join("data", NS, "tags", "item", f"harvest_{b}.json"),
              json.dumps({"values": [f"minecraft:{d}" for d in drops]}, indent=2) + "\n")
    stem = [HEADER, "# Interno: {s, a}. En el hueco de un fruto roto: #st = 1 si al lado está su tallo\n",
            "# (crecido, o todavía mirándolo). Así solo cuentan los que crecieron, no la decoración.\n",
            "scoreboard players set #st sm.calc 0\n"]
    for (dx, dz), facing in SIDES:
        off = f"~{dx or ''} ~ ~{dz or ''}"
        stem.append(f"$execute if block {off} minecraft:$(s)[age=7] run scoreboard players set #st sm.calc 1\n")
        stem.append(f"$execute if block {off} minecraft:$(a)[facing={facing}] run scoreboard players set #st sm.calc 1\n")
    write(os.path.join(fn, "harvest_stem.mcfunction"), "".join(stem))
    print(f"cosecha: {len(CROPS)} cultivos y {len(FRUITS)} frutos")


generate_harvest()
generate_hurt()
generate_dash()
generate_soil()
generate_deep()
generate_logs()
generate_redstone()
generate_debris()
generate("", sorted(MOBS))
for directory, extra in OVERLAYS.items():
    generate(directory, sorted(MOBS + extra))
print(f"base: {len(MOBS)} mobs, " + ", ".join(f"{d}: {len(MOBS) + len(e)}" for d, e in OVERLAYS.items()))
