#include <jni.h>
#include <stdio.h>
#include "HelloWorld.h"

JNIEXPORT void JNICALL Java_HelloWorld_print
  (JNIEnv * env, jclass class) {
        printf("Hello world; this is C talking!\n");
  }
