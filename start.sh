#!/bin/bash
set -e

if [ -z "$1" ]; then
  echo "Usage: $0 [--start-dev | --build]"
  exit 1
fi

PROJECT_DIR=$(pwd)
echo "Project directory: $PROJECT_DIR"

PYTHON_PATH="$PROJECT_DIR/venv/Scripts/python.exe"

cd "$PROJECT_DIR/backend"
echo "Changed to backend directory: $(pwd)"

"$PYTHON_PATH" -m uvicorn server:app --reload &
BACKEND_PID=$!

cd ../frontend || exit 1
npm run format

if [ "$1" == "--start-dev" ]; then
  npm run dev &
  FRONTEND_PID=$!
elif [ "$1" == "--build" ]; then
  npm run build
fi

echo "Press [CTRL+C] to stop both servers."

cleanup() {
  [[ -n "$FRONTEND_PID" ]] && kill "$FRONTEND_PID"
  kill "$BACKEND_PID"
  exit 0
}

trap cleanup SIGINT SIGTERM
wait
