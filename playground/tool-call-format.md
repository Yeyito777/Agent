# How Claude API Tool Calls Work

## The API Response Format

When Claude wants to call a tool, it returns a response with `stop_reason: "tool_use"` and one or more **content blocks**. A response can mix text and tool calls.

### Example: Claude responds with a tool call

```json
{
  "id": "msg_abc123",
  "type": "message",
  "role": "assistant",
  "stop_reason": "tool_use",
  "content": [
    {
      "type": "text",
      "text": "Let me check the git status for you."
    },
    {
      "type": "tool_use",
      "id": "toolu_abc123",
      "name": "bash",
      "input": {
        "command": "git status"
      }
    }
  ]
}
```

Key points:
- `stop_reason` is `"tool_use"` (not `"end_turn"`) — this tells your CLI the model wants to call a tool
- Each tool call block has a unique `id` — you need this to send the result back
- `name` matches one of the tools you defined in the request
- `input` is a JSON object matching that tool's input schema

### Example: Multiple tool calls in parallel

```json
{
  "role": "assistant",
  "stop_reason": "tool_use",
  "content": [
    {
      "type": "text",
      "text": "Let me read both files."
    },
    {
      "type": "tool_use",
      "id": "toolu_aaa",
      "name": "read_file",
      "input": { "path": "/home/user/foo.py" }
    },
    {
      "type": "tool_use",
      "id": "toolu_bbb",
      "name": "read_file",
      "input": { "path": "/home/user/bar.py" }
    }
  ]
}
```

## Feeding Results Back

After executing the tool(s), you send a **user message** with `tool_result` content blocks:

```json
{
  "role": "user",
  "content": [
    {
      "type": "tool_result",
      "tool_use_id": "toolu_aaa",
      "content": "file contents of foo.py..."
    },
    {
      "type": "tool_result",
      "tool_use_id": "toolu_bbb",
      "content": "file contents of bar.py..."
    }
  ]
}
```

Each `tool_use_id` must match the `id` from the corresponding `tool_use` block.

## The Full Loop

```
You (client)                          Claude API
    |                                     |
    |--- messages + tools definition ---->|
    |                                     |
    |<--- response (stop_reason:tool_use) |
    |     content: [text, tool_use, ...]  |
    |                                     |
    |  (you execute the tools locally)    |
    |                                     |
    |--- previous messages + tool_result->|
    |                                     |
    |<--- response (maybe more tool_use)  |
    |     or (stop_reason: end_turn)      |
    |                                     |
```

## Defining Tools in the Request

Tools are defined at the top level of your API request:

```json
{
  "model": "claude-opus-4-6",
  "max_tokens": 4096,
  "tools": [
    {
      "name": "bash",
      "description": "Execute a bash command",
      "input_schema": {
        "type": "object",
        "properties": {
          "command": {
            "type": "string",
            "description": "The command to run"
          }
        },
        "required": ["command"]
      }
    },
    {
      "name": "read_file",
      "description": "Read a file from disk",
      "input_schema": {
        "type": "object",
        "properties": {
          "path": {
            "type": "string",
            "description": "Absolute path to the file"
          }
        },
        "required": ["path"]
      }
    }
  ],
  "messages": [
    { "role": "user", "content": "What files are in this repo?" }
  ]
}
```

## Streaming Variant

With streaming (`"stream": true`), tool calls arrive as **events**:

```
event: content_block_start
data: {"type":"content_block_start","index":1,"content_block":{"type":"tool_use","id":"toolu_abc","name":"bash","input":{}}}

event: content_block_delta
data: {"type":"content_block_delta","index":1,"delta":{"type":"input_json_delta","partial_json":"{\"comma"}}

event: content_block_delta
data: {"type":"content_block_delta","index":1,"delta":{"type":"input_json_delta","partial_json":"nd\": \"git status\"}"}}

event: content_block_stop
data: {"type":"content_block_stop","index":1}
```

The `input` JSON arrives incrementally via `input_json_delta` — you need to concatenate the `partial_json` strings and parse the full JSON once `content_block_stop` fires.

## Minimal Implementation Checklist

1. Send `tools` array in your API request
2. Check `stop_reason === "tool_use"` on every response
3. Find all `content` blocks where `type === "tool_use"`
4. Execute each tool locally (run bash, read file, etc.)
5. Send results back as `tool_result` blocks with matching `tool_use_id`
6. Repeat until `stop_reason === "end_turn"`
