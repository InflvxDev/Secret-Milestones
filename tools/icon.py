#!/usr/bin/env python3
"""Secret-Milestones - genera pack.png (pixel art 64x64 escalado x4 = 256x256).

Un cofre secreto entreabierto del que sale una luz roja con un signo de interrogación.
Sin dependencias: escribe el PNG a mano con zlib.
Uso: python tools/icon.py
"""
import math
import os
import struct
import zlib

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
N, SCALE = 64, 4


def hexc(h):
    return tuple(int(h[i:i + 2], 16) for i in (1, 3, 5))


def mix(a, b, t):
    t = max(0.0, min(1.0, t))
    return tuple(round(a[i] + (b[i] - a[i]) * t) for i in range(3))


def rect(x0, y0, x1, y1, color):
    for y in range(y0, y1 + 1):
        for x in range(x0, x1 + 1):
            img[y][x] = hexc(color)


# --- Fondo: resplandor rojo y haz de luz que sale del cofre
img = [[hexc("#120D1C")] * N for _ in range(N)]
for y in range(N):
    for x in range(N):
        c = img[y][x]
        c = mix(c, hexc("#8C1F2B"), (1 - math.hypot(x - 31.5, y - 30) / 34) * 0.8)
        if y < 40 and abs(x - 31.5) < 11 + (40 - y) * 0.4:
            c = mix(c, hexc("#FF5555"), y / 40 * 0.45)
        img[y][x] = c

# --- Signo de interrogación
MARK = (
    ".####.",
    "##..##",
    "....##",
    "...##.",
    "..##..",
    "..##..",
    "......",
    "..##..",
)
for color, offset in (("#4A1010", 2), ("#FFD43B", 0)):
    for j, row in enumerate(MARK):
        for i, cell in enumerate(row):
            if cell == "#":
                x, y = 23 + i * 3 + offset, 6 + j * 3 + offset
                rect(x, y, x + 2, y + 2, color)

# --- Cofre de netherita con borde dorado
rect(13, 35, 50, 57, "#08060D")   # contorno
rect(15, 37, 48, 40, "#FF5555")   # luz de la abertura
rect(18, 38, 45, 39, "#FFD0B0")
rect(15, 41, 48, 55, "#443E42")   # cuerpo
rect(15, 41, 48, 42, "#685E64")
rect(15, 53, 48, 55, "#2C282D")
for x in (17, 43):                # bandas
    rect(x, 41, x + 3, 55, "#C98A22")
    rect(x, 41, x + 1, 55, "#FFD43B")
rect(28, 41, 35, 50, "#08060D")   # cerradura
rect(29, 41, 34, 49, "#FFD43B")
rect(31, 44, 32, 47, "#4A1010")

# --- Destellos
for x, y in ((10, 13), (53, 10), (54, 28), (8, 31)):
    rect(x - 1, y, x + 1, y, "#FF8A7A")
    rect(x, y - 1, x, y + 1, "#FF8A7A")
    rect(x, y, x, y, "#FFFFFF")

# --- Marco
for box in ((0, 0, 63, 0), (0, 63, 63, 63), (0, 0, 0, 63), (63, 0, 63, 63)):
    rect(*box, "#07060D")

# --- Escribir PNG
raw = bytearray()
for y in range(N * SCALE):
    raw.append(0)
    for x in range(N * SCALE):
        raw.extend(img[y // SCALE][x // SCALE])


def chunk(tag, data):
    c = struct.pack(">I", len(data)) + tag + data
    return c + struct.pack(">I", zlib.crc32(tag + data) & 0xFFFFFFFF)


png = b"\x89PNG\r\n\x1a\n"
png += chunk(b"IHDR", struct.pack(">IIBBBBB", N * SCALE, N * SCALE, 8, 2, 0, 0, 0))
png += chunk(b"IDAT", zlib.compress(bytes(raw), 9))
png += chunk(b"IEND", b"")
with open(os.path.join(ROOT, "pack.png"), "wb") as f:
    f.write(png)
print("pack.png generado")
