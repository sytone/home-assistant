# script/bootstrap: Resolve all dependencies that the application requires to
#                   run.

Resolve-Path "$PSScriptRoot\.."

.\script\bootstrap_server.ps1
.\script\bootstrap_frontend.ps1
