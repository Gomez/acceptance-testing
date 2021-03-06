#!/bin/bash
#
# ownCloud
#
# @author Thomas Müller, Jakob Sack
# @copyright 2012-2013 Thomas Müller thomas.mueller@tmit.eu
# @copyright 2012-2013 Jakob Sack
#

# Ensure we are in the correct folder
cd `dirname $0`

#
# Load rvm from home or system
#
if [ -f "$HOME/.rvm/scripts/rvm" ]; then
  source "$HOME/.rvm/scripts/rvm"
elif [ -f "/usr/local/rvm/scripts/rvm" ]; then
  source "/usr/local/rvm/scripts/rvm"
else
  echo "Can not load rvm"
  exit 1
fi

#
# Set the gemset and ruby version
#
rvm use ruby-1.9.3-p194@oc_acceptance --create

# let's assume bundler is installed
bundle install

# setup Vagrant plugins
VAGRANT_PLUGINS="vagrant-omnibus vagrant-berkshelf"

for PLUGIN in $VAGRANT_PLUGINS
do
	echo Checking for Vagrant plugin $PLUGIN
	if ! vagrant plugin list | grep "$PLUGIN" > /dev/null 2>&1; then
		vagrant plugin install "$PLUGIN"
	fi
done

#
# We need xvfb and virtual box. Check if these executables are in $PATH
#
if [ ! `which xvfb-run` ]; then
  echo "You have to install xvfb in order to run the test suite"
  exit 1
fi
if [ ! `which vboxmanage || which VBoxManage` ]; then
  echo "You have to install virtualbox in order to run the test suite"
  exit 1
fi

function run_tests {
	VM_NAME=$1
	IP=$(grep -A 1 $VM_NAME Vagrantfile | grep private_network | egrep -o "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}")
    echo "IP for $VM_NAME: $IP"

	#
	# first start the vm(s)
	#
	vagrant up $VM_NAME || echo "Failed to start VM" && exit 2

	#
	# Running the bdd test suite
	#
	echo "Running the bdd test suite ..."
	rm -rf logs/$VM_NAME
	mkdir -p logs
	bundle exec cucumber -f json -o ./logs/$VM_NAME.json -f pretty HOST=$IP BROWSER='webkit' HEADLESS=true features

	#
	# webdav tests
	#
	if [ ! `which litmus` ]; then
	  echo "You have to install litmus in order to run the webdav test suite(http://www.webdav.org/neon/litmus/)"
	else
      echo "Starting litmus WebDAV testing ..."
	  litmus -k http://$IP/remote.php/webdav/ admin admin
	fi

	#
	# bring down the vm
	#
    echo "Bring it down ..."
	vagrant halt $VM_NAME
	cd ..
}

#
# evaluate args
#
if [ $# -eq 0 ]; then
    run_tests stable_on_apache_with_mysql
# We bring back the vms if they are ready
#    run_tests master_on_apache_with_sqlite
#    run_tests master_on_apache_with_mysql
#    run_tests master_on_apache_with_postgresql
#    run_tests master_on_lighttpd_with_sqlite
#    run_tests master_on_lighttpd_with_mysql
#    run_tests master_on_lighttpd_with_postgresql
#    run_tests master_on_nginx_with_sqlite
#    run_tests master_on_nginx_with_mysql
#    run_tests master_on_nginx_with_postgresql
else
    CFG=$1_on_$3_with_$2
    echo Start testing $CFG
    run_tests $CFG
fi

#
# Say good bye
#
#echo " "
echo "Done. Thank you for testing ownCloud!"
