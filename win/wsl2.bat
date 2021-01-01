@ECHO OFF
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart   
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart


wsl --set-default-version 2

echo wsl2.bat: ok? restart if wsl 127s
echo wsl2.bat: failures? https://docs.microsoft.com/en-us/windows/wsl/install-win10
