param([String]$projectDir, [int]$verBuild)
$ErrorActionPreference = "Stop"

$header = Get-Content([System.IO.Path]::Combine($projectDir, ".\include\GLFW\glfw3.h")) | Out-String

if ($header -match '(?m)^#define\s+GLFW_VERSION_MAJOR\s+(\d+)\s*$') { $verMajor = $Matches[1] }
else { throw "Failed to parse major version number from header." }
if ($header -match '(?m)^#define\s+GLFW_VERSION_MINOR\s+(\d+)\s*$') { $verMinor = $Matches[1] }
else { throw "Failed to parse minor version number from header." }
if ($header -match '(?m)^#define\s+GLFW_VERSION_REVISION\s+(\d+)\s*$') { $verPatch = $Matches[1] }
else { throw "Failed to parse patch version number from header." }

$version = "$verMajor.$verMinor.$verPatch.$verBuild"

$nuspec = [System.IO.Path]::Combine($projectDir, ".\glfw.nuspec")

dotnet pack $nuspec -properties version=$version
