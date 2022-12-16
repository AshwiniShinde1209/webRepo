#!/bin/bash
# ----------------------------------------------------------------------------
#
# Package	: pacemaker
# Version	: 2.1.5
# Source repo	: https://github.com/ClusterLabs/pacemaker.git
# Tested on	: ppc64le/ubuntu:16.04
# Script License: 
# Maintainer	: Ashwini Shinde <Ashwini.Shinde4@ibm.com>
#
# Disclaimer: This script has been tested in root mode on given
# ==========  platform using the mentioned version of the package.
#
# ----------------------------------------------------------------------------

PACKAGE_VERSION=Pacemaker-2.1.5
PACKAGE_URL=https://github.com/ClusterLabs/pacemaker.git

# Install dependencies.

apt-get update 
apt-get install -y apt-utils \
        build-essential \
        gcc \
        g++ \
        llvm \
        autoconf \
        clang \
        corosync-dev \
        libcorosync-common-dev \
        cppcheck \
        crmsh \
        libbz2-dev \
        libcfg-dev \
        libcpg-dev \
        libdbus-1-dev \
        libtool \
        libxml2-dev \
        libxslt1-dev \
        git \
        libglib2.0-dev \
        make \
        pkg-config \
        uuid-dev \
        libcmap-dev \
        libquorum-dev \
        libmcpp-dev \
        libcmocka-dev \
        automake \
        libltdl-dev \
        libqb-dev \
        autopoint \
        gettext

#Install python3.9

apt update
apt -y install software-properties-common
add-apt-repository ppa:deadsnakes/ppa
apt -y install python3.9

# Clone and build source code.

git clone -b $PACKAGE_VERSION -- $PACKAGE_URL
cd pacemaker
./autogen.sh 
./configure
make
make install

#To start pacemaker.
#/etc/init.d/corosync start
#/etc/init.d/pacemaker start

