$output = "$PSScriptRoot\coverage.xml"
If (Test-Path $output) {
	Remove-Item $output -Force
}

dotnet test -f netcoreapp2.0 /p:CollectCoverage=true /p:CoverletOutputFormat=opencover /p:CoverletOutput=$output ../source/tusdotnet.sln
$key = Read-Host -Prompt 'Input Codecov key'
./codecov.sh -f "coverage.xml" -t $key
