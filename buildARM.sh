#!/usr/bin/env bash

# Get the program version from the command-line argument or Git tag
PROGVER="${1:-$(git describe --tag)}"
CURRENT_DIR=$(pwd)
OUT_DIR="${CURRENT_DIR}/out"
PROGNAME="taierspeed-cli"
BINARY="${PROGNAME}-$(go env GOOS)-aarch64"
BUILD_DATE=$(date -u "+%Y-%m-%d %H:%M:%S %Z")

# Create the output directory if it doesn't exist
if [[ ! -d ${OUT_DIR} ]]; then
  mkdir -p "${OUT_DIR}"
fi

# Remove the old binary if it exists
if [[ -e ${OUT_DIR}/${BINARY} ]]; then
  rm -f "${OUT_DIR}/${BINARY}"
fi

# Build the binary for aarch64
GOARCH=arm64 GOOS=linux go build -o "${OUT_DIR}/${BINARY}" -a main.go

echo "Build completed for aarch64: ${OUT_DIR}/${BINARY}"
