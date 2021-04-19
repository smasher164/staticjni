clean:
	-rm *.class
	-rm *.jar
	-rm *.o
	-rm *.a
	-rm HelloWorld

all:
	javac -cp . HelloWorld.java HelloWorldFeature.java
	jar cfm HelloWorld.jar manifest.txt HelloWorld.class HelloWorldFeature.class
	cc -c -I$(JAVA_HOME)/include -I$(JAVA_HOME)/include/linux -o helloworld.o HelloWorld.c
	ar rcs libHelloWorld.a helloworld.o
	native-image \
		--no-fallback \
		--no-server \
		--verbose \
		--initialize-at-build-time \
		-H:+ReportExceptionStackTraces \
		-jar HelloWorld.jar \
		-H:CLibraryPath="/root/staticjni/"
