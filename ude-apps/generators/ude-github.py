#!/usr/bin/env python3

async def generate(hub, **pkginfo):
    framework = await hub.pkgtools.github.release_gen(
        hub,
        "MadLadSquad",
        "UntitledImGuiFramework",
        tarball="untitled-imgui-framework.tar.xz"
    )
    application = await hub.pkgtools.github.release_gen(
        hub,
        pkginfo["user"],
        pkginfo["repo"],
        tarball=pkginfo["tarball"],
    )

    ebuild = hub.pkgtools.ebuild.BreezyBuild(
        **pkginfo,
        version=application["version"],
        artifacts=[framework["artifacts"][0], application["artifacts"][0]]
    )
    ebuild.push()
