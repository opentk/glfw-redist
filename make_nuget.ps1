param([String]$projectDir, [int]$verBuild)

$ErrorActionPreference = "Stop"
[String]$GLFW_VERSION="3.3.7"

$buildVersionResult = $verBuild.ToString()
$currentBranch=(git log -n 1 --pretty=%D HEAD)
$splt = [regex]::split($currentBranch, "(\s*,\s+)|(\s+->\s+)")
$currentBranch=$splt[2]
$splt = $currentBranch -split "/"
$currentBranch = $splt[$splt.Length - 1]
Write-Output "Current Branch: $currentBranch"

if($currentBranch -eq "develop") {
    $buildVersionResult = "0-pre" + (Get-Date).ToUniversalTime().ToString("yyyyMMddHHmmss")
}

./download_dependencies.ps1 $GLFW_VERSION


$header = Get-Content([System.IO.Path]::Combine($projectDir, ".\tmp\src\include\GLFW\glfw3.h")) | Out-String

if ($header -match '(?m)^#define\s+GLFW_VERSION_MAJOR\s+(\d+)\s*$') { $verMajor = $Matches[1] }
else { throw "Failed to parse major version number from header." }
if ($header -match '(?m)^#define\s+GLFW_VERSION_MINOR\s+(\d+)\s*$') { $verMinor = $Matches[1] }
else { throw "Failed to parse minor version number from header." }
if ($header -match '(?m)^#define\s+GLFW_VERSION_REVISION\s+(\d+)\s*$') { $verPatch = $Matches[1] }
else { throw "Failed to parse patch version number from header." }

$version = "$verMajor.$verMinor.$verPatch.$buildVersionResult"

$nuspec = [System.IO.Path]::Combine($projectDir, ".\glfw-redist.csproj")

dotnet pack $nuspec -c Release -p:VERSION="$version" -p:GLFW_VERSION="$GLFW_VERSION" -o ./artifacts
