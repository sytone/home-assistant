# script/server: Launch the application and any extra required processes
#                locally.

Resolve-Path "$PSScriptRoot\.."

python -m homeassistant -c config
