#!/bin/sh 
DEMO="JBoss Fuse on EAP Demo"

#EAP Env
JBOSS_HOME=./target/jboss-eap-6.4
SERVER_DIR=$JBOSS_HOME/standalone/deployments/
SERVER_CONF=$JBOSS_HOME/standalone/configuration
SERVER_BIN=$JBOSS_HOME/bin
SRC_DIR=./installs
PRJ_DIR=./projects
SUPPORT_DIR=./support
EAP=jboss-eap-6.4.0-installer.jar
FUSE_EAP=fuse-eap-installer-6.2.1.redhat-039.jar

FUSE_VERSION=6.2.1
AUTHORS="Christina Lin"
PROJECT="git@github.com/weimeilin79/fuseeapdemo.git"


# wipe screen.
clear 

# add executeable in installs
chmod +x installs/*.zip


echo
echo "#################################################################"
echo "##                                                             ##"   
echo "##  Setting up the ${DEMO}                      ##"
echo "##                                                             ##"   
echo "##                                                             ##"   
echo "##                #####  #   #  #####  #####                   ##"
echo "##                #      #   #  #      #                       ##"
echo "##                #####  #   #  #####  ####                    ##"
echo "##                #      #   #      #  #                       ##"
echo "##                #      #####  #####  #####                   ##"
echo "##                                                             ##"   
echo "##                                                             ##"   
echo "##  brought to you by,                                         ##"   
echo "##                    ${AUTHORS}                            ##"
echo "##                                                             ##"   
echo "##  ${PROJECT}                 ##"
echo "##                                                             ##"   
echo "#################################################################"
echo

# double check for maven.
command -v mvn -q >/dev/null 2>&1 || { echo >&2 "Maven is required but not installed yet... aborting."; exit 1; }

# make some checks first before proceeding.	
if [ -r $SRC_DIR/$EAP ] || [ -L $SRC_DIR/$EAP ]; then
	echo Product sources are present...
	echo
else
	echo Need to download $EAP package from the Customer Portal 
	echo and place it in the $SRC_DIR directory to proceed...
	echo
	exit
fi

if [ -f $SRC_DIR/$FUSE_EAP ]; then
	echo Fuse on Product sources are present...
	echo
else
	echo Need to download $FUSE_EAP package from the Customer Portal 
	echo and place it in the $SRC_DIR directory to proceed...
	echo
	exit
fi



# Create the target directory if it does not already exist.
if [ ! -x $DEMO_HOME ]; then
		echo "  - creating the demo home directory..."
		echo
		mkdir $DEMO_HOME
else
		echo "  - detected demo home directory, moving on..."
		echo
fi

# Remove JBoss product installation if exists.
if [ -x target ]; then
	echo "  - existing JBoss product installation detected..."
	echo
	echo "  - removing existing JBoss product installation..."
	echo
	rm -rf target
fi

# Run installers.
echo "JBoss EAP installer running now..."
echo
java -jar $SRC_DIR/$EAP $SUPPORT_DIR/installation-eap -variablefile $SUPPORT_DIR/installation-eap.variables

if [ $? -ne 0 ]; then
	echo
	echo Error occurred during JBoss EAP installation!
	exit
fi

#Install Fuse EAP package
echo Installing JBoss FUSE $FUSE_VERSION on EAP
cp $SRC_DIR/$FUSE_EAP $JBOSS_HOME
java -jar $JBOSS_HOME/$FUSE_EAP $JBOSS_HOME

#Copy standalon.xml with datasource to destination
echo Copy standalon.xml with datasource to destination
mv $SERVER_CONF/standalone.xml $SERVER_CONF/standalone.xml.demobackup
cp $SUPPORT_DIR/standalone.xml $SERVER_CONF/

#Setup 
echo setup currency exchange database
if [ -x ~/h2 ]; then
	rm -rf ~/h2/fuseoneap.h2.db
else
	mkdir ~/h2
fi

cp $SUPPORT_DIR/data/fuseoneap.h2.db ~/h2/


#Go through each project and build application
echo start building camel applications
cd $PRJ_DIR/demo01
mvn clean install
cd ../..

cd $PRJ_DIR/demo02
mvn clean install
cd ../..

cd $PRJ_DIR/demo03
mvn clean install
cd ../..

#Deploy Application to EAP 
cp $PRJ_DIR/demo01/target/demo01-0.0.1-SNAPSHOT.war $SERVER_DIR
#cp $PRJ_DIR/demo02/target/demo02-0.0.1-SNAPSHOT.war $SERVER_DIR
#cp $PRJ_DIR/demo03/target/demo03-0.0.1-SNAPSHOT.war $SERVER_DIR
