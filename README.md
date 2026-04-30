# How I Monitor My AI Agents: CloudWatch + Arize Phoenix + LLM-as-Judge

Three-layer observability for AI agents built with Strands Agents SDK and Amazon Bedrock.

| Layer | Tool | What it answers |
|---|---|---|
| **AI Traces** | Arize Phoenix | What did the agent think? Which tools did it call? |
| **Infrastructure** | Amazon CloudWatch | Is the system healthy? How fast? How much does it cost? |
| **Quality Evals** | LLM-as-Judge | Was the response actually good? |

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

## Blog Post

📝 [How I Monitor My AI Agents: CloudWatch for Infra, Arize Phoenix for Traces, LLM-as-Judge for Quality](https://dev.to/ccortezb) — *Breaking the Cloud*

## Author

Carlos Cortez — [LinkedIn](https://www.linkedin.com/in/carloscortezcloud) · [X](https://x.com/ccortezb) · [GitHub](https://github.com/ccortezb)
