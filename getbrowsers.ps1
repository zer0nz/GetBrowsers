<#
    Script gets Info from Browsers
#>

param([parameter(Mandatory=$false,
    HelpMessage="Enter Server Name")]
    $Servers)

foreach ($Server in $Servers) 
{
    get-Browserinfo $server
}

Function get-Browserinfo([string]$system)
{
    # It's easier to have file path in a variable
    $FireFox = "\\$system\c$\Program Files\Mozilla Firefox\firefox.exe"
    $FireFox32 = "\\$system\c$\Program Files (x86)\Mozilla Firefox\firefox.exe"
    $Edge = "\\$system\c$\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
    $chrome = "\\$system\c$\Program Files\Google\Chrome\Application\chrome.exe"
    $iexplore = "\\$system\c$\Program Files\internet explorer\iexplore.exe"
    $notepadplusplus = "\\$system\c$\Program Files (x86)\Notepad++\notepad++.exe"
    
    Write-Host '  Server :' $system -ForegroundColor Green

    $2find = $iexplore
    # Is the DLL there?    
    if  ( Test-Path  $2find){
        $iExplorever = [System.Diagnostics.FileVersionInfo]::GetVersionInfo($2find).FileVersion
        write-host 'iExplore : ' -ForegroundColor Cyan -NoNewline
        Write-Host $iExplorever -ForegroundColor Yellow
    }

    $2find = $edge
    # Is the DLL there?    
    if  ( Test-Path  $2find){
        $Edgever = [System.Diagnostics.FileVersionInfo]::GetVersionInfo($2find).FileVersion
        write-host ' MS Edge : ' -ForegroundColor Cyan -NoNewline
        write-host $Edgever -ForegroundColor Yellow
    }

    $2find = $FireFox
    # Is the DLL there?    
    if  ( Test-Path  $2find){
        $FireFoxver = [System.Diagnostics.FileVersionInfo]::GetVersionInfo($2find).FileVersion
        write-host ' FireFox : ' -ForegroundColor Cyan -NoNewline
        Write-Host $FireFoxver -ForegroundColor Yellow
    }
    
     $2find = $FireFox32
    # Is the DLL there?    
    if  ( Test-Path  $2find){
        $FireFoxver32 = [System.Diagnostics.FileVersionInfo]::GetVersionInfo($2find).FileVersion
        write-host 'FireFox32 : ' -ForegroundColor Cyan -NoNewline
        Write-Host $FireFoxver32 -ForegroundColor Yellow
    }

    $2find = $chrome
    # Is the DLL there?    
    if  ( Test-Path  $2find){
        # Yup, get the version info
        $chromever = [System.Diagnostics.FileVersionInfo]::GetVersionInfo($2find).FileVersion
        write-host '  Chrome : ' -ForegroundColor Cyan -NoNewline
        write-host $chromever -ForegroundColor Yellow
    }
    Write-Host ''
}
