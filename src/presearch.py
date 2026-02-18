#!/usr/bin/env python3
"""presearch.py — Keyword presearch filter for memory recall.

Reads user prompt from stdin (plain text). Tokenizes the prompt, removes
stop words, then fuzzy-matches keywords against memory filenames and
first-line descriptions. Outputs filtered pointer lines to stdout.
Outputs metadata JSON to stderr for logging.

Usage: echo "prompt" | python3 presearch.py /path/to/memory [on|off]
  arg1: memory directory path
  arg2: "on" to include full file contents in search, "off" otherwise
"""

import json
import re
import sys
from difflib import SequenceMatcher
from pathlib import Path

# Add src/ to path for memory_metadata import
sys.path.insert(0, str(Path(__file__).resolve().parent))
from memory_metadata import get_description

STOP_WORDS = {
    # articles
    'a', 'an', 'the',
    # pronouns
    'i', 'me', 'my', 'mine', 'we', 'us', 'our', 'ours',
    'you', 'your', 'yours', 'he', 'him', 'his', 'she', 'her', 'hers',
    'it', 'its', 'they', 'them', 'their', 'theirs',
    # be-verbs
    'is', 'am', 'are', 'was', 'were', 'be', 'been', 'being',
    # auxiliary / modal
    'have', 'has', 'had', 'having',
    'will', 'would', 'shall', 'should', 'may', 'might', 'must', 'can', 'could',
    # common verbs — too generic to be useful as search keywords
    'do', 'did', 'does', 'done', 'doing',
    'get', 'got', 'gets', 'getting',
    'go', 'going', 'went', 'gone',
    'come', 'came', 'comes', 'coming',
    'make', 'made', 'makes', 'making',
    'let', 'lets', 'letting',
    'tell', 'told', 'tells', 'telling',
    'see', 'saw', 'seen', 'sees', 'seeing',
    'know', 'knew', 'known', 'knows', 'knowing',
    'want', 'wants', 'wanted', 'wanting',
    'need', 'needs', 'needed', 'needing',
    'like', 'liked', 'likes', 'liking',
    'take', 'took', 'taken', 'takes', 'taking',
    'give', 'gave', 'given', 'gives', 'giving',
    'say', 'said', 'says', 'saying',
    'think', 'thought', 'thinks', 'thinking',
    'try', 'tried', 'tries', 'trying',
    'use', 'used', 'uses', 'using',
    'find', 'found', 'finds', 'finding',
    'put', 'puts', 'putting',
    'set', 'sets', 'setting',
    'run', 'ran', 'runs', 'running',
    'keep', 'kept', 'keeps', 'keeping',
    'add', 'added', 'adds', 'adding',
    'move', 'moved', 'moves', 'moving',
    'call', 'called', 'calls', 'calling',
    'turn', 'turned', 'turns', 'turning',
    'start', 'started', 'starts', 'starting',
    'stop', 'stopped', 'stops', 'stopping',
    'show', 'showed', 'shown', 'shows', 'showing',
    'work', 'worked', 'works', 'working',
    'change', 'changed', 'changes', 'changing',
    'check', 'checked', 'checks', 'checking',
    'handle', 'handled', 'handles', 'handling',
    'look', 'looked', 'looks', 'looking',
    'seem', 'seemed', 'seems', 'seeming',
    'pick', 'picked', 'picks', 'picking',
    'send', 'sent', 'sends', 'sending',
    'kill', 'killed', 'kills', 'killing',
    'fix', 'fixed', 'fixes', 'fixing',
    'break', 'broke', 'broken', 'breaks', 'breaking',
    'cover', 'covered', 'covers', 'covering',
    'remind', 'reminded', 'reminds', 'reminding',
    'finish', 'finished', 'finishes', 'finishing',
    'increase', 'increased', 'increases', 'increasing',
    'open', 'opened', 'opens', 'opening',
    'read', 'reads', 'reading',
    'write', 'wrote', 'written', 'writes', 'writing',
    'walk', 'walked', 'walks', 'walking',
    'touch', 'touched', 'touches', 'touching',
    'save', 'saved', 'saves', 'saving',
    'happen', 'happened', 'happens', 'happening',
    'leave', 'left', 'leaves', 'leaving',
    'end', 'ended', 'ends', 'ending',
    'fail', 'failed', 'fails', 'failing',
    'allow', 'allowed', 'allows', 'allowing',
    # prepositions
    'in', 'on', 'at', 'to', 'for', 'of', 'with', 'by', 'from', 'up',
    'about', 'into', 'out', 'over', 'after', 'before', 'between',
    'under', 'above', 'through', 'during', 'across', 'alongside',
    'around', 'within', 'without', 'upon', 'toward', 'towards',
    # conjunctions
    'and', 'or', 'but', 'if', 'then', 'so', 'than', 'because', 'since',
    'while', 'although', 'unless', 'whether', 'until',
    # demonstratives / question words
    'that', 'this', 'these', 'those',
    'what', 'which', 'who', 'whom', 'when', 'where', 'why', 'how',
    # quantifiers
    'all', 'each', 'every', 'any', 'some', 'more', 'most', 'other',
    'both', 'few', 'many', 'much', 'own', 'same',
    # generic adjectives / descriptors
    'new', 'old', 'big', 'small', 'long', 'short',
    'right', 'wrong', 'good', 'bad', 'best', 'better', 'worse', 'worst',
    'great', 'nice', 'cool', 'fine', 'pretty', 'similar',
    'high', 'low', 'full', 'empty', 'whole',
    'current', 'currently', 'existing', 'default',
    'last', 'next', 'first', 'recent', 'previous',
    # generic nouns — too common to filter memories
    'thing', 'things', 'stuff', 'part', 'parts',
    'level', 'levels', 'case', 'cases',
    'value', 'values', 'place', 'kind', 'bit', 'lot',
    'point', 'reason', 'problem', 'question',
    'idea', 'name', 'number', 'example',
    'file', 'files', 'feature', 'option', 'options',
    'project', 'setup', 'process', 'style', 'rest',
    'data', 'type', 'types', 'piece', 'pieces',
    # adverbs / fillers
    'just', 'also', 'very', 'too', 'here', 'there', 'now',
    'not', 'no', 'yes', 'ok', 'okay', 'sure', 'please',
    'really', 'only', 'still', 'already', 'again', 'even',
    'actually', 'instead', 'always', 'never', 'sometimes',
    'specifically', 'manually', 'silently',
    'everything', 'something', 'anything', 'nothing',
    # conversational fillers
    'hey', 'hi', 'hello', 'thanks', 'thank',
    'alright', 'anyway', 'basically',
    'meant', 'heard', 'worried', 'wondering',
    'scratch', 'talked', 'figured',
    'wait', 'isn', 'doesn', 've', 'll', 're',
    # misc
    'as', 'such', 'well', 'back', 'way',
}

FUZZY_THRESHOLD = 0.95


def tokenize(text):
    """Extract alphanumeric tokens, lowercase."""
    return re.findall(r'[a-zA-Z0-9_]+', text.lower())


def word_matches_target(keyword, search_tokens, search_text):
    """Check if a keyword matches search text using tiered fuzzy matching.

    Tier 1 (all words): regex word-boundary match.
    Tier 2 (len>2 only): keyword is substring of any target token.
    Tier 3 (len>2 only): SequenceMatcher ratio >= threshold against any target token.
    """
    short = len(keyword) <= 2

    # Tier 1: exact word boundary (always applied)
    if re.search(r'\b' + re.escape(keyword) + r'\b', search_text):
        return True

    if short:
        return False

    # Tier 2: substring in any individual token
    for token in search_tokens:
        if keyword in token:
            return True

    # Tier 3: SequenceMatcher fuzzy
    for token in search_tokens:
        if len(token) < 3:
            continue
        if SequenceMatcher(None, keyword, token).ratio() >= FUZZY_THRESHOLD:
            return True

    return False


def main():
    if len(sys.argv) < 2:
        print("Usage: echo 'prompt' | presearch.py <memory_dir> [on|off]", file=sys.stderr)
        sys.exit(1)

    memory_dir = Path(sys.argv[1])
    include_content = len(sys.argv) > 2 and sys.argv[2] == 'on'

    prompt = sys.stdin.read().strip()
    if not prompt:
        json.dump({"keywords": [], "matched": 0, "total": 0, "pass_all": False},
                  sys.stderr)
        return

    if not memory_dir.exists():
        json.dump({"keywords": [], "matched": 0, "total": 0, "pass_all": False},
                  sys.stderr)
        return

    # Tokenize and filter stop words
    tokens = tokenize(prompt)
    keywords = [t for t in tokens if t not in STOP_WORDS and len(t) > 1]
    # Deduplicate while preserving order
    seen = set()
    unique_keywords = []
    for kw in keywords:
        if kw not in seen:
            seen.add(kw)
            unique_keywords.append(kw)
    keywords = unique_keywords

    # Collect all memory files
    mem_files = sorted(memory_dir.glob('*.md'))
    total = len(mem_files)

    if total == 0:
        json.dump({"keywords": keywords, "matched": 0, "total": 0, "pass_all": False},
                  sys.stderr)
        return

    # If no keywords remain after filtering, output nothing (no recall)
    if not keywords:
        json.dump({"keywords": [], "matched": 0, "total": total, "pass_all": False},
                  sys.stderr)
        return

    # Presearch: filter memories by keyword matching
    matched = 0
    for f in mem_files:
        text = f.read_text()
        desc = get_description(f)
        stem = f.stem.replace('-', ' ')

        search_text = (stem + ' ' + desc).lower()
        if include_content:
            search_text += ' ' + text.lower()

        search_tokens = tokenize(search_text)

        # A memory matches if ANY keyword matches it
        if any(word_matches_target(kw, search_tokens, search_text) for kw in keywords):
            print(f'- memory/{f.name} \u2014 {desc}')
            matched += 1

    json.dump({"keywords": keywords, "matched": matched, "total": total, "pass_all": False},
              sys.stderr)


if __name__ == '__main__':
    main()
