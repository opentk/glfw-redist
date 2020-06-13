# OpenTK GLFW redist #

Because opentk has it's own needs when it comes to it's nuget glfw redist package this repository was created to manage our own version of the fantastic glfw-redist project originally found here: https://bitbucket.org/sgrottel_nuget/glfw

# GLFW NuGet #

![GLFW Icon](glfw.png)

This repository contains all files and information to create a NuGet package out of the official pre-compiled binaries of GLFW.

We do not compile the library myself! We only package the available pre-compiled binaries.

GLFW is licensed under the [zlib/libpng license](http://www.glfw.org/license.html).

Project Website: http://www.glfw.org/

## How do I get set up? ##

* Download the pre-compiled GLFW for Windows (`WIN32` and `WIN64`): http://www.glfw.org/download.html
* Copy the following items into the corresponding folders:
    * `docs` > `.`
    * `include` > `.`
    * `lib-vc2010` > `Win32`
    * `lib-vc2012` > `Win32` or `x64`
    * `lib-vc2013` > `Win32` or `x64`
    * `lib-vc2015` > `Win32` or `x64`
    * `lib-vc2017` > `Win32` or `x64`
    * `lib-vc2019` > `Win32` or `x64`
    * `COPYING.txt` > `docs`
* You might need to adjust `glfw.nuspec`, `glfw.targets`, and `glfw-propertiesui.xml`
    * `glfw.nuspec` stores the meta data and which files to include in the package.
	* `glfw.targets` contains all MSBuild settings to consume the package. This includes automatic adjustment of platforms, configurations and toolsets.
	* `glfw-propertiesui.xml` provides some Visual Studio UI to allow the consume of the package to force some settings.

## Building the NuGet Package ##

Install nuget command line tool.

Run: `make_nuget.ps1 . 5`

The first argument is this project directory.

The second argument is the build number, which is to be increased each time a new package for the same version is published.
