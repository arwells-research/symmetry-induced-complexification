#!/usr/bin/env bash
set -euo pipefail

# build_paper.sh
# Build the LaTeX paper using latexmk, placing artifacts under paper/build/,
# and exporting a canonical PDF name at repo root.
#
# Usage:
#   ./build_paper.sh
#   ./build_paper.sh --clean
#   ./build_paper.sh --deepclean
#
# Notes:
# - Requires: latexmk, pdflatex (or equivalent), bibtex/biber (per your toolchain).
# - Assumes paper entrypoint is: paper/main.tex

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PAPER_DIR="${ROOT_DIR}/paper"
OUT_DIR="${PAPER_DIR}/build"

MAIN_TEX="${PAPER_DIR}/main.tex"
MAIN_BASENAME="main"

# Canonical export name at repo root (edit if you prefer a different convention)
RELEASE_PDF="${ROOT_DIR}/symmetry-induced-complexification-arwells.pdf"

if [[ ! -f "${MAIN_TEX}" ]]; then
  echo "ERROR: expected ${MAIN_TEX} to exist."
  exit 1
fi

need_cmd() {
  command -v "$1" >/dev/null 2>&1 || {
    echo "ERROR: missing required command: $1"
    exit 1
  }
}

need_cmd latexmk

mkdir -p "${OUT_DIR}"

CLEAN_MODE="none"
if [[ "${1-}" == "--clean" ]]; then
  CLEAN_MODE="clean"
elif [[ "${1-}" == "--deepclean" ]]; then
  CLEAN_MODE="deepclean"
elif [[ "${1-}" != "" ]]; then
  echo "Usage: $0 [--clean|--deepclean]"
  exit 2
fi

if [[ "${CLEAN_MODE}" == "clean" ]]; then
  echo "[clean] latexmk -c (outdir=${OUT_DIR})"
  latexmk -cd -outdir="${OUT_DIR}" -c "${MAIN_TEX}"
  exit 0
fi

if [[ "${CLEAN_MODE}" == "deepclean" ]]; then
  echo "[deepclean] removing ${OUT_DIR} and release PDF"
  rm -rf "${OUT_DIR}"
  rm -f "${RELEASE_PDF}"
  exit 0
fi

echo "[build] compiling ${MAIN_TEX}"
latexmk \
  -cd \
  -pdf \
  -bibtex \
  -interaction=nonstopmode \
  -halt-on-error \
  -file-line-error \
  -auxdir="${OUT_DIR}" \
  -outdir="${OUT_DIR}" \
  -g \
  "${MAIN_TEX}"

BUILT_PDF="${OUT_DIR}/${MAIN_BASENAME}.pdf"
if [[ ! -f "${BUILT_PDF}" ]]; then
  echo "ERROR: expected build output ${BUILT_PDF} not found."
  exit 1
fi

echo "[export] ${BUILT_PDF} -> ${RELEASE_PDF}"
cp -f "${BUILT_PDF}" "${RELEASE_PDF}"

echo "[ok] build complete"
