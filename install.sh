#!/bin/bash
set -euo pipefail

brew bundle --global && \
        brew update && \
        brew upgrade
