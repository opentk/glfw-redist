param([String]$projectDir, [int]$verBuild)

$header = gc([System.IO.Path]::Combine($projectDir, ".\include\GLFW\glfw3.h")) | Out-String

$header -match '(?m)^#define\s+GLFW_VERSION_MAJOR\s+(\d+)\s*$' | Out-Null
$verMajor = $Matches[1]
$header -match '(?m)^#define\s+GLFW_VERSION_MINOR\s+(\d+)\s*$' | Out-Null
$verMinor = $Matches[1]
$header -match '(?m)^#define\s+GLFW_VERSION_REVISION\s+(\d+)\s*$' | Out-Null
$verPatch = $Matches[1]

$version = "$verMajor.$verMinor.$verPatch.$verBuild"

$nuspec = [System.IO.Path]::Combine($projectDir, ".\glfw.nuspec")

nuget pack $nuspec -properties version=$version
