#!/usr/bin/env python3
"""Reconcile memory/ files — ensure every memory has in-file metadata tags.

Scans memory/*.md and memory-cold/*.md, adds <memory-metadata> and <memory>
tags to any file missing them. Guarantees runtime/session-counter exists.
"""

from pathlib import Path
from memory_metadata import ensure_file

AGENT_DIR = Path(__file__).resolve().parent.parent
MEMORY_DIR = AGENT_DIR / "memory"
COLD_DIR = AGENT_DIR / "memory-cold"
RUNTIME_DIR = AGENT_DIR / "runtime"


def get_current_session():
    session_file = RUNTIME_DIR / "session-counter"
    if not session_file.exists():
        session_file.write_text("0\n")
        return 0
    return int(session_file.read_text().strip())


def reconcile():
    COLD_DIR.mkdir(exist_ok=True)
    RUNTIME_DIR.mkdir(exist_ok=True)

    current_session = get_current_session()

    ensured = 0
    for d in [MEMORY_DIR, COLD_DIR]:
        for f in sorted(d.glob("*.md")):
            if ensure_file(f, current_session):
                ensured += 1
                print(f"  Ensured metadata: {f.name}")

    if ensured:
        print(f"Reconciled: {ensured} files got metadata tags")


if __name__ == "__main__":
    reconcile()
