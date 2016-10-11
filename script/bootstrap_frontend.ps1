Write-Host "Bootstrapping frontend..." -ForegroundColor Green
git submodule update
cd homeassistant/components/frontend/www_static/home-assistant-polymer
npm install
./node_modules/.bin/bower install
npm run setup_js_dev
cd ../../../../..
