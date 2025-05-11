#!/bin/bash

set -euo

echo "Syncing to tilde.club"

pushd public
rsync -avz * tilde:public_html/botanical-testing-station
popd

echo "Done."
