# Statically-linked Native Image w/ JNI

### Cross-platform build instructions.

1. `javac -cp . HelloWorld.java NativeFeature.java`
2. `jar cfm HelloWorld.jar manifest.txt HelloWorld.class NativeFeature.class`
3. 
	- Linux: `cc -c -I "$JAVA_HOME/include" -I "$JAVA_HOME/include/linux" -o native.o Native.c`
	- MacOS: `cc -c -I "$JAVA_HOME/include" -I "$JAVA_HOME/include/darwin" -o native.o Native.c`
	- Windows: `cl /I "%JAVA_HOME%\include" /I "%JAVA_HOME%\include\win32" /c Native.c`
4.
	- Linux: `ar rcs libNative.a native.o`
	- MacOS: `ar rcs libNative.a native.o`
	- Windows: `lib Native.obj`
5. `native-image --no-fallback --initialize-at-build-time -jar HelloWorld.jar -H:CLibraryPath=.`
	- Note: On Windows, if you see a message like
	```
	Error: Java 11 native-image building on Windows requires Visual Studio 2017 version 15.5 or later (C/C++ Optimizing Compiler Version 19.12 or later).
	Compiler info detected: cl|microsoft|x64|19.10.25019
	```
	you are either running an incompatible toolchain, or a newer one. If it's newer, you can suppress the error by passing in `-H:-CheckToolchain` to the `native-image` command.
