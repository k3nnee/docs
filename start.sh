#!/bin/bash

cd frontend || exit 1
npm run format
if [ "$1" == "--start-dev" ]; then
  npm run dev
elif [ "$1" == "--build" ]; then
  npm run build
fi