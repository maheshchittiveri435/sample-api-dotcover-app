#!/bin/sh

set -e -u

D=$(dirname "$0")
exec "$D/runtime-dotnet.sh" exec --runtimeconfig "$D/dotCover.unix.runtimeconfig.json" "$D/dotCover.exe" "$@"
