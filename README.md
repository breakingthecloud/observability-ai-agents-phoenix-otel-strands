<p align="center">
  <img alt="Agent Observability" src="https://img.shields.io/badge/🔭-Agent_Observability-FF6B6B?style=for-the-badge" height="50">
</p>

<p align="center">
  <b>Three-layer observability for AI agents</b><br>
  CloudWatch + Arize Phoenix + LLM-as-Judge. Built with Strands Agents SDK.
</p>

<p align="center">
  <a href="#quick-start">Quick Start</a>
  ·
  <a href="#stack">Stack</a>
  ·
  <a href="#architecture">Architecture</a>
  ·
  <a href="#prerequisites">Prerequisites</a>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/license-Apache_2.0-FF6B6B?style=flat-square" alt="License">
  <img src="https://img.shields.io/badge/Python-3.10%2B-blue?style=flat-square&logo=python" alt="Python">
  <img src="https://img.shields.io/badge/Strands-SDK-purple?style=flat-square" alt="Strands">
  <img src="https://img.shields.io/badge/OpenTelemetry-📡-blue?style=flat-square" alt="OTEL">
  <img src="https://img.shields.io/badge/blog-dev.to-blue?style=flat-square" alt="Blog">
  <img src="https://img.shields.io/badge/PRs-welcome-brightgreen?style=flat-square" alt="PRs">
</p>

---

Monitor your AI agents across three observability layers:

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
4. **LLM-as-Judge evals** — automated quality scoring using a judge LLM
5. **End-to-end workflow** — from local dev to production observability

## Quick Start

```bash
# First time — creates venv with Python 3.10 (via uv), installs everything
./setup_env.sh install

# Launch JupyterLab
./setup_env.sh start
```

Select the **"Observability Agents"** kernel in JupyterLab and run all cells.

## Stack

| Tool | Purpose |
|------|---------|
| [Strands Agents SDK](https://github.com/strands-agents/sdk-python) | AWS open-source agent framework |
| [Amazon Bedrock](https://aws.amazon.com/bedrock/) | Claude Sonnet 4.6 LLM |
| [Arize Phoenix](https://github.com/Arize-ai/phoenix) | Open-source AI observability (local) |
| [Amazon CloudWatch](https://aws.amazon.com/cloudwatch/) | Metrics, alarms, dashboards |
| [OpenTelemetry](https://opentelemetry.io/) + [OpenInference](https://github.com/Arize-ai/openinference) | Tracing standard |

## Architecture

```
Agent → OTel SDK → OTel Collector → Arize Phoenix (traces)
                                  → CloudWatch (metrics + logs)
                                  → LLM Judge (quality scores)
```

## What You'll See

After running the notebook:
- **Phoenix UI** (`http://localhost:6006`) — trace tree of every agent decision, tool call, and LLM response
- **CloudWatch Metrics** — custom namespace with agent latency, cost, and error count
- **LLM Judge scores** — quality ratings for each agent response in the dataset

## Prerequisites

- [uv](https://docs.astral.sh/uv/) installed
- AWS credentials configured (`aws configure` or SSO)
- Bedrock model access enabled (Claude Sonnet 4.6)

## Blog Post

📝 [How I Monitor My AI Agents: CloudWatch for Infra, Arize Phoenix for Traces, LLM-as-Judge for Quality](https://dev.to/ccortezb) — *Breaking the Cloud*

## Author

Carlos Cortez — [LinkedIn](https://www.linkedin.com/in/carloscortezcloud) · [X](https://x.com/ccortezb) · [GitHub](https://github.com/ccortezb)

## License

Apache 2.0.

---

<p align="center">
  <a href="https://breakingthecloud.com">breakingthecloud.com</a> · <a href="https://cortez.cloud">cortez.cloud</a>
</p>
<p align="center">
  <sub>If you can't observe it, you can't improve it.</sub>
</p>
