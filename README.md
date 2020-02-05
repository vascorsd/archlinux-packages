## Coursier

Available in two flavours. The more usual jvm wrapper thing in itself and the released native version.

Native version is really much faster at launching.

example:

    ~/d/p/a/p/coursier-jvm (master|✚1…) $ time coursier --help
    Coursier 2.0.0-RC5-3
    Usage: cs [options] [command] [command-options]

    Available commands: bootstrap, complete, fetch, install, install-path, launch, publish, resolve, sonatype, spark-submit, update

    Type  cs command --help  for help on an individual command
    0.00user 0.00system 0:00.00elapsed 100%CPU (0avgtext+0avgdata 14516maxresident)k
    0inputs+0outputs (0major+435minor)pagefaults 0swaps
    ~/d/p/a/p/coursier-jvm (master|✚1…) $ time coursier-jvm --help
    Coursier 2.0.0-RC5-3
    Usage: coursier [options] [command] [command-options]

    Available commands: bootstrap, complete, fetch, install, install-path, launch, publish, resolve, sonatype, spark-submit, update

    Type  coursier command --help  for help on an individual command
    2.31user 0.09system 0:00.97elapsed 246%CPU (0avgtext+0avgdata 99324maxresident)k
    0inputs+0outputs (0major+23887minor)pagefaults 0swaps

# Bloop

A much simpler version that unwraps all the craziness in the the python install script. It's not needed when
you know what is actually need to install. Ideally I'd want to locally build it.

Depends on the coursier being available installed already.
