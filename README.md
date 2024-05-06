# UntitledDesktopOverlay
[![MIT license](https://img.shields.io/badge/License-MIT-blue.svg)](https://lbesson.mit-license.org/)
[![trello](https://img.shields.io/badge/Trello-UDE-blue])](https://trello.com/b/HmfuRY2K/untitleddesktop)
[![Discord](https://img.shields.io/discord/717037253292982315.svg?label=&logo=discord&logoColor=ffffff&color=7389D8&labelColor=6A7EC2)](https://discord.gg/4wgH8ZE)

An overlay containing Gentoo/Funtoo ebuilds and autogens for the applications and libraries part of the UntitledDesktopEvironment project and other
applications by [MadLadSquad](https://madladsquad.com/)

## Installation
You can install this via layman: `root # layman -o https://raw.githubusercontent.com/MadLadSquad/UntitledDesktopOverlay/master/repositories.xml -f -a untitled-desktop-overlay`

## Contributing
Issues, PRs, discussions and documentation can all be found on github [here](https://github.com/MadLadSquad/UntitledDesktopOverlay)

## The full package
Don't have a graphical environment? You can directly emerge the `untitled-desktop-full` package which installs the applications for the following tasks:
1. Window manager - KWin
1. Display manager - SDDM
1. File manager - UntiledFileManager
1. Widgets - UntitledWidgets
1. Terminal - UntitledTerminalEmulator
1. Text editor - UntitledTextEditor
1. Video and audio player - vlc
1. Image viewer - UntitledImageViewer
1. Office suite - LibreOffice
1. Email client - Thunderbird
1. Task manager - xfce4-task-manager

additionally other backend applications like the session manager and power manager are also installed

## The meta package
Don't want the full array of third party applications installed by the full package? You can install the `untitled-desktop-meta` package to download only 
the following ones:
1. File manager - UntitledFileManager
1. Widgets - UntitledWidgets
1. Terminal - UntitledTerminalEmulator
1. Session, power managers and other utility applications provided by us
