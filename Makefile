clean:
	-rm *.class
	-rm *.jar
	-rm *.o
	-rm helloworld

all:
	javac HelloWorld.java
	jar cfm HelloWorld.jar manifest.txt HelloWorld.class
	cc -c -static -I$(JAVA_HOME)/include -I$(JAVA_HOME)/include/linux -o libHelloWorld.o -fPIC HelloWorld.c
	native-image \
		-jar HelloWorld.jar \
		-H:Name=helloworld \
		-H:+ReportExceptionStackTraces \
		-H:+StaticExecutableWithDynamicLibC \
		-H:AdditionalLinkerOptions="/root/staticjni/libHelloWorld.o" \
		--initialize-at-build-time \
		--verbose \
		--no-fallback \
		--no-server
