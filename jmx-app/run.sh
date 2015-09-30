#!/bin/bash

java -XX:+PrintGCDateStamps -Xloggc:"./gc.log" -XX:+PrintCommandLineFlags -Dcom.sun.management.jmxremote.port=1099 -Dcom.sun.management.jmxremote.password.file=./jmx.password -Dcom.sun.management.jmxremote.access.file=./jmx.access -Dcom.sun.management.jmxremote.authenticate=true -Dcom.sun.management.jmxremote.ssl=false  -jar target/myproject-0.0.1-SNAPSHOT.jar

#java -Dcom.sun.management.jmxremote.port=1099 -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false  -jar target/myproject-0.0.1-SNAPSHOT.jar
