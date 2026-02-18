#!/usr/bin/env python3
"""In-file memory metadata operations.

Metadata is stored in <memory-metadata>...</memory-metadata> tags at the
top of each memory/*.md file. This module provides read/write/ensure
operations for that metadata.

Format:
    <memory-metadata>
    {
      "frequency": 0,
      "last_accessed_session": 0,
      "created_session": 0,
      "appreciation": 0,
      "pinned": false
    }
    </memory-metadata>

    <memory>
    ...actual memory content...
    </memory>
"""

import json
import re
import sys
from pathlib import Path

DEFAULT_METADATA = {
    "frequency": 0,
    "last_accessed_session": 0,
    "created_session": 0,
    "appreciation": 0,
    "pinned": False,
}

_META_RE = re.compile(
    r"^<memory-metadata>\n(.*?)\n</memory-metadata>",
    re.DOTALL,
)


def read_metadata(mem_file: Path) -> dict:
    """Read metadata from a memory file. Returns defaults if tags are missing."""
    text = mem_file.read_text()
    m = _META_RE.match(text)
    if m:
        return json.loads(m.group(1))
    return {**DEFAULT_METADATA}


def write_metadata(mem_file: Path, metadata: dict):
    """Write metadata into a memory file, preserving all other content."""
    text = mem_file.read_text()
    meta_json = json.dumps(metadata, indent=2)
    new_block = f"<memory-metadata>\n{meta_json}\n</memory-metadata>"

    m = _META_RE.match(text)
    if m:
        # Replace existing metadata block
        text = new_block + text[m.end():]
    else:
        # No metadata block — add it at the top, wrap content in <memory> if needed
        text = ensure_structure(text, metadata)
        return mem_file.write_text(text)

    mem_file.write_text(text)


def ensure_structure(content: str, metadata: dict | None = None) -> str:
    """Ensure a memory file's content has the full structure.

    If missing <memory-metadata>, creates it. If missing <memory>, wraps content.
    Returns the properly structured content string.
    """
    if metadata is None:
        metadata = {**DEFAULT_METADATA}

    meta_json = json.dumps(metadata, indent=2)

    # Already has metadata?
    meta_match = _META_RE.match(content)
    has_meta = meta_match is not None
    has_memory = "<memory>" in content

    if has_meta and has_memory:
        return content

    if has_meta and meta_match:
        # Has metadata but content isn't wrapped — wrap it
        rest = content[meta_match.end():].strip()
        meta_block = content[:meta_match.end()]
        return f"{meta_block}\n\n<memory>\n{rest}\n</memory>\n"

    if not has_meta and has_memory:
        # Has <memory> tags but no metadata — prepend metadata
        return f"<memory-metadata>\n{meta_json}\n</memory-metadata>\n\n{content}"

    # Neither — wrap everything
    if not content.endswith("\n"):
        content += "\n"
    return f"<memory-metadata>\n{meta_json}\n</memory-metadata>\n\n<memory>\n{content}</memory>\n"


def ensure_file(mem_file: Path, current_session: int = 0):
    """Ensure a memory file has metadata tags. Creates defaults if missing."""
    text = mem_file.read_text()
    if _META_RE.match(text):
        return False  # Already has metadata

    metadata = {
        **DEFAULT_METADATA,
        "created_session": current_session,
        "last_accessed_session": current_session,
    }
    new_text = ensure_structure(text, metadata)
    mem_file.write_text(new_text)
    return True  # Was missing, now fixed


def get_description(mem_file: Path) -> str:
    """Get the description (first line of <memory> content) from a memory file."""
    text = mem_file.read_text()

    # Try to extract from <memory> tag
    mem_match = re.search(r"<memory>\n(.*?)(?:\n|</memory>)", text, re.DOTALL)
    if mem_match:
        first_line = mem_match.group(1).split("\n")[0].strip()
        if first_line:
            return first_line

    # Fallback: skip metadata block, get first non-empty line
    m = _META_RE.match(text)
    rest = text[m.end():].strip() if m else text.strip()
    for line in rest.split("\n"):
        line = line.strip()
        if line and not line.startswith("<"):
            return line

    return mem_file.stem


# --- CLI interface for use from bash scripts ---
if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: memory_metadata.py <command> <memory_file> [args...]", file=sys.stderr)
        print("Commands: read, write_field, ensure, description", file=sys.stderr)
        sys.exit(1)

    cmd = sys.argv[1]
    mem_path = Path(sys.argv[2])

    if cmd == "read":
        meta = read_metadata(mem_path)
        print(json.dumps(meta, indent=2))

    elif cmd == "write_field":
        # write_field <file> <key> <value>
        if len(sys.argv) < 5:
            print("Usage: memory_metadata.py write_field <file> <key> <value>", file=sys.stderr)
            sys.exit(1)
        key = sys.argv[3]
        raw_value = sys.argv[4]
        # Parse value type
        try:
            value = json.loads(raw_value)
        except json.JSONDecodeError:
            value = raw_value
        meta = read_metadata(mem_path)
        meta[key] = value
        write_metadata(mem_path, meta)
        print(json.dumps(meta, indent=2))

    elif cmd == "ensure":
        session = int(sys.argv[3]) if len(sys.argv) > 3 else 0
        created = ensure_file(mem_path, session)
        print("created" if created else "exists")

    elif cmd == "description":
        print(get_description(mem_path))

    else:
        print(f"Unknown command: {cmd}", file=sys.stderr)
        sys.exit(1)
