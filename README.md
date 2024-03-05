# OpenTK GLFW redist #

Because opentk has it's own needs when it comes to it's nuget glfw redist package this repository was created to manage our own version of the fantastic glfw-redist project originally found here: https://bitbucket.org/sgrottel_nuget/glfw

# GLFW NuGet #

![GLFW Icon](glfw.png)

This repository contains all files and information to create a NuGet package out of the official pre-compiled binaries of GLFW.

We do not compile the library myself! We only package the available pre-compiled binaries.

GLFW is licensed under the [zlib/libpng license](http://www.glfw.org/license.html).

Project Website: http://www.glfw.org/

We are as of `3.3.8.35` using the `static-ucrt` build of GLFW on windows which means that "Visual C++ Redistributable 2015" is no longer a requirement.
Previous versions of this package was using the `VS2019` binaries which recuired "Visual C++ Redistributable 2015" to be installed.

## How do I get set up? ##

Currently only works on Linux

## Building the NuGet Package ##

Install nuget command line tool.

Run: `make_nuget.ps1 . 5`

The first argument is this project directory.

The second argument is the build number, which is to be increased each time a new package for the same version is published, version number is automatically ends with -pre[TIMESTAMP] on the develop branch.
