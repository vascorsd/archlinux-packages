## what's here ?

Here be some end user tools / binaries used in scala ecosystem
packaged in a way I like for usage in archlinux.


## why not use other already provided packages ?

I'm weirdo and don't like what I see on other places.
I want a clear distinction between jvm based binary "tools" / "launchers"
on my day to day usage so I'm aware of it.
Better yet i want to be allowed to have the both versions (jvm and native)
if available installed since some work better in one way or another.
For example coursier had very different behaviours for a while, so
being able to have both installed and manually choose which fits better
which situation is better.


## there seems to be different packages for the same tools ?

The archlinux packaging usualy follows the package name as "tool"
for things build from sources. For things packaged without compilation
which use pre build binaries it's usually using the name "tool-bin".

Since we have the amazing problem of people trying to release end user
system tools which unfortunatly use the jvm but also the great effort
to directly compile some of them into native binaries bypassing the need
for the jvm, there comes the need to distinguish which version is being
packaged here.

I'm following the pattern of adding "-bin" to prebuilt binaries.

**Native pre built binaries** follow the "tool-bin" naming.

**Jvm prebuild binaries / classes / released** on maven or wtv and being
wrapped in a launcher using coursier follow the pattern "tool-jvm-bin".

In order for coexisting packages on the system, all the jvm prebuilt stuff
installs their binaries with the prefix "-jvm". For example, coursier
from the "coursier-bin" is installed in the system as "coursier" and 
the coursier form "coursier-jvm" is installed as "coursier-jvm".

Because of this both the packaged don't conflict with each other.

I had the idea of also having the tools package by directly compiling
them with sbt, but that seems a huge endeavour and I didn't get to it.
But for those they would be named without the prefix "-bin".

There are also a "-git" package for some (example seed) which following
normal archlinux packaging naming would mean they are getting unstable
versions based on updated git commits.

For seed in particular there exists the one named "seed-jvm-bin-git"
which following the huge book I just wrote means that it is getting a
prebuild jvm binary based on unreleased version. (makes sense if a CI
is building and publishing the built stuff on every commit for example).


## so, do you keep this updated ?

Eh, not really much. Sometimes I update them, at least some packages I
use more regularly then others and for some tools I just update the package
version I'm interested at the moment usually the native-bin as that is what
makes more sense. Nobody sane wants to use tooling that needs a jvm to
be running.

I can at least say that I have them installed on at least a machine but I
don't usually code on it much.

But they may be a good base for others to edit for their usages.


## available matrix


|   tool     |  jvm-bin (git, source)   |  native-bin (git, source)  |
| ---------- | ------------------------ | -------------------------- |
| coursier   |     ✅ (❌, ❌)          |      ✅ (❌, ❌)           |
| bloop      |     ❌ (❌, ❌)          |      ✅ (❌, ❌)           |
| scalafmt   |     ✅ (❌, ❌)          |      ✅ (❌, ❌)           |
| scalafix   |     ✅ (❌, ❌)          |      ❌ (❌, ❌)           |
| metals     |     ✅ (❌, ❌)          |      ❌ (❌, ❌)           |
| scala-cli  |     ❌ (❌, ❌)          |      ✅ (❌, ❌)           |
| (A) ~seed~ |     ✅ (✅, ❌)          |      ❌ (❌, ❌)           |
