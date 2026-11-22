# Secret-Milestones

Secretos e easter eggs para SMP (Minecraft 26.3 y 26.4) que dan recompensas al alcanzar hitos.

**Spoilers:** este archivo revela los secretos.

## Hitos
| # | Hito | Recompensa |
|---|---|---|
| 1 | Minar 1.000.000 de piedra (`minecraft:stone`) | **Chunk Destroyer Infinitum**: pico de netherita irrompible con Eficiencia X y Toque de seda |
| 2 | Matar con arco cada tipo de mob (87 en 26.3, 88 en 26.4) | **Españita Chaos Bow**: arco con Poder V, Irrompibilidad III, Infinidad y Reparación |

- Cada jugador cobra cada hito **una sola vez**.
- **Cuenta desde que se instala** el datapack: todos empiezan en 0.
- Del hito 1 solo cuenta `stone`: no deepslate, granito, cobblestone ni otras variantes. En creativo no suma.
- El aviso solo lo ve quien lo consigue.
- Con el inventario lleno, muerto o en espectador, la recompensa queda esperando.

## Reglas del hito del arco
- La flecha de un **arco** tiene que dar el **golpe final**. No cuentan ballesta, dispensador, cuerpo a cuerpo, quemado por Fuego ni muerto por la poción de la flecha.
- Cada tipo cuenta una vez. En creativo no cuenta.
- Entran también los pacíficos: aldeano, allay, lobo, gato, etc.
- **Enderman:** cuenta con flecha. Solo la recibe si está montado (bote o vagoneta), suelto la esquiva.
- **Breeze y Wither:** como son inmunes a las flechas, cuentan si el **último golpe** es cuerpo a cuerpo con un **arco en la mano principal**. Es la única excepción: con los demás no vale pegar con el arco.
- **No entran**, porque sería imposible: Creaking (solo muere por su corazón), Giant e Illusioner (no salen en survival).
- El Frostbite solo se pide en 26.4, con `overlay_26_4`.
- La lista está en `tools/generate.py`. Después de editarla ejecuta `python tools/generate.py`.

## Contra los generadores de stone
- **Cupo por zona:** cada zona de 16x16x16 (según dónde está parado el jugador) le cuenta hasta 5500 stone a cada jugador. En una zona natural caben 4096 bloques. Un generador fijo deja de sumar a los 5500, sin avisar.
- **Colocar no resta:** construir y terraformar con stone no afecta el progreso. Poner y romper en el mismo sitio lo frena el cupo de la zona. En el panel, alguien con casi tantas colocadas como minadas es sospechoso.
- El cupo se cambia en `load` (`#cap`). Cambia también el texto de `admin/progress`.

## Panel de admin
`/function secret_milestones:menu` (requiere OP)

- **Obtener pico / arco:** te da solo el ítem.
- **Progreso del arco:** tipos de mob por jugador.
- **Progreso del pico:** por jugador, también desconectado: stone válidas, minadas, colocadas y fuera de cupo.
- **Probar pico / arco:** cierra el panel y reproduce lo que verá el jugador, con el ítem incluido.

Probar las recompensas no marca el hito como conseguido. Los botones solo funcionan para quien abrió el panel él mismo, durante **2 minutos desde el último botón**, o hasta que sale o se usa `/reload`. Al quitarle el OP a alguien usa `/reload` para cortarle el permiso al instante.

## Notas
- Con **Wearbound**, el pico necesita el tier de diamante desbloqueado, como cualquier pico de netherita.
- En el yunque, un libro de Eficiencia lo baja a Eficiencia V (regla de vanilla).
- Desinstalar: `/function secret_milestones:uninstall` y después quitar el datapack. Se conservan el progreso, los cupos y quién cobró, por si se reinstala.

## Agregar un hito
1. La condición: un score (como `sm.valid`) o un predicate.
2. `function/reward/<recompensa>.mcfunction`: el premio.
3. `function/milestone/<hito>/`: copia `stone_1m` y cambia los nombres.
4. Una línea en `milestone/check_all` y su lista en `load`.
5. Vista previa y botones (31 y 32 para el hito 3) en `admin/main`, y sus acciones en `admin/trigger`.

El ícono se genera con `python tools/icon.py`.
