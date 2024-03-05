Param([parameter(Mandatory=$true,Position=0)][String]$GLFW_VERSION)

New-Item -ItemType Directory -Force -Path tmp

try{
    Invoke-WebRequest -Uri https://opentk.net/assets/opentk.png -OutFile tmp/opentk.png -Resume
} catch [System.NullReferenceException] {
}

try{
    Invoke-WebRequest -Uri https://github.com/glfw/glfw/releases/download/$GLFW_VERSION/glfw-$GLFW_VERSION.bin.WIN32.zip -OutFile tmp/win32.zip -Resume
} catch [System.NullReferenceException] {
}
try{
    Invoke-WebRequest -Uri https://github.com/glfw/glfw/releases/download/$GLFW_VERSION/glfw-$GLFW_VERSION.bin.WIN64.zip -OutFile tmp/win64.zip -Resume
} catch [System.NullReferenceException] {
}

try{

    Invoke-WebRequest -Uri https://github.com/glfw/glfw/releases/download/$GLFW_VERSION/glfw-$GLFW_VERSION.bin.MACOS.zip -OutFile tmp/macos.zip -Resume
} catch [System.NullReferenceException] {
}

try{
    Invoke-WebRequest -Uri https://github.com/glfw/glfw/releases/download/$GLFW_VERSION/glfw-$GLFW_VERSION.zip -OutFile tmp/source.zip -Resume
} catch [System.NullReferenceException] {
}

Expand-Archive -Path tmp/win32.zip -DestinationPath tmp/ -Force
Expand-Archive -Path tmp/win64.zip -DestinationPath tmp/ -Force
Expand-Archive -Path tmp/macos.zip -DestinationPath tmp/ -Force
Expand-Archive -Path tmp/source.zip -DestinationPath tmp/ -Force
if (Test-Path tmp/src) {
    Remove-Item -Recurse -Path tmp/src
}
Rename-Item -Path tmp/glfw-$GLFW_VERSION -NewName src

mkdir tmp/src/build
Push-Location tmp/src/build
cmake -DCMAKE_BUILD_TYPE=Release -DGLFW_BUILD_EXAMPLES=OFF -DGLFW_BUILD_TESTS=OFF -DGLFW_BUILD_DOCS=OFF -DBUILD_SHARED_LIBS=ON -DGLFW_BUILD_X11=ON -DGLFW_BUILD_WAYLAND=ON ..

if ($LastExitCode -ne 0) {
    throw 'GLFW compilation setup failed'
}

make -j

if ($LastExitCode -ne 0) {
    throw 'GLFW compilation failed'
}

Pop-Location
