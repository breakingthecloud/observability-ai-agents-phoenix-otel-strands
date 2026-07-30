# 🔭 How I Monitor My AI Agents: CloudWatch + Arize Phoenix + LLM-as-Judge

[![License](https://img.shields.io/badge/license-Apache%202.0-blue)](LICENSE)
[![Python](https://img.shields.io/badge/python-3.10%2B-blue)](https://python.org)
[![Strands](https://img.shields.io/badge/Strands-Agents%20SDK-purple)](https://github.com/strands-agents/sdk-python)
[![OpenTelemetry](https://img.shields.io/badge/OpenTelemetry-📡-blue)](https://opentelemetry.io)

Three-layer observability for AI agents built with [Strands Agents SDK](https://github.com/strands-agents/sdk-python) and Amazon Bedrock.

| Layer | Tool | What It Answers |
|-------|------|-----------------|
| **AI Traces** | [Arize Phoenix](https://github.com/Arize-ai/phoenix) | What did the agent think? Which tools did it call? |
| **Infrastructure** | [Amazon CloudWatch](https://aws.amazon.com/cloudwatch/) | Is the system healthy? How fast? How much does it cost? |
| **Quality Evals** | LLM-as-Judge | Was the response actually *good*? |

## What's Inside

This Jupyter notebook demonstrates:

1. **OpenTelemetry tracing** of Strands agent calls to both Phoenix (local UI) and CloudWatch (AWS)
2. **Custom metrics** — agent latency, tool call count, token usage, cost per run
3. **CloudWatch dashboards** — real-time monitoring of agent health and spend
4. **LLM-as-Judge evals** — automated quality scoring of agent responses using a judge LLM
5. **End-to-end workflow** — from local dev to production observability

## Stack

- [Strands Agents SDK](https://github.com/strands-agents/sdk-python) — AWS open-source agent framework
- [Amazon Bedrock](https://aws.amazon.com/bedrock/) — Claude Sonnet 4.6
- [Arize Phoenix](https://github.com/Arize-ai/phoenix) — Open-source AI observability (runs locally)
- [Amazon CloudWatch](https://aws.amazon.com/cloudwatch/) — Metrics, alarms, dashboards
- [OpenTelemetry](https://opentelemetry.io/) + [OpenInference](https://github.com/Arize-ai/openinference) — Tracing standard

## Quick Start

```bash
# First time — creates venv with Python 3.10 (via uv), installs everything
./setup_env.sh install

# Launch JupyterLab
./setup_env.sh start
```

Select the **"Observability Agents"** kernel in JupyterLab and run all cells.

## Prerequisites

- [uv](https://docs.astral.sh/uv/) installed
- AWS credentials configured (`aws configure` or SSO)
- Bedrock model access enabled (Claude Sonnet 4.6)

## What You'll See

After running the notebook:
- **Phoenix UI** (`http://localhost:6006`) — trace tree of every agent decision, tool call, and LLM response
- **CloudWatch Metrics** — custom namespace with agent latency, cost, and error count
- **LLM Judge scores** — quality ratings for each agent response in the dataset

## Architecture

```
Agent → OTel SDK → OTel Collector → Arize Phoenix (traces)
                                  → CloudWatch (metrics + logs)
                                  → LLM Judge (quality scores)
```

## Blog Post

📝 [How I Monitor My AI Agents: CloudWatch for Infra, Arize Phoenix for Traces, LLM-as-Judge for Quality](https://dev.to/ccortezb) — *Breaking the Cloud*

## Author

Carlos Cortez — [LinkedIn](https://www.linkedin.com/in/carloscortezcloud) · [X](https://x.com/ccortezb) · [GitHub](https://github.com/ccortezb)

## License

Apache 2.0
