#!/run/current-system/sw/bin/bash

nixos-rebuild switch --flake .

mv /configs/lldbinit ~/.lldbinit
