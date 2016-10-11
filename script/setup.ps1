
Resolve-Path "$PSScriptRoot\.."

Write-Host "This assume you have python installed and in the PATH"
Write-Host "It also assume you have node.js installed. "
Write-Host "If you are running this script it is assumed you know how to install the above items :)"

git submodule init
.\script\bootstrap.ps1
python setup.py develop
