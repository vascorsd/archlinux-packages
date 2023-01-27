## what's here ?

Here be stuff used in scala ecosystem or somewhat related to 
jvm stuff packaged in a way I like for usage in archlinux.


### main packages

| tool      | jvm-bin  | native-bin  |
|-----------|----------|-------------|
| coursier  | ✔️        | ✔️           |
| bloop     | ⭕       | ✔️           |
| scalafmt  | ✔️        | ✔️           |
| scalafix  | ✔️        | ⭕          |
| metals    | ✔️        | ⭕          |
| scala-cli | ⭕       | ✔️           |

**Legend**:  
✔️ - tool available in this configuration  
⭕ - tool NOT available in this configuration  


#### other stuff

 * **flix** - the programming language - https://github.com/flix/flix


## why not use other already provided packages ?

 - I wanted to learn how to properly package and maintain archlinux stuff, still learning.
 - I'm particular about how some things should be packaged.
 - I want a clear distinction between tool packaged using jvm and native binaries.
 - I want both jvm and native binaries to coexist installed at the same time in the machine.

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
packaged.

I'm following the pattern of adding "-bin" to prebuilt binaries.

**Native pre built binaries** follow the "tool-bin" naming.

**Jvm prebuild binaries / classes / released** on maven or wtv and being
wrapped in a launcher using coursier follow the pattern "tool-jvm-bin".

In order for coexisting packages on the system, all the jvm stuff
installs their binaries with the prefix "-jvm". For example, coursier
from the "coursier-bin" is installed in the system as "coursier" and 
the coursier from "coursier-jvm" is installed as "coursier-jvm".

Because of this both packages don't conflict with each other.

I had the idea of also having the tools package by directly compiling
them with sbt, but that seems a huge endeavour and I didn't get to it.
But for those they would be named without the prefix "-bin".


## so, do you keep this updated ?

Eh, not really much. Sometimes I update them, at least some packages I
use more regularly then others and for some tools I just update the package
version I'm interested at the moment usually the native-bin as that is what
makes more sense. Nobody sane wants to use tooling that needs a jvm to
be running.

I can at least say that I have them installed on at least a machine but I
don't usually code on it much.

But they may be a good base for others to edit for their usages.


## repo

Sometimes I sync things here:

````
[repo:~vascorsd]
Server = https://repo.vascorsd.com
SigLevel = Optional TrustAll
````
