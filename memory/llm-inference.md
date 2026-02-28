<memory-metadata>
{
  "frequency": 10,
  "last_accessed_session": 0,
  "created_session": 637,
  "appreciation": 0,
  "pinned": false
}
</memory-metadata>

<conditional>
Recall if the user prompt mentions LLM-inference workspace, llama.cpp, local LLM inference, Vulkan GPU acceleration, model inference, GGUF models, quantization, llama-cli, llama-server, or the directory /home/yeyito/Workspace/LLM-inference/.
</conditional>

<fuzzy-match>
llm-inference, llama.cpp, vulkan, gpu, gguf, quantization, local-model, model-inference, llama-cli, llama-server, ssmol-lm, qwen, llama, text-completion, model-selector, vulkan-gpu, amd-radeon
</fuzzy-match>

<memory>
LLM-inference workspace — llama.cpp Vulkan GPU setup, models, build process, CLI/server tools, quantization

Workspace Location: /home/yeyito/Workspace/LLM-inference/
GitHub: https://github.com/Yeyito777/yeyito-llm-inference.git

**Workspace Structure**
- Makefile — builds llama.cpp with CMake, Vulkan enabled (`-DGGML_VULKAN=1`), release mode, parallel compilation
- run.sh — interactive TUI model selector (j/k navigation, i to search, Enter to launch)
- src/ — llama.cpp git submodule (github.com/ggml-org/llama.cpp), ~53k LOC C/C++, 20+ LLM architecture support
- llamacpp/ — compiled binaries (60 executables) and shared libs after `make install`
- models/ — quantized GGUF model files (~18GB total)
- reference/ — quickstart.md + model-recommendations.md

**Available Models** (all Q4_K_M quantization)
- SmolLM2-1.7B-Instruct-Q4_K_M.gguf (~1GB) — fast, general-purpose
- Qwen_Qwen3-4B-Q4_K_M.gguf (~2.5GB) — small but capable
- Qwen_Qwen3-8B-Q4_K_M.gguf (~5GB) — best all-rounder for 8GB VRAM
- Llama-3.1-8B-Stheno-v3.4-Q4_K_M.gguf (~4.9GB) — roleplay/creative writing
- mlabonne_Qwen3-8B-abliterated-Q4_K_M.gguf (~5GB) — uncensored variant

**Build & Run Commands**
- `make` — configure + build + install
- `./run.sh` — interactive model selector, launches llama-cli
- Direct: `./llamacpp/llama-cli -m models/<model>.gguf -ngl 99`
- Server: `./llamacpp/llama-server -m models/<model>.gguf -ngl 99 --port 8080` (OpenAI-compatible API)

**Key Binaries** (60 total in llamacpp/)
- llama-cli — interactive chat (main tool)
- llama-server — OpenAI-compatible HTTP API server
- llama-completion — single-turn completion
- llama-bench — benchmarking
- llama-quantize — model quantization
- llama-gguf / llama-gguf-split — GGUF inspection/splitting
- llama-embedding — text embeddings
- llama-llava-cli / llama-qwen2vl-cli / llama-minicpmv-cli — vision model CLIs
- llama-speculative / llama-lookahead — advanced decoding
- llama-tts — text-to-speech

**Common Flags**
- `-m <path>` model file
- `-ngl 99` offload all layers to GPU
- `-n <N>` max tokens
- `-c <N>` context size
- `-t <N>` CPU threads
- `--temp <F>` temperature

**GPU & Hardware**
- GPU: AMD Radeon RX 5700 XT, 8GB VRAM, RADV driver
- Vulkan GPU acceleration enabled in build
- Supports grammar-guided generation, speculative decoding, batch processing

**Architecture Support**
Llama, Qwen, Mistral, Phi, Gemma, Falcon, DeepSeek (20+ LLM architectures)

**Additional Features**
- Multiple quantization levels (Q2_K through Q8_0)
- LoRA adapter support
- Vision model integration
- Model conversion scripts (HuggingFace → GGUF)
- LD_LIBRARY_PATH set to llamacpp/ for shared lib discovery

**Dependencies**
- CMake 3.14+, C++17 compiler, Vulkan SDK
- Python for model conversion: numpy, torch, transformers

---
Update this memory when workspace structure, available models, build process, or binaries change.
</memory>
