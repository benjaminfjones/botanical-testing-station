#!/bin/bash

set -eu


echo "Building site..."
mkdir -p public
marmite -v . public/

echo "Syncing to tilde.club..."
rsync -avz public/* tilde:public_html/botanical-testing-station

echo "Done."
