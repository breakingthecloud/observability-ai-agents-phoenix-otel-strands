#!/bin/bash
# Setup environment for Observability AI Agents notebook
# Uses uv for fast dependency management with Python 3.10
#
# Usage:
#   First time:  ./setup_env.sh install
#   Every time:  ./setup_env.sh start

DIR="$(cd "$(dirname "$0")" && pwd)"
VENV="$DIR/.venv"
KERNEL_NAME="observability-agents"

case "${1:-start}" in
  install)
    echo "🔧 Creating venv with Python 3.10 (via uv)..."
    rm -rf "$VENV"
    uv venv --python 3.10 "$VENV"
    source "$VENV/bin/activate"

    echo "📦 Installing dependencies..."
    uv pip install jupyterlab ipykernel \
      strands-agents strands-agents-tools \
      arize-phoenix \
      openinference-instrumentation-bedrock \
      opentelemetry-sdk opentelemetry-exporter-otlp \
      boto3 aws-xray-sdk

    echo "🧠 Registering Jupyter kernel..."
    python -m ipykernel install --user --name="$KERNEL_NAME" --display-name="Observability Agents"

    deactivate
    echo ""
    echo "✅ Done! Now run: ./setup_env.sh start"
    ;;

  start)
    if [ ! -d "$VENV" ]; then
      echo "❌ Venv not found. Run './setup_env.sh install' first."
      exit 1
    fi
    echo "🚀 Launching JupyterLab..."
    echo "   Kernel: $KERNEL_NAME"
    echo "   Notebook: $DIR"
    echo ""
    source "$VENV/bin/activate"
    cd "$DIR" && jupyter lab
    ;;

  *)
    echo "Usage: ./setup_env.sh [install|start]"
    ;;
esac
