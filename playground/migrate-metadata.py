#!/usr/bin/env python3
"""Migrate memory metadata from separate JSON files into memory files.

For each memory/*.md file:
1. Read corresponding memory-metadata/{name}.json
2. Wrap existing content in <memory>...</memory> tags
3. Prepend <memory-metadata>...</memory-metadata> block with the JSON
4. Write back to memory/*.md

Also handles memory-cold/ files the same way.

This is a one-shot migration script. Run it once, verify, then
the separate memory-metadata/ directory is no longer needed.
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
        return 0
    return int(session_file.read_text().strip())


DEFAULT_METADATA = {
    "frequency": 0,
    "last_accessed_session": 0,
    "created_session": 0,
    "appreciation": 0,
    "pinned": False,
}


def migrate_file(mem_file: Path, meta_source_dir: Path):
    """Migrate a single memory file to the new format."""
    name = mem_file.stem
    content = mem_file.read_text()

    # Skip if already migrated
    if content.startswith("<memory-metadata>"):
        print(f"  SKIP (already migrated): {mem_file.name}")
        return False

    # Load metadata
    meta_file = meta_source_dir / f"{name}.json"
    if meta_file.exists():
        metadata = json.loads(meta_file.read_text())
    else:
        print(f"  WARN: no metadata for {mem_file.name}, using defaults")
        session = get_current_session()
        metadata = {**DEFAULT_METADATA, "created_session": session, "last_accessed_session": session}

    # Build new file content
    meta_json = json.dumps(metadata, indent=2)
    new_content = f"<memory-metadata>\n{meta_json}\n</memory-metadata>\n\n<memory>\n{content}</memory>\n"

    mem_file.write_text(new_content)
    return True


def migrate_directory(mem_dir: Path, meta_dir: Path, label: str):
    """Migrate all .md files in a directory."""
    md_files = sorted(mem_dir.glob("*.md"))
    if not md_files:
        print(f"\n{label}: no files found")
        return

    print(f"\n{label}: {len(md_files)} files")
    migrated = 0
    for f in md_files:
        if migrate_file(f, meta_dir):
            migrated += 1
            print(f"  OK: {f.name}")

    print(f"  Migrated: {migrated}/{len(md_files)}")


def main():
    print("=== Memory Metadata Migration ===")
    print(f"Agent dir: {AGENT_DIR}")

    # Migrate active memories
    migrate_directory(MEMORY_DIR, METADATA_DIR, "memory/")

    # Migrate cold storage (metadata JSON lives alongside .md in memory-cold/)
    migrate_directory(COLD_DIR, COLD_DIR, "memory-cold/")

    print("\n=== Migration complete ===")
    print("Verify the results, then memory-metadata/ can be removed.")


if __name__ == "__main__":
    main()
