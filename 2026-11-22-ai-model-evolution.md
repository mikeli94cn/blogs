# openai
The evolution of OpenAI's Large Language Models (LLMs) spans from foundational text-prediction architectures in 2018 to multimodal, reasoning-capable autonomous agents. Building on the 2017 Transformer architecture, OpenAI demonstrated that scaling model parameters, training data, and compute unlocks emergent capabilities. [1] (https://toloka.ai/blog/history-of-llms/), [2] (https://intl.cloud.baidu.com/en/article/9169186), [3] (https://www.youtube.com/watch?v=JAoG3qgco8E)

1. Foundational Scaling Era (2018–2020)

During this phase, OpenAI established the Generative Pre-trained Transformer (GPT) architecture, proving that unsupervised pre-training on vast text corpora could replace task-specific model training. [1] (https://medium.com/@Elite_Magnetism/the-evolution-of-openai-history-and-future-2919eb6755bc), [2] (https://intl.cloud.baidu.com/en/article/9169186)
• GPT-1 (2018). Featuring 117 million parameters, GPT-1 introduced a decoder-only transformer trained on BooksCorpus. It showed that a single neural network could learn general language patterns and adapt to downstream tasks like question-answering via fine-tuning. [1] (https://www.youtube.com/watch?v=-YarW5gKxR8&t=857), [2] (https://intl.cloud.baidu.com/en/article/9169186)
• GPT-2 (2019). Scaled up to 1.5 billion parameters and trained on WebText, GPT-2 produced significantly more coherent, multi-paragraph text. It introduced zero-shot learning, demonstrating that sufficiently large models could perform tasks without task-specific fine-tuning. [1] (https://www.youtube.com/watch?v=-YarW5gKxR8&t=857), [2] (https://intl.cloud.baidu.com/en/article/9169186)
• GPT-3 (2020). Representing a massive leap to 175 billion parameters, GPT-3 popularized few-shot learning and in-context learning. Users could guide the model to write code, translate languages, or summarize text simply by providing a few examples in the prompt. [1] (https://intl.cloud.baidu.com/en/article/9169186), [2] (https://www.youtube.com/watch?v=-YarW5gKxR8&t=857)

2. Alignment & Mainstream Adoption (2022–2023)

Raw scale made models capable, but they often generated unhelpful or untruthful outputs. OpenAI shifted focus toward aligning models with human intent and expanding beyond plain text. [1] (https://en.wikipedia.org/wiki/Large_language_model), [2] (https://www.bluelabellabs.com/blog/large-language-models-evolution/), [3] (https://toloka.ai/blog/history-of-llms/)
• InstructGPT & GPT-3.5 / ChatGPT (2022). By integrating Reinforcement Learning from Human Feedback (RLHF), OpenAI trained models to follow instructions safely and conversationally. Launched in November 2022, ChatGPT brought LLMs into mainstream consumer and enterprise use. [1] (https://www.youtube.com/watch?v=pkIPWS50Asc&t=7), [2] (https://toloka.ai/blog/history-of-llms/), [3] (https://www.youtube.com/watch?v=JAoG3qgco8E)
• GPT-4 (2023). Moving into native multimodality, GPT-4 accepted both image and text inputs. It delivered substantial gains in complex reasoning, steerable behavior, and performance on standardized academic and professional benchmarks. [1] (https://www.bluelabellabs.com/blog/large-language-models-evolution/), [2] (https://en.wikipedia.org/wiki/Large_language_model), [3] (https://www.youtube.com/watch?v=JAoG3qgco8E)

3. Omni-Modality & Inference-Time Reasoning (2024)

In 2024, OpenAI expanded both real-time interaction speeds and deep analytical thinking. [1] (https://en.wikipedia.org/wiki/Large_language_model), [2] (https://toloka.ai/blog/history-of-llms/)
• GPT-4o (2024). The "omni" model unified text, vision, and audio processing into a single end-to-end neural network, allowing near-instantaneous voice conversations and real-time visual understanding.
• OpenAI o1 Series (2024). Rather than scaling pre-training alone, OpenAI introduced inference-time compute scaling. Using reinforcement learning, the o1 models were trained to generate internal chains of thought—spending more time "thinking" before answering—to solve complex math, coding, and scientific problems. [1] (https://en.wikipedia.org/wiki/Large_language_model), [2] (https://toloka.ai/blog/history-of-llms/)

4. Unified Architectures & Autonomous Agents (2025–2026)

Recent developments have merged fast multimodal fluency with deep reasoning to power autonomous workflows. [1] (https://toloka.ai/blog/history-of-llms/), [2] (https://intl.cloud.baidu.com/en/article/9169186)
• o3 & GPT-5 Series (2025). OpenAI pushed reasoning benchmarks further with the o3 models before unifying its conversational and reasoning tracks into the GPT-5 generation, alongside releasing modular open-weight initiatives like GPT-OSS for specialized domain fine-tuning.
• Agentic Ecosystems & GPT-5.5 (2026). Modern iterations focus heavily on agentic execution—planning multi-step tasks, using external tools, configuring servers, and resolving software engineering issues autonomously with significantly improved token efficiency. [1] (https://toloka.ai/blog/history-of-llms/), [2] (https://intl.cloud.baidu.com/en/article/9169186)

Summary Timeline


Model	Release Year	Key Architectural / Capability Shift
GPT-1	2018	117M parameters; proved unsupervised pre-training + fine-tuning on Transformers.
GPT-2	2019	1.5B parameters; introduced zero-shot task generalization and coherent long-form text.
GPT-3	2020	175B parameters; unlocked few-shot in-context learning and prompt engineering.
GPT-3.5 (ChatGPT)	2022	Introduced RLHF alignment for conversational instruction following.
GPT-4	2023	Added vision-text multimodality and stronger complex reasoning.
GPT-4o	2024	End-to-end native audio, vision, and text processing in real time.
OpenAI o1 / o3	2024–2025	Inference-time compute scaling via hidden chain-of-thought reasoning.
GPT-5 / GPT-5.5	2025–2026	Unified reasoning and multimodality optimized for autonomous multi-step agents.

If you'd like to explore further, let me know whether you want to dive into:
• Technical training shifts (e.g., how RLHF and inference-time compute work)
• Specific model comparisons (e.g., GPT-4o vs. the o-series reasoning models)
• Business and API milestones in OpenAI's ecosystem

---

# anthropic
The evolution of Anthropic's Claude models centers on building reliable, steerable AI systems using Constitutional AI, progressing from long-context text assistants in 2023 to autonomous coding and frontier reasoning agents in 2026. [1] (https://platform.claude.com/docs/en/models/overview), [2] (https://intl.cloud.baidu.com/en/article/9156319), [3] (https://www.linkedin.com/pulse/every-claude-model-2023-2026-devendra-kumar-gupta-4pt1c)

1. Constitutional AI & Long-Context Foundations (2023)

Founded by former OpenAI researchers, Anthropic focused early on safety, interpretability, and large memory capacities so models could read entire books or codebases at once. [1] (https://intl.cloud.baidu.com/en/article/9156319), [2] (https://intuitionlabs.ai/articles/anthropic-claude-4-llm-evolution), [3] (https://www.linkedin.com/pulse/every-claude-model-2023-2026-devendra-kumar-gupta-4pt1c)
• Claude 1 & Claude Instant (March 2023). Anthropic's debut models introduced Constitutional AI—training models to follow a set of explicit ethical principles ("helpful, harmless, and honest") rather than relying solely on human feedback. Claude Instant offered a faster, lower-cost tier. [1] (https://www.youtube.com/watch?v=sof3vW4mHTs), [2] (https://intl.cloud.baidu.com/en/article/9156319), [3] (https://changelog.jointjs.com/gallery/timeline-claude-evolution/)
• Claude 2 & 2.1 (July–November 2023). Launched alongside the public Claude.ai interface, Claude 2 popularized massive context windows, expanding from 100K tokens to 200K tokens in Claude 2.1 while cutting hallucination rates and introducing beta tool use. [1] (https://changelog.jointjs.com/gallery/timeline-claude-evolution/), [2] (https://github.com/jqueryscript/anthropic-claude-timeline)

2. The Tiered Architecture & Multimodal Era (2024)

In 2024, Anthropic structured its lineup into three distinct capability-vs.-cost tiers and surged to the forefront of software engineering benchmarks.
• Claude 3 Family (March 2024). Introduced the Haiku (fast/lightweight), Sonnet (balanced), and Opus (deep intelligence) model tiers. Claude 3 also added native vision capabilities to analyze images, charts, and documents. [1] (https://www.anthropic.com/news/claude-3-family), [2] (https://intuitionlabs.ai/articles/anthropic-claude-4-llm-evolution), [3] (https://changelog.jointjs.com/gallery/timeline-claude-evolution/)
• Claude 3.5 Sonnet & Haiku (June–October 2024). Claude 3.5 Sonnet outperformed the larger Claude 3 Opus at twice the speed, making it a favorite for developers. The October 2024 update introduced Computer Use (beta), allowing Claude to view screens, move cursors, and click buttons. [1] (https://github.com/jqueryscript/anthropic-claude-timeline)

3. Hybrid Reasoning & Agentic Coding (2025)

During 2025, Anthropic merged fast conversational responses with deliberate, step-by-step reasoning and terminal-level autonomy.
• Claude 3.7 Sonnet (February 2025). Debuted as a hybrid reasoning model, giving users and developers control over an "extended thinking" budget where the model thinks step-by-step before answering. Released alongside Claude Code, an agentic command-line tool for editing repositories.
• Claude 4 & 4.5 Series (May–November 2025). Starting with Opus 4 and Sonnet 4 and accelerating through the 4.5 generation (Sonnet 4.5, Haiku 4.5, Opus 4.5), Anthropic enabled extended thinking with tool use—allowing models to search the web or run code mid-thought during long, multi-hour agentic workflows. [1] (https://www.anthropic.com/news/claude-4), [2] (https://github.com/jqueryscript/anthropic-claude-timeline), [3] (https://www.linkedin.com/pulse/every-claude-model-2023-2026-devendra-kumar-gupta-4pt1c), [4] (https://benchlm.ai/model-updates/providers/anthropic), [5] (https://toloka.ai/blog/claude-models-explained/)

4. Rapid Iteration & Frontier Tiers (2026)

In 2026, Anthropic significantly increased its release cadence and expanded its lineup beyond the classic three tiers to handle extreme-horizon research and enterprise work. [1] (https://www.claudeai.directory/anthropic-claude-release-timelines), [2] (https://platform.claude.com/docs/en/models/overview), [3] (https://toloka.ai/blog/claude-models-explained/)
• Claude 4.6 to 4.8 (February–May 2026). Brought major leaps in autonomous software engineering and expanded context windows to 1 million tokens.
• Claude 5 / 5.5 Series & New Tiers (June–November 2026). Alongside Haiku 5.5, Sonnet 5.5, and Opus 5.5, Anthropic introduced higher-compute frontier tiers—Fable (such as Fable 5.2 for demanding, long-horizon agentic work) and restricted Mythos models for specialized scientific, financial, and cybersecurity research. [1] (https://www.anthropic.com/news/claude-sonnet-4-6), [2] (https://benchlm.ai/model-updates/providers/anthropic), [3] (https://platform.claude.com/docs/en/models/overview), [4] (https://www.anthropic.com/news/models), [5] (https://github.com/jqueryscript/anthropic-claude-timeline)

Summary Timeline


Generation	Release Window	Key Architectural / Capability Shift
Claude 1 & 2	2023	Constitutional AI alignment; scaled context windows to 100K–200K tokens.
Claude 3	Mar 2024	Established Haiku / Sonnet / Opus tiers and added native vision.
Claude 3.5	Jun–Oct 2024	Leap in coding performance; introduced Artifacts and Computer Use.
Claude 3.7 Sonnet	Feb 2025	Hybrid reasoning ("extended thinking") and launch of Claude Code.
Claude 4 & 4.5	May–Nov 2025	Interleaved tool use during thinking; built for sustained, multi-step agents.
Claude 5 / 5.5 & Fable	2026	1M context, high-efficiency 5.5 tiers, and Fable / Mythos frontier models.

If you'd like to explore further, let me know if you want to compare:
• OpenAI vs. Anthropic (architectural philosophy, coding strengths, and model tiers)
• Anthropic's tier system (when to choose Haiku, Sonnet, Opus, or Fable)
• Constitutional AI & safety frameworks in detail
---
# google
The evolution of Google's AI models began with foundational breakthroughs like the 2017 Transformer architecture and BERT, moving through specialized language models (LaMDA and PaLM) before unifying into the natively multimodal Gemini family. [1] (https://timelines.issarice.com/wiki/Timeline_of_Google_Gemini), [2] (https://www.youtube.com/watch?v=UgSQqfRmWwI)

1. Pre-Gemini Foundations (2017–2023)

Before unifying its research teams into Google DeepMind, Google pioneered the core architectures that underpin modern LLMs, deploying separate models for search, dialogue, and scale.
• Transformer & BERT (2017–2018). Google researchers invented the Transformer architecture, which enabled parallel processing of text, followed by BERT, which transformed Google Search by understanding bidirectional context in queries.
• LaMDA & PaLM (2021–2023). LaMDA specialized in open-ended dialogue and powered the initial launch of Google Bard in early 2023. PaLM and PaLM 2 (540 billion parameters) scaled up reasoning, coding, and multilingual capabilities across Workspace and developer APIs. [1] (https://timelines.issarice.com/wiki/Timeline_of_Google_Gemini), [2] (https://www.youtube.com/watch?v=UgSQqfRmWwI)

2. Native Multimodality & Massive Context (2023–2024)

In late 2023, Google launched Gemini, built from the ground up to natively process text, code, audio, images, and video within a single model rather than stitching separate modality models together. [1] (https://www.youtube.com/watch?v=UgSQqfRmWwI)
• Gemini 1.0 (December 2023). Debuted in three sizes—Nano (for on-device mobile tasks), Pro (balanced general tasks), and Ultra (complex reasoning). [1] (https://www.youtube.com/watch?v=UnjMTVLJ6dE), [2] (https://www.facebook.com/fb-answers/gemini-ai-release-history/)
• Gemini 1.5 (February–May 2024). Introduced a Mixture-of-Experts (MoE) architecture and shattered context limits by expanding memory to 1 million—and up to 2 million—tokens. This era also introduced Flash, a high-speed, cost-efficient tier alongside Pro. [1] (https://timelines.issarice.com/wiki/Timeline_of_Google_Gemini), [2] (https://www.youtube.com/watch?v=UnjMTVLJ6dE)

3. Agentic Capabilities & Hybrid Thinking (2024–2025)

Across late 2024 and 2025, Google focused on low-latency real-time interaction, native multimodal generation, and built-in reasoning.
• Gemini 2.0 (December 2024–February 2025). Built for the "agentic era," Gemini 2.0 introduced the Multimodal Live API for real-time audio/video streaming, native image and audio output, and deeper tool integration.
• Gemini 2.5 (March–June 2025). Embedded native thinking directly into its flagship Pro and Flash models, allowing them to reason through logic and coding steps before responding, while introducing Flash-Lite for ultra-high-volume tasks. [1] (https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/model-versions), [2] (https://en.wikipedia.org/wiki/Gemini_(language_model)), [3] (https://en.wikipedia.org/wiki/Google_Gemini)

4. Deep Think & Gemini 3 / 4 Generations (Late 2025–2026)

From late 2025 through 2026, Google shifted toward iterative multi-hypothesis reasoning and specialized frontier tiers for enterprise and knowledge work. [1] (https://gemini.google/release-notes/), [2] (https://www.youtube.com/watch?v=Zwjxv7FPLHk)
• Gemini 3 & 3.1 Series (November 2025–February 2026). Launched Gemini 3 Pro and 3 Flash alongside Deep Think mode—a high-compute reasoning system that explores multiple hypotheses simultaneously for advanced math, science, and "vibe coding". This era also popularized native image generation models like Nano Banana Pro (Gemini 3 Pro Image).
• Gemini 3.5 to 3.8 Iterations (May–September 2026). Accelerated the Flash lineup (3.5, 3.6, 3.7, and 3.8 Flash plus 3.8 Live) to deliver sustained frontier performance for stateful, autonomous agents at lower latency.
• Gemini 4 Family (October–November 2026). Introduced specialized frontier models including Gemini 4 Argon (targeting enterprise professional intelligence across finance, legal, and consulting), followed by Carbon, Hydrogen, and Neon releases. [1] (https://en.wikipedia.org/wiki/Gemini_(language_model)), [2] (https://en.wikipedia.org/wiki/Google_Gemini), [3] (https://gemini.google/release-notes/), [4] (https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/model-versions), [5] (https://aistudio.google.com/docs/changelog), [6] (https://www.lorka.ai/ai-models/google), [7] (https://www.youtube.com/watch?v=Zwjxv7FPLHk), [8] (https://benchlm.ai/model-updates/providers/google)

Summary Timeline


Model / Era	Release Window	Key Architectural / Capability Shift
LaMDA & PaLM 2	2021–2023	Early conversational AI (Bard) and large-scale multilingual text/code models.
Gemini 1.0	Dec 2023	Natively multimodal from the ground up; introduced Nano / Pro / Ultra tiers.
Gemini 1.5	Early 2024	Mixture-of-Experts architecture; 1M–2M token context window; introduced Flash.
Gemini 2.0 & 2.5	Late 2024–Mid 2025	Real-time Multimodal Live API, native media output, and built-in reasoning.
Gemini 3 / 3.1	Late 2025–Early 2026	Deep Think multi-hypothesis reasoning and native image editing (Nano Banana).
Gemini 3.5–3.8 & 4	Mid–Late 2026	Autonomous agent sandboxes and specialized frontier tiers (Argon, Carbon, Neon).

If you'd like to continue exploring, let me know if you want to:
Compare all three ecosystems (OpenAI vs. Anthropic vs. Google side by side)Dive into Google's open-weight models (the Gemma family)Explore Google's media models (Veo for video and Imagen / Nano Banana for images)
---
# other u.s. main companies
Beyond OpenAI, Anthropic, and Google, the evolution of mainstream U.S. foundation models is driven by five major organizations—Meta, xAI, NVIDIA, Microsoft, and Amazon—each advancing distinct pillars such as open-weight ecosystems, Mixture-of-Experts (MoE) scaling, small language models, and enterprise cloud agents.

1. Meta: Open-Weight Champion to the Muse Era

Meta catalyzed the global open-source AI movement before expanding into proprietary frontier systems through Meta Superintelligence Labs.
• LLaMA 1 & Llama 2 (2023). LLaMA 1 leaked to researchers and sparked an explosion of community fine-tuning, prompting Meta to release Llama 2 with commercial licensing and instruction-tuned chat variants.
• Llama 3 & 3.1 / 3.2 / 3.3 (2024). Scaled up to 405 billion parameters, proving that open-weight models could rival top proprietary systems, while adding vision capabilities and compact edge models (1B–11B).
• Llama 4 (April 2025). Transitioned to a natively multimodal Mixture-of-Experts (MoE) architecture with Scout (109B total / 17B active parameters, featuring a massive 10M-token context window) and Maverick (400B total / 17B active parameters). [1] (https://en.wikipedia.org/wiki/Llama_(language_model)), [2] (https://teamvoy.com/blog/llama-5-released/)
• The Muse Series (2026). Rather than releasing a "Llama 5," Meta introduced the Muse family—led by proprietary frontier models Muse Spark and Muse Wonder (with Active Memory) alongside open-weight releases like Muse Spark Open (816B total / 42B active parameters) and Muse Glimmer. [1] (https://teamvoy.com/blog/llama-5-released/), [2] (https://www.secondtalent.com/resources/every-llama-ai-model-explained-compared/)

2. xAI (SpaceXSI): Rapid Frontier Scaling & Real-Time Data

Founded by Elon Musk and later integrated with SpaceX, xAI focused on massive compute clusters (Colossus) and real-time integration with the X platform. [1] (https://x.ai/news), [2] (https://www.mindstudio.ai/blog/grok-5-release-date-specs)
• Grok-1 & Grok-2 (2023–2024). Started with an open-sourced 314B MoE base model (Grok-1) before moving to Grok-2, which introduced image generation, vision, and live web/X search.
• Grok 3 & Grok 4 (2025). Added dedicated "Think" mode reasoning, server-side tool execution, and agentic coding workflows via Grok Build.
• Grok 4.5 to 4.7 Series (2026). Co-developed with coding tools like Cursor, these iterations powers autonomous team agents (Grok Bot) and enterprise office integrations while xAI trains its next-generation 6-trillion-parameter Grok 5 model. [1] (https://en.wikipedia.org/wiki/Grok_(chatbot)), [2] (https://docs.x.ai/developers/release-notes), [3] (https://x.ai/news), [4] (https://www.mindstudio.ai/blog/grok-5-release-date-specs)

3. NVIDIA: Hybrid Mamba-Transformer & Enterprise Open Models

NVIDIA evolved from providing AI hardware to publishing fully open models—including weights, training data, and recipes—optimized for high-throughput enterprise agents. [1] (https://www.secondtalent.com/resources/every-nemotron-ai-model-explained-compared/), [2] (https://sapling.ai/llm/nemotron-vs-phi)
• Nemotron-4 (2024). Focused on synthetic data generation and reward modeling (340B) to help enterprises train and align their own custom LLMs.
• Nemotron 3 & 3.5 Series (Late 2025–2026). Pioneered a hybrid Mamba-2 + Transformer + MoE architecture that keeps long-context inference (up to 1M tokens) inexpensive. Key models include Nemotron 3 Ultra (550B total / 55B active parameters for deep reasoning) and the Nemotron 3.5 lineup (Lightning and Super VL) for fast, multimodal enterprise agents. [1] (https://www.secondtalent.com/resources/every-nemotron-ai-model-explained-compared/), [2] (https://sapling.ai/llm/nemotron-vs-phi)

4. Microsoft: Data Quality & Small Language Models (SLMs)

Alongside its partnership with OpenAI, Microsoft Research proved that curated synthetic data could allow compact models to punch far above their parameter weight. [1] (https://sapling.ai/llm/nemotron-vs-phi)
• Phi-1 & Phi-2 (2023). Demonstrated the "Textbooks Are All You Need" thesis—showing that 1.3B to 2.7B parameter models trained on high-quality synthetic data could match models 10x–25x their size in coding and logic.
• Phi-3 & Phi-4 Series (2024–2026). Expanded into lightweight mobile, vision, and dedicated reasoning variants (such as Phi-4 at 14B parameters), becoming a standard choice for local, on-device, and edge inference. [1] (https://docs.nvidia.com/nemo-helix/documentation/customizer-reference/models/phi), [2] (https://sapling.ai/llm/nemotron-vs-phi)

5. Amazon (AWS): Cost-Efficient Enterprise & Voice Models

Amazon built its internal foundation models around low latency, tight AWS Bedrock integration, and customizable enterprise deployment. [1] (https://www.aboutamazon.com/news/aws/aws-agentic-ai-amazon-bedrock-nova-models), [2] (https://www.cloudroutehq.com/aws-ai/amazon-nova)
• Amazon Titan (2023–2024). Early text, embedding, and image models designed for basic enterprise summarization and RAG workflows on AWS.
• Amazon Nova & Nova 2 / 2.5 (Late 2024–2026). Replaced Titan with multimodal tiers (Micro, Lite, Pro, Premier) and specialized speech-to-speech models (Nova Sonic / Nova 2.5 Sonic). In 2026, Amazon streamlined its lineup around Nova 2 Lite, Nova 2.5 Sonic, and Nova Forge (custom model training) while launching a dedicated Frontier Model Research initiative. [1] (https://www.nocode.mba/ai-release-tracker/providers/amazon), [2] (https://www.cloudroutehq.com/aws-ai/amazon-nova), [3] (https://www.reddit.com/r/AIGuild/comments/1v9jswh/amazon_is_winding_down_most_nova_models_and/)

Summary Comparison


Organization	Flagship Lineup	Core Strategic Focus
Meta	Llama 1–4 \(\rightarrow \) Muse (Spark, Wonder)	Open-weight ecosystem leadership, massive MoE models, and personal/coding agents.
xAI	Grok 1–4.7 (Grok 5 in training)	Massive compute scaling, real-time X/web grounding, and collaborative enterprise bots.
NVIDIA	Nemotron-4 \(\rightarrow \) Nemotron 3 / 3.5	Hybrid Mamba-Transformer efficiency, open training recipes, and high-throughput agents.
Microsoft	Phi-1 through Phi-4	High-efficiency Small Language Models (SLMs) via synthetic data for edge/local AI.
Amazon	Titan \(\rightarrow \) Nova 2 / 2.5 & Forge	Low-cost, low-latency AWS cloud inference, voice agents, and custom enterprise tuning.

If you'd like to narrow this down, let me know if you want to explore:
• Notable U.S. research institutes & startups (e.g., Allen Institute for AI's OLMo, Databricks' DBRX, or Cohere's Command series)
• Global open-weight leaders outside the U.S. (such as DeepSeek, Qwen, or Mistral)
• Architectural shifts (how Mixture-of-Experts and Mamba-Transformer hybrids work)
---
# global ai leader companies (except u.s.)
Outside the United States, the evolution of global frontier AI models is led primarily by Chinese labs—DeepSeek, Alibaba (Qwen), Zhipu AI (GLM), Moonshot AI (Kimi), and ByteDance (Doubao)—alongside Europe's flagship Mistral AI. Together, these organizations redefined global AI economics through ultra-efficient Mixture-of-Experts (MoE) architectures, open-weight frontier releases, and massive context windows. [1] (https://mistral.ai/news/mistral-3/), [2] (https://hongkongaipodcast.com/blog/chinese-ai-models-november-2026), [3] (https://geotoolbox.ai/blog/chinese-ai-models-compared), [4] (https://www.meta-intelligence.tech/en/insight-deepseek-v4-r2)

1. DeepSeek (China): The Cost & Efficiency Disruptor

Founded in Hangzhou, DeepSeek reshaped global AI development by proving that frontier reasoning and coding performance can be achieved at a fraction of traditional training and inference costs. [1] (https://www.meta-intelligence.tech/en/insight-deepseek-v4-r2), [2] (https://geotoolbox.ai/blog/chinese-ai-models-compared)
• DeepSeek-V2 & V3 (2024). Pioneered Multi-Head Latent Attention (MLA) and fine-grained MoE architectures (671B total / 37B active parameters in V3), slashing API pricing and memory overhead. [1] (https://www.bentoml.com/blog/the-complete-guide-to-deepseek-models-from-v3-to-r1-and-beyond)
• DeepSeek-R1 & V3.1/V3.2 (2025). DeepSeek-R1 (January 2025) became an open-weight phenomenon by matching OpenAI's o1 in math and coding via pure reinforcement learning. Later updates (V3.1 and V3.2) unified direct chat and chain-of-thought reasoning into a single hybrid model. [1] (https://qwen.ai/blog?id=qwen3), [2] (https://www.meta-intelligence.tech/en/insight-deepseek-v4-r2), [3] (https://www.bentoml.com/blog/the-complete-guide-to-deepseek-models-from-v3-to-r1-and-beyond), [4] (https://api-docs.deepseek.com/updates)
• DeepSeek-V4 & V4.1-Flash (2026). Scaled to over 1 trillion parameters with native multimodality and ~1M-token context windows, released under permissive MIT open-weight licenses (V4-Pro and V4.1-Flash). [1] (https://api-docs.deepseek.com/updates), [2] (https://www.meta-intelligence.tech/en/insight-deepseek-v4-r2), [3] (https://hongkongaipodcast.com/blog/chinese-ai-models-november-2026), [4] (https://geotoolbox.ai/blog/chinese-ai-models-compared)

2. Alibaba Cloud — Qwen (China): The Open-Weight Ecosystem Standard

Alibaba's Qwen (Tongyi Qianwen) became the most widely downloaded open-weight model family globally, spanning tiny edge models to multi-trillion-parameter frontier flagships. [1] (https://en.wikipedia.org/wiki/Qwen), [2] (https://www.pymnts.com/news/artificial-intelligence/2026/alibaba-takes-on-anthropic-with-new-qwen-ai-model/)
• Qwen 1.5 & 2.5 (2024). Established a full spectrum of open sizes (0.5B to 72B) alongside specialized Qwen-Coder, Qwen-Math, and Qwen-VL (vision-language) siblings. [1] (https://myclaw.ai/blog/qwen-2-5-vs-3-5)
• Qwen3 Series (2025). Introduced hybrid "Thinking" and "Non-Thinking" modes, Qwen3-Coder, and large MoE variants (235B-A22B) supporting 119 languages. [1] (https://www.alibabacloud.com/en/solutions/generative-ai/qwen?_p_lc=1), [2] (https://en.wikipedia.org/wiki/Qwen), [3] (https://qwen.ai/blog?id=qwen3)
• Qwen3.5–3.8 & Qwen4-Max (2026). Transitioned to natively multimodal architectures capable of operating desktop and mobile interfaces. By late 2026, Alibaba scaled open-weight models up to Qwen3.8 (2.4T parameters) and launched its proprietary flagship Qwen4-Max (2.4T parameters, 1M context). [1] (https://www.pymnts.com/news/artificial-intelligence/2026/alibaba-takes-on-anthropic-with-new-qwen-ai-model/), [2] (https://en.wikipedia.org/wiki/Qwen), [3] (https://myclaw.ai/blog/qwen-2-5-vs-3-5)

3. Mistral AI (France): Europe's Frontier & Enterprise Champion

Headquartered in Paris, Mistral AI emerged as Europe's leading foundation model lab, balancing compact open-source models with enterprise-grade European deployment. [1] (https://mistral.ai/news/mistral-3/)
• Mistral 7B, Mixtral 8x7B & Mistral Large 2 (2023–2024). Popularized sparse MoE models in the open-source community with Mixtral before scaling to Mistral Large 2 (123B) and Pixtral (multimodal vision).
• Mistral 3 & Specialized Verticals (2025). Launched Mistral Large 3 (675B total / 41B active parameters under Apache 2.0) alongside Ministral 3 edge models (3B–14B), Devstral (coding), Magistral (reasoning), and Voxtral (voice/TTS).
• Mistral 4 Series (2026). Unified its instruction, reasoning, coding, and multimodal tracks into Mistral Large 4 and Mistral Small 4 with configurable reasoning effort and fluency across 160+ languages. [1] (https://docs.mistral.ai/models), [2] (https://docs.mistral.ai/models/pixtral-large-24-11), [3] (https://mistral.ai/news/mistral-3/), [4] (https://mistral.ai/research/), [5] (https://legal.mistral.ai/ai-governance/models/)

4. Zhipu AI / Z.ai — GLM (China): Agentic & Coding Specialist

Spun out of Tsinghua University, Zhipu AI evolved its General Language Model (GLM) architecture into a top contender for autonomous coding and multi-step tool execution. [1] (https://hongkongaipodcast.com/blog/chinese-ai-models-november-2026), [2] (https://geotoolbox.ai/blog/chinese-ai-models-compared)
• ChatGLM & GLM-4 (2023–2024). Built an early bilingual chat and enterprise ecosystem in China with strong tool-calling and long-context capabilities.
• GLM-4.5 to GLM-5.3 (2025–2026). Pivoted aggressively toward agentic workflows and software engineering. Released open-weight frontier models GLM-5.3 (753B parameters) and GLM-5.3-Flash (321B, MIT license) with ~1M-token context windows. [1] (https://geotoolbox.ai/blog/chinese-ai-models-compared), [2] (https://hongkongaipodcast.com/blog/chinese-ai-models-november-2026)

5. Moonshot AI — Kimi (China): Extreme Scale & Agent Swarms

Beijing-based Moonshot AI gained recognition for pioneering ultra-long context windows before scaling to some of the world's largest open-weight MoE models. [1] (https://hongkongaipodcast.com/blog/chinese-ai-models-november-2026), [2] (https://geotoolbox.ai/blog/chinese-ai-models-compared)
• Kimi Chat & K1.5 (2023–2025). First consumer assistant to popularize 200K–2M character context windows, followed by Kimi k1.5, a multimodal reinforcement-learning reasoning model.
• Kimi K2 & K3 Series (2025–2026). Released agent-focused coding models (K2.7-Code) and scaled up to Kimi K3 (2.78 trillion parameters) and Kimi K3.1 Pro, releasing open weights designed for parallel "agent swarms" and deep research. [1] (https://hongkongaipodcast.com/blog/chinese-ai-models-november-2026), [2] (https://geotoolbox.ai/blog/chinese-ai-models-compared)

6. ByteDance — Doubao / Seed (China): High-Volume Consumer & IDE Integration

ByteDance leveraged its massive consumer footprint and Volcano Engine cloud to build one of the highest-traffic LLM ecosystems in the world. [1] (https://www.chinatalk.media/p/chinese-ai-rings-in-the-year-of-the), [2] (https://www.secondtalent.com/resources/every-doubao-ai-model-explained-compared/)
• Doubao 1.0 & 1.5 (2023–2025). Scaled rapidly across consumer apps while driving aggressive enterprise token price reductions.
• Doubao-Seed 2.0 & 2.1 (2026). Rebranded its frontier research line under Seed (Seed 2.0, Seed 2.1 Pro/Turbo, and weekly-updated Seed-Evolving), tightly integrating Doubao-Seed-2.0-Code into its AI-native TRAE development environment. [1] (https://www.secondtalent.com/resources/every-doubao-ai-model-explained-compared/), [2] (https://www.chinatalk.media/p/chinese-ai-rings-in-the-year-of-the)
(Other notable regional contributors include Baidu with ERNIE 5.0/5.5, MiniMax with M3/M3.1, Cohere in Canada with its enterprise Command series, and Technology Innovation Institute in the UAE with Falcon.) [1] (https://hongkongaipodcast.com/blog/chinese-ai-models-november-2026), [2] (https://geotoolbox.ai/blog/chinese-ai-models-compared), [3] (https://eu.36kr.com/en/p/3964166805855490)

Summary Comparison


Organization (Region)	Flagship Models	Core Strategic Differentiator
DeepSeek (China)	V3, R1 → V4-Pro / V4.1-Flash	Extreme training/API cost efficiency; MIT open-weight reasoning and coding.
Alibaba (China)	Qwen 2.5, 3 → Qwen3.8 / Qwen4-Max	Broadest open-weight ecosystem (edge to 2.4T MoE) + native GUI/multimodal agents.
Mistral AI (France)	Mixtral → Mistral Large 4 / Small 4	European data sovereignty; unified open-weight MoE for coding, reasoning & 160+ languages.
Zhipu / Z.ai (China)	GLM-4 → GLM-5.3 / 5.3-Flash	Frontier software engineering benchmarks and open-weight agentic tool use.
Moonshot AI (China)	Kimi k1.5 → Kimi K3 / K3.1 Pro	Massive-scale open weights (2.78T parameters), 1M context, and multi-agent swarms.
ByteDance (China)	Doubao 1.5 → Doubao-Seed 2.1	Consumer-scale efficiency and tight IDE integration via TRAE.

If you'd like to wrap up or go deeper, let me know if you want to:
• Compare global open-weight licenses (MIT/Apache 2.0 vs. custom commercial thresholds like Qwen/GLM/Kimi)
• Synthesize a global master timeline across US, Chinese, and European labs from 2017 to 2026
• Compare top models for a specific use case (e.g., local self-hosting, coding agents, or low-cost API workflows)
---
# model and model parameters
The evolution of mainstream LLM parameters has shifted from pure dense model scaling (2018–2023) to sparse Mixture-of-Experts (MoE) architectures, Small Language Models (SLMs), and inference-time compute scaling (2024–2026). Rather than simply making every parameter active for every word, modern frontier models decouple total knowledge capacity from active per-token compute.

1. Foundational Dense Scaling (2018–2021)

Early Large Language Models used dense architectures, meaning 100% of the model's parameters were activated to process every single token. Researchers discovered that scaling parameters alongside data and compute unlocked predictable performance gains.
• GPT-1 (2018) → 117 Million: Proved that pre-training a Transformer on unlabeled text could generalize across language tasks.
• GPT-2 (2019) → 1.5 Billion: Demonstrated coherent multi-paragraph generation and zero-shot task execution.
• GPT-3 (2020) → 175 Billion: A 100x leap over GPT-2 that unlocked in-context (few-shot) learning without updating model weights.
• Megatron-Turing NLG (2021) → 530 Billion: Pushed dense parameter counts past half a trillion, though training and serving costs became prohibitively expensive.

2. Compute-Optimal Laws & Peak Dense Scale (2022–2023)

By 2022, researchers realized that giant models were often "undertrained"—they had too many parameters relative to their training tokens.
• Chinchilla Scaling Laws (2022) → 70 Billion: DeepMind demonstrated that a 70B model trained on 1.4 trillion tokens outperformed much larger models (like 280B Gopher or 175B GPT-3) while costing far less to run.
• PaLM (2022) → 540 Billion: Represented the practical ceiling for massive dense models before inference latency forced architectural changes.
• LLaMA 1 & 2 (2023) → 7B to 70B: Proved that smaller dense models trained well beyond Chinchilla-optimal token counts could match proprietary flagships and run on consumer or single-node hardware.

3. The Shift to Sparse MoE & High-Efficiency SLMs (2024)

In 2024, the industry split into two directions: scaling frontier knowledge via Mixture-of-Experts (MoE) and shrinking models for edge devices via high-quality synthetic data.
• How Sparse MoE Works: Instead of activating all parameters per token, a router activates only a small subset of specialized "expert" sub-networks. This gives the model massive memory capacity while keeping inference fast and inexpensive.
• Mixtral 8x7B & 8x22B (2023–2024): Popularized open-weight MoE (e.g., 141B total parameters, only 39B active per token).
• DeepSeek-V3 (Late 2024) → 671B Total / 37B Active: Used fine-grained MoE to rival top proprietary models while activating only ~5.5% of its parameters per token.
• Llama 3.1 (2024) → 405B Dense: Marked one of the last major frontier open-weight models to rely on a massive dense architecture.
• Small Language Models (Phi-3, Gemma 2, Qwen 2.5) → 2B to 14B: Curated synthetic training data allowed compact dense models to match the reasoning and coding performance of 2020–2022 era 70B–175B models.

4. Ultra-Sparse Trillion-Scale MoE & Test-Time Compute (2025–2026)

From 2025 through 2026, frontier labs stopped competing solely on parameter size and shifted to test-time compute (letting models spend extra tokens "thinking" via reinforcement learning) paired with ultra-sparse MoE designs.
• Llama 4 Maverick (2025) → 400B Total / 17B Active: Reduced the active parameter ratio to under 5% while retaining frontier multimodal knowledge.
• Trillion-Parameter Frontier MoEs (2026): Open-weight and proprietary flagships crossed the multi-trillion-parameter mark while keeping active parameters low—such as DeepSeek-V4 (1T+), Qwen3.8 / Qwen4-Max (2.4T), and Kimi K3 (2.78T).
• Undisclosed Proprietary Sizes: Labs like OpenAI (GPT-4o, o3, GPT-5.5), Anthropic (Claude 3.5 through 5.5), and Google (Gemini 1.5 through 4) stopped disclosing exact parameter counts, focusing instead on reasoning compute budgets, latency tiers, and long-context memory (1M–10M tokens).

Summary Evolution Table


Era	Representative Models	Parameter Scale	Active Compute Ratio	Core Paradigm
2018–2020	GPT-1 → GPT-3	117M → 175B	100% (Dense)	Brute-force parameter scaling unlocks emergent abilities.
2022–2023	Chinchilla, PaLM, Llama 2	7B → 540B	100% (Dense)	Compute-optimal token-to-parameter ratios ("overtraining").
2024	Mixtral, DeepSeek-V3, Phi-3	3.8B (SLM) – 671B (MoE)	~5%–25% (Sparse MoE)	Decoupling total knowledge from per-token inference cost.
2025–2026	Llama 4, Qwen4-Max, Kimi K3	400B → 2.78T+	<5% (Ultra-Sparse MoE)	Trillion-scale memory paired with test-time reasoning compute.

If you'd like to explore further, let me know if you want to dive into:
Hardware & VRAM math (how active vs. total parameters affect GPU memory and tokens-per-second)Chinchilla vs. Test-Time Scaling laws (why spending compute at inference replaced pre-training parameter growth)Quantization techniques (how FP8, INT4, and 1.58-bit models shrink parameter footprints)
