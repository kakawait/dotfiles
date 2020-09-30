#!/usr/bin/env sh

cd ~/.config/polybar/gmail
poetry run ./launch.py -c '#dadce0' --prefix-unread "${1:-}" --prefix-read "${2:-}" 