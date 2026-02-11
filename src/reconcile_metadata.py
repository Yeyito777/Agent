#!/usr/bin/env python3
"""Reconcile memory/ files with memory-metadata/ JSON files.

Ensures every memory has a corresponding metadata file, removes orphaned
metadata, and guarantees runtime/session-counter exists.
"""

import json
from pathlib import Path

AGENT_DIR = Path(__file__).resolve().parent.parent
MEMORY_DIR = AGENT_DIR / "memory"
METADATA_DIR = AGENT_DIR / "memory-metadata"
COLD_DIR = AGENT_DIR / "memory-cold"
RUNTIME_DIR = AGENT_DIR / "runtime"


def get_current_session():
    session_file = RUNTIME_DIR / "session-counter"
    if not session_file.exists():
        session_file.write_text("0\n")
        return 0
    return int(session_file.read_text().strip())


def default_metadata(session):
    return {
        "frequency": 0,
        "last_accessed_session": session,
        "created_session": session,
        "appreciation": 0,
        "pinned": False,
    }


def reconcile():
    METADATA_DIR.mkdir(exist_ok=True)
    COLD_DIR.mkdir(exist_ok=True)
    RUNTIME_DIR.mkdir(exist_ok=True)

    current_session = get_current_session()

    memory_names = {f.stem for f in MEMORY_DIR.glob("*.md")}
    metadata_names = {f.stem for f in METADATA_DIR.glob("*.json")}

    # Create missing metadata
    created = 0
    for name in sorted(memory_names - metadata_names):
        meta_file = METADATA_DIR / f"{name}.json"
        meta_file.write_text(json.dumps(default_metadata(current_session), indent=2) + "\n")
        created += 1

    # Remove orphaned metadata
    removed = 0
    for name in sorted(metadata_names - memory_names):
        (METADATA_DIR / f"{name}.json").unlink()
        removed += 1

    if created or removed:
        print(f"Reconciled: {created} created, {removed} orphans removed")


if __name__ == "__main__":
    reconcile()
