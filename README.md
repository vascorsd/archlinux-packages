Some Scala language related tools are packaged.
There are a few variations. Usually when those things are released
it's common for some pre compiled binaries to be released for easier access to end
users that don't want to compile stuff. Also recently with the advent of scala-native
and graal, some of them are also provided pre-compiled for native platforms.

Each tool here reflects those things in the following way:

  * jvm-bin - usually the jvm compiled binary that was released to maven
    or something like that. The way to install those is by using the coursier
    tool that downloads the libraries needed and creates a bundle and jvm launcher
    around the tool.
    
  * native-bin - these are the native binaries that were released with the tool,
    usually have been compiled with scala-native or graal. It's basically a blob 
    you are trusting here.
    
  * jvm - these are when we download the source ourselves and to the compilation
    on local machine, usually using sbt.
    
  * native - these are the when we download the source ourselves and compile locally
    usually using scala-native or graal-native in the local machine.
    
When installed in the system, priority for the default binary names are given to the 
native versions. Since no one wants to pay the pain of using jvm to launch cli tools.
Those usually conflict with other packages that may exist.
For the jvm versions the binaries are installed with "TOOLNAME-jvm" name and because of that
can be installed in parallel to the others. Example, coursier can be both installed the native-bin
version and the jvm-bin version and correspondly the system binaries are 'coursier' and 'coursier-jvm'.

Available tools right now:

  * coursier - jvm-bin | native-bin
  * bloop    - jvm-bin
  * scalafix - jvm-bin
  * scalafmt - jvm-bin | native
  * seed     - jvm-bin | jvm-bin-git
