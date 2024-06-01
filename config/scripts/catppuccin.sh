#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

curl -LsSO "https://raw.githubusercontent.com/catppuccin/gtk/v1.0.2/install.py"

python3 install.py macchiato teal