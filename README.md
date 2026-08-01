# externals

## About

This repository contains the external/vendor/3rd-party libraries I use in my
personal projects, these are just amazing :).

Why create a separate repository? The idea is quite simple, to bundle all the
external projects into one project which knows how to build and itself and so
this makes consuming these libraries easy, hopefully ;).

## Archival Note

> [!NOTE]
> This was a BAD IDEA! It built/installed the dependencies used across many of my
> personal projects, so all of them were cloned/built even when not used in some
> project.
>
> This in itself was not a bad idea, but it was too early to do it, the make macros
> which wrap around various build systems are elegant to say the least, documented
> at https://printfdebugging.in/TextEditor/0002-build-system-migration
> 
> Doing it early in the project adds unnecessary burden of maintainance or just
> extra work to keep things "perfect/elegant". And before you know you are pushing
> more chore/cleanup/build commits than the feature commits. At early stages, you
> would want to abstract as little as possible, and keep the build system minimal
> to avoid unnecessary work.

## Build Steps
```bash
cd foo
git submodule add https://github.com/printfdebugging/external external
git submodule update --init --recursive
make -C external install

# all the submodules/libraries are installed in the parent directory (foo) with
# their pkgconfig files in foo/install/lib/pkgconfig. Any build system can just point
# to that directory and consume these libraries.

# it also creates a foo/.clangd file which points to the build directories of
# these libraries, so  clangd works quite well with this approach, though for autotools
# projects some work must be done to integrate bear and generate a compdb.
```
