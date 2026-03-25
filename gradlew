#!/bin/sh
# ATLAS Optimizer - Simplified Gradlew
# Bu script karmaşık ulimit ayarlarından kaçınarak Error 24 hatasını önler.

APP_HOME=$(pwd)
CLASSPATH=$APP_HOME/gradle/wrapper/gradle-wrapper.jar

if [ -n "$JAVA_HOME" ] ; then
    JAVACMD="$JAVA_HOME/bin/java"
else
    JAVACMD="java"
fi

exec "$JAVACMD" -classpath "$CLASSPATH" org.gradle.wrapper.GradleWrapperMain "$@"
