#!/bin/bash

set -eu

echo "Syncing to tilde.club"

marmite . public/
pushd public
rsync -avz * tilde:public_html/botanical-testing-station
popd

echo "Done."
