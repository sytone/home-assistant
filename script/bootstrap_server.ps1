Resolve-Path "$PSScriptRoot\.."

Write-Host "Installing dependencies..." -ForegroundColor Green
python -m pip install -r requirements_all.txt

$REQ_STATUS=$?

echo  "Installing development dependencies.."
python -m pip install -r requirements_test.txt

$REQ_DEV_STATUS=$?

if($REQ_DEV_STATUS -eq 0 ) {
  return $REQ_STATUS
} else {
  return $REQ_DEV_STATUS
}
