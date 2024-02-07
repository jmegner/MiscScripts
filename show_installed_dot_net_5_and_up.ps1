$DotNetPath = 'C:\Program Files\dotnet\dotnet.exe'
Write-Host "DotNetPath: $DotNetPath"

$runtimes = @()

foreach ($runtime in & $DotNetPath --list-runtimes) {
    if ($runtime -match '^(?<RuntimeType>\S+)\s+(?<Version>[\d.]+)\s+\[(?<Path>.+)\]\s*$') {
        $runtimes += [PSCustomObject] @{
            RuntimeType = $Matches['RuntimeType']
            RuntimeVersion = $Matches['Version']
            RuntimePath = $Matches['Path']
        }
    }
    else {
        Write-Warning "Unrecognized output from '$DotNetPath --list-runtimes'. Output was '$runtime'."
    }
}

$runtimes | Format-Table

$sdks = @()

foreach ($sdk in & $DotNetPath --list-sdks) {
    if ($sdk -match '^(?<Version>[\d.]+)\s+\[(?<Path>.+)\]\s*$') {
        $sdks += [PSCustomObject] @{
            SDKVersion = $Matches['Version']
            SDKPath = $Matches['Path']
        }
    }
    else {
        Write-Warning "[$Env:ComputerName] Unrecognized output from '$InnerDotNetExePath --list-sdks'. Output was '$sdk'."
    }
}

$sdks | Format-Table
