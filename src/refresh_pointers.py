#!/usr/bin/env python3
from pathlib import Path

KIT_DIR = Path(__file__).parent.parent
DOCS_DIR = KIT_DIR / "docs"
CLAUDE_MD = KIT_DIR / "CLAUDE.md"


def setup_memory_pointers():
    pointers = []

    if DOCS_DIR.exists():
        for mem_file in sorted(DOCS_DIR.glob("*.md")):
            first_line = mem_file.read_text().split('\n')[0].strip()
            rel_path = f"docs/{mem_file.name}"
            pointers.append(f"- {rel_path} — {first_line}")

    block = "# Memory pointers (run src/refresh_pointers.py after creating/deleting memories):\n```md\n"
    if pointers:
        block += "\n".join(pointers) + "\n"
    else:
        block += "None\n"
    block += "```"

    content = CLAUDE_MD.read_text()

    import re
    pattern = r"# Memory pointers \([^)]+\):\n```md\n.*?```"
    content = re.sub(pattern, block, content, flags=re.DOTALL)

    CLAUDE_MD.write_text(content)


if __name__ == "__main__":
    setup_memory_pointers()
