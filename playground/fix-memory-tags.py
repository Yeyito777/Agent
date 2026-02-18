#!/usr/bin/env python3
"""Check and fix memory files where </memory> has no newline before it."""

from pathlib import Path

MEMORY_DIR = Path(__file__).resolve().parent.parent / "memory"
COLD_DIR = Path(__file__).resolve().parent.parent / "memory-cold"

fixed = 0
for d in [MEMORY_DIR, COLD_DIR]:
    for f in sorted(d.glob("*.md")):
        text = f.read_text()
        if "</memory>" not in text:
            continue
        idx = text.index("</memory>")
        if idx > 0 and text[idx - 1] != "\n":
            text = text[:idx] + "\n" + text[idx:]
            f.write_text(text)
            print(f"  FIXED: {f.name}")
            fixed += 1

if fixed:
    print(f"\nFixed {fixed} file(s)")
else:
    print("All files OK")
