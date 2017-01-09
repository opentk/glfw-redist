# GLFW NuGet #

![GLFW Icon](https://bytebucket.org/sgrottel_nuget/glfw/raw/7bab6beb2556f884bb37f730571e09341993197d/glfw.png)

This repository contains all files and information to create a NuGet package out of the officiel pre-compiled binaries of GLFW.

I do not compile the library myself! I only package the available pre-compiled binaries.

For problems with the NuGet package contact SGrottel: 

* https://bitbucket.org/sgrottel_nuget/glfw
* http://www.sgrottel.de
* http://go.sgrottel.de/nuget/glfw

For problems with the library itself contact the authors:

* http://www.glfw.org/

## GLFW ##

[GLFW](http://www.glfw.org/) is an Open Source, multi-platform library for creating windows with OpenGL contexts and receiving input and events.
It is easy to integrate into existing applications and does not lay claim to the main loop.

GLFW is written in C and has native support for Windows, OS X and many Unix-like systems using the X Window System, such as Linux and FreeBSD.

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
    * `COPYING.txt` > `docs`

## Building the NuGet Package ##

Install CoApp Tools: http://coapp.org/

* http://coapp.org/tutorials/installation.html
* http://coapp.org/tutorials/building-a-package.html

Navigate your Powershell to the repository.

Run: `Write-NuGetPackage .\GLFW.autopkg`