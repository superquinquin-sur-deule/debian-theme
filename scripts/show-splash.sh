#!/usr/bin/bash
set -uo pipefail

plymouth-set-default-theme superquinquin
plymouthd
plymouth show-splash

sleep 5
plymouth quit
