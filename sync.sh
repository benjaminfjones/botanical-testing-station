#!/bin/bash

set -eu

echo "Syncing to tilde.club"

marmite -v . public/
rsync -avz public/* tilde:public_html/botanical-testing-station

echo "Done."
