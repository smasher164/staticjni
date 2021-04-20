clean:
	-rm *.class
	-rm *.jar
	-rm *.o
	-rm *.a
	-rm HelloWorld

all:
	javac -cp . HelloWorld.java NativeFeature.java
	jar cfm HelloWorld.jar manifest.txt HelloWorld.class NativeFeature.class
	cc -c -I$(JAVA_HOME)/include -I$(JAVA_HOME)/include/darwin -o native.o Native.c
	ar rcs libNative.a native.o
	native-image --no-fallback --initialize-at-build-time -jar HelloWorld.jar -H:CLibraryPath=.
