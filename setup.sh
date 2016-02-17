#!/usr/bin/env bash

install_deps () {
    sudo apt-get update --fix-missing
    sudo apt-get install -y \
        git \
        build-essential gcc
}

setup_devkitpro () {
    mkdir -p $2
    chmod 777 $2

    mkdir -p $2
    tar -xvf $1/devkitARM.tar.bz2 -C $2 # archive contains a devkitARM dir

    mkdir -p $2/libgba
    tar -xvf $1/libgba.tar.bz2 -C $2/libgba
}

# give bundle dir, share dir
extract_examples () {
    mkdir -p $2/examples
    tar -xvf $1/gba-examples.tar.bz2 -C $2/examples
}

if [ "$1" = "vm" ]; then
    echo "installing dependencies..."
    echo ""
    install_deps

    HOME_DIR=/vagrant
    BUNDLE_DIR=$HOME_DIR/sdk
    INSTALL_DIR=/opt
    BASH_FILE=/home/vagrant/.bashrc
    START_STEP="\"vagrant ssh\" to get into the development vm."
else
    HOME_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    BUNDLE_DIR=$HOME_DIR/sdk
    INSTALL_DIR=$HOME_DIR
    BASH_FILE=$HOME_DIR/env
    START_STEP="\"source $BASH_FILE\" to get your path setup."
fi

echo "setting up gameboy toolchain in $INSTALL_DIR..."
echo ""
setup_devkitpro $BUNDLE_DIR $INSTALL_DIR/devkitpro

echo "extracting examples to $HOME_DIR/examples"
echo ""
extract_examples $BUNDLE_DIR $HOME_DIR

echo "generating exports..."
echo "export DEVKITPRO=$INSTALL_DIR/devkitpro" >> $BASH_FILE
echo "export DEVKITARM=\$DEVKITPRO/devkitARM" >> $BASH_FILE
echo ""

echo "done! $START_STEP"
