# Builds the frontend for production

Resolve-Path "$PSScriptRoot\.."

cd homeassistant/components/frontend/www_static
Remove-Item core.js* -Force -Recurse
Remove-Item frontend.html* -Force -Recurse
Remove-Item webcomponents-lite.min.js* -Force -Recurse
Remove-Item panels -Force -Recurse
cd home-assistant-polymer
npm run clean
npm run frontend_prod

Write-Host "Moving files around..." -ForegroundColor Green
Copy-Item bower_components/webcomponentsjs/webcomponents-lite.min.js ..
Copy-Item  build/* .. -Recurse
$env:BUILD_DEV=0 
Write-Host "Running gen service worker" -ForegroundColor Green
node script/gen-service-worker.js
Write-Host "Moving service worker js file" -ForegroundColor Green
Copy-Item build/service_worker.js ..

cd ..

# Assuming you have gzip on the path somewhere. Have not replicated function in powershell at this point. 
# http://downloads.sourceforge.net/project/gnuwin32
Write-Host "Performing gzip on files." -ForegroundColor Green
gzip -f -k -9 *.html *.js ./panels/*.html

Write-Host "Generate the MD5 hash of the new frontend" -ForegroundColor Green
cd ../../../..
python script/fingerprint_frontend.py
