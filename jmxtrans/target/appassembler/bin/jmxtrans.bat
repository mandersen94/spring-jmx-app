@REM ----------------------------------------------------------------------------
@REM  Copyright 2001-2006 The Apache Software Foundation.
@REM
@REM  Licensed under the Apache License, Version 2.0 (the "License");
@REM  you may not use this file except in compliance with the License.
@REM  You may obtain a copy of the License at
@REM
@REM       http://www.apache.org/licenses/LICENSE-2.0
@REM
@REM  Unless required by applicable law or agreed to in writing, software
@REM  distributed under the License is distributed on an "AS IS" BASIS,
@REM  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@REM  See the License for the specific language governing permissions and
@REM  limitations under the License.
@REM ----------------------------------------------------------------------------
@REM
@REM   Copyright (c) 2001-2006 The Apache Software Foundation.  All rights
@REM   reserved.

@echo off

set ERROR_CODE=0

:init
@REM Decide how to startup depending on the version of windows

@REM -- Win98ME
if NOT "%OS%"=="Windows_NT" goto Win9xArg

@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" @setlocal

@REM -- 4NT shell
if "%eval[2+2]" == "4" goto 4NTArgs

@REM -- Regular WinNT shell
set CMD_LINE_ARGS=%*
goto WinNTGetScriptDir

@REM The 4NT Shell from jp software
:4NTArgs
set CMD_LINE_ARGS=%$
goto WinNTGetScriptDir

:Win9xArg
@REM Slurp the command line arguments.  This loop allows for an unlimited number
@REM of arguments (up to the command line limit, anyway).
set CMD_LINE_ARGS=
:Win9xApp
if %1a==a goto Win9xGetScriptDir
set CMD_LINE_ARGS=%CMD_LINE_ARGS% %1
shift
goto Win9xApp

:Win9xGetScriptDir
set SAVEDIR=%CD%
%0\
cd %0\..\.. 
set BASEDIR=%CD%
cd %SAVEDIR%
set SAVE_DIR=
goto repoSetup

:WinNTGetScriptDir
set BASEDIR=%~dp0\..

:repoSetup
set REPO=


if "%JAVACMD%"=="" set JAVACMD=java

if "%REPO%"=="" set REPO=%BASEDIR%\repo

set CLASSPATH="%BASEDIR%"\etc;"%REPO%"\ch\qos\logback\logback-classic\1.1.3\logback-classic-1.1.3.jar;"%REPO%"\ch\qos\logback\logback-core\1.1.3\logback-core-1.1.3.jar;"%REPO%"\org\acplt\oncrpc\1.0.7\oncrpc-1.0.7.jar;"%REPO%"\org\jboss\remoting3\remoting-jmx\1.0.1.Final\remoting-jmx-1.0.1.Final.jar;"%REPO%"\org\jboss\logmanager\jboss-logmanager\1.2.2.GA\jboss-logmanager-1.2.2.GA.jar;"%REPO%"\org\jboss\logging\jboss-logging\3.1.0.GA\jboss-logging-3.1.0.GA.jar;"%REPO%"\org\jboss\marshalling\jboss-marshalling\1.3.7.GA\jboss-marshalling-1.3.7.GA.jar;"%REPO%"\org\jboss\remoting3\jboss-remoting\3.2.0.GA\jboss-remoting-3.2.0.GA.jar;"%REPO%"\org\jboss\xnio\xnio-api\3.0.0.GA\xnio-api-3.0.0.GA.jar;"%REPO%"\org\jboss\remotingjmx\remoting-jmx\2.0.1.Final\remoting-jmx-2.0.1.Final.jar;"%REPO%"\org\jboss\logging\jboss-logging-processor\1.2.0.Final\jboss-logging-processor-1.2.0.Final.jar;"%REPO%"\org\jboss\logging\jboss-logging-annotations\1.2.0.Final\jboss-logging-annotations-1.2.0.Final.jar;"%REPO%"\org\jboss\jdeparser\jdeparser\1.0.0.Final\jdeparser-1.0.0.Final.jar;"%REPO%"\org\jboss\marshalling\jboss-marshalling-river\1.4.10.Final\jboss-marshalling-river-1.4.10.Final.jar;"%REPO%"\org\jboss\remoting\jboss-remoting\4.0.8.Final\jboss-remoting-4.0.8.Final.jar;"%REPO%"\org\jboss\sasl\jboss-sasl\1.0.5.Final\jboss-sasl-1.0.5.Final.jar;"%REPO%"\org\jboss\xnio\xnio-nio\3.3.0.Final\xnio-nio-3.3.0.Final.jar;"%REPO%"\org\jmxtrans\jmxtrans-core\251-SNAPSHOT\jmxtrans-core-251-SNAPSHOT.jar;"%REPO%"\com\fasterxml\jackson\core\jackson-annotations\2.6.2\jackson-annotations-2.6.2.jar;"%REPO%"\com\fasterxml\jackson\core\jackson-databind\2.6.2\jackson-databind-2.6.2.jar;"%REPO%"\com\fasterxml\jackson\datatype\jackson-datatype-guava\2.6.2\jackson-datatype-guava-2.6.2.jar;"%REPO%"\com\google\guava\guava\19.0-rc2\guava-19.0-rc2.jar;"%REPO%"\com\google\inject\guice\4.0\guice-4.0.jar;"%REPO%"\aopalliance\aopalliance\1.0\aopalliance-1.0.jar;"%REPO%"\commons-cli\commons-cli\1.3.1\commons-cli-1.3.1.jar;"%REPO%"\commons-io\commons-io\2.4\commons-io-2.4.jar;"%REPO%"\commons-lang\commons-lang\2.6\commons-lang-2.6.jar;"%REPO%"\commons-pool\commons-pool\1.6\commons-pool-1.6.jar;"%REPO%"\javax\inject\javax.inject\1\javax.inject-1.jar;"%REPO%"\org\apache\commons\commons-jexl\2.1.1\commons-jexl-2.1.1.jar;"%REPO%"\commons-logging\commons-logging\1.1.1\commons-logging-1.1.1.jar;"%REPO%"\org\jmxtrans\jmxtrans-utils\251-SNAPSHOT\jmxtrans-utils-251-SNAPSHOT.jar;"%REPO%"\net\sf\jpathwatch\jpathwatch\0.95\jpathwatch-0.95.jar;"%REPO%"\org\quartz-scheduler\quartz\1.8.6\quartz-1.8.6.jar;"%REPO%"\org\slf4j\slf4j-api\1.7.12\slf4j-api-1.7.12.jar;"%REPO%"\org\jmxtrans\jmxtrans-output-cloudwatch\251-SNAPSHOT\jmxtrans-output-cloudwatch-251-SNAPSHOT.jar;"%REPO%"\com\amazonaws\aws-java-sdk-cloudwatch\1.10.20\aws-java-sdk-cloudwatch-1.10.20.jar;"%REPO%"\com\amazonaws\aws-java-sdk-core\1.10.20\aws-java-sdk-core-1.10.20.jar;"%REPO%"\joda-time\joda-time\2.8.1\joda-time-2.8.1.jar;"%REPO%"\org\apache\httpcomponents\httpclient\4.5.1\httpclient-4.5.1.jar;"%REPO%"\org\apache\httpcomponents\httpcore\4.4.3\httpcore-4.4.3.jar;"%REPO%"\org\jmxtrans\jmxtrans-output-core\251-SNAPSHOT\jmxtrans-output-core-251-SNAPSHOT.jar;"%REPO%"\com\fasterxml\jackson\core\jackson-core\2.6.2\jackson-core-2.6.2.jar;"%REPO%"\org\jmxtrans\jmxtrans-output-elastic\251-SNAPSHOT\jmxtrans-output-elastic-251-SNAPSHOT.jar;"%REPO%"\io\searchbox\jest\0.1.7\jest-0.1.7.jar;"%REPO%"\io\searchbox\jest-common\0.1.7\jest-common-0.1.7.jar;"%REPO%"\com\google\code\gson\gson\2.3.1\gson-2.3.1.jar;"%REPO%"\org\apache\commons\commons-lang3\3.4\commons-lang3-3.4.jar;"%REPO%"\org\apache\httpcomponents\httpcore-nio\4.4.1\httpcore-nio-4.4.1.jar;"%REPO%"\org\apache\httpcomponents\httpasyncclient\4.1\httpasyncclient-4.1.jar;"%REPO%"\org\jmxtrans\jmxtrans-output-ganglia\251-SNAPSHOT\jmxtrans-output-ganglia-251-SNAPSHOT.jar;"%REPO%"\info\ganglia\gmetric4j\gmetric4j\1.0.10\gmetric4j-1.0.10.jar;"%REPO%"\org\acplt\remotetea\remotetea-oncrpc\1.1.2\remotetea-oncrpc-1.1.2.jar;"%REPO%"\org\jmxtrans\jmxtrans-output-jrobin\251-SNAPSHOT\jmxtrans-output-jrobin-251-SNAPSHOT.jar;"%REPO%"\commons-codec\commons-codec\1.10\commons-codec-1.10.jar;"%REPO%"\org\jrobin\jrobin\1.5.9\jrobin-1.5.9.jar;"%REPO%"\org\jmxtrans\jmxtrans-output-kafka\251-SNAPSHOT\jmxtrans-output-kafka-251-SNAPSHOT.jar;"%REPO%"\org\apache\kafka\kafka_2.10\0.8.2.2\kafka_2.10-0.8.2.2.jar;"%REPO%"\org\apache\kafka\kafka-clients\0.8.2.2\kafka-clients-0.8.2.2.jar;"%REPO%"\org\xerial\snappy\snappy-java\1.1.1.7\snappy-java-1.1.1.7.jar;"%REPO%"\net\jpountz\lz4\lz4\1.2.0\lz4-1.2.0.jar;"%REPO%"\com\yammer\metrics\metrics-core\2.2.0\metrics-core-2.2.0.jar;"%REPO%"\org\scala-lang\scala-library\2.10.4\scala-library-2.10.4.jar;"%REPO%"\org\apache\zookeeper\zookeeper\3.4.6\zookeeper-3.4.6.jar;"%REPO%"\jline\jline\0.9.94\jline-0.9.94.jar;"%REPO%"\io\netty\netty\3.7.0.Final\netty-3.7.0.Final.jar;"%REPO%"\net\sf\jopt-simple\jopt-simple\3.2\jopt-simple-3.2.jar;"%REPO%"\com\101tec\zkclient\0.3\zkclient-0.3.jar;"%REPO%"\org\jmxtrans\jmxtrans-output-log4j\251-SNAPSHOT\jmxtrans-output-log4j-251-SNAPSHOT.jar;"%REPO%"\log4j\log4j\1.2.17\log4j-1.2.17.jar;"%REPO%"\org\slf4j\slf4j-log4j12\1.7.12\slf4j-log4j12-1.7.12.jar;"%REPO%"\org\jmxtrans\jmxtrans-output-velocity\251-SNAPSHOT\jmxtrans-output-velocity-251-SNAPSHOT.jar;"%REPO%"\org\apache\velocity\velocity\1.7\velocity-1.7.jar;"%REPO%"\commons-collections\commons-collections\3.2.1\commons-collections-3.2.1.jar;"%REPO%"\org\jmxtrans\jmxtrans\251-SNAPSHOT\jmxtrans-251-SNAPSHOT.jar

set ENDORSED_DIR=
if NOT "%ENDORSED_DIR%" == "" set CLASSPATH="%BASEDIR%"\%ENDORSED_DIR%\*;%CLASSPATH%

if NOT "%CLASSPATH_PREFIX%" == "" set CLASSPATH=%CLASSPATH_PREFIX%;%CLASSPATH%

@REM Reaching here means variables are defined and arguments have been captured
:endInit

%JAVACMD% %JAVA_OPTS%  -classpath %CLASSPATH% -Dapp.name="jmxtrans" -Dapp.repo="%REPO%" -Dapp.home="%BASEDIR%" -Dbasedir="%BASEDIR%" com.googlecode.jmxtrans.JmxTransformer %CMD_LINE_ARGS%
if %ERRORLEVEL% NEQ 0 goto error
goto end

:error
if "%OS%"=="Windows_NT" @endlocal
set ERROR_CODE=%ERRORLEVEL%

:end
@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" goto endNT

@REM For old DOS remove the set variables from ENV - we assume they were not set
@REM before we started - at least we don't leave any baggage around
set CMD_LINE_ARGS=
goto postExec

:endNT
@REM If error code is set to 1 then the endlocal was done already in :error.
if %ERROR_CODE% EQU 0 @endlocal


:postExec

if "%FORCE_EXIT_ON_ERROR%" == "on" (
  if %ERROR_CODE% NEQ 0 exit %ERROR_CODE%
)

exit /B %ERROR_CODE%
