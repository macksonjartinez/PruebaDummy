$agentWorkDirectory = $env:AGENT_BUILDDIRECTORY

for ($i = 1; $i -le 10; $i++) {
    $currentDate = Get-Date -Format "yyyyMMddHHmmss"
    $randomNumber = Get-Random -Minimum 1 -Maximum 1000
    $fileName = Join-Path $agentWorkDirectory ("File_${currentDate}_${randomNumber}.txt")
    New-Item -Path $fileName -ItemType File
    Write-Host "Se ha creado el archivo $fileName"
}