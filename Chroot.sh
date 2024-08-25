#!/bin/bash

# Paths
CHROOT_DIR="/var/chroot/rustenv"
PROGRAM_PATH="target/release/rust_program"

# Create chroot directory
sudo mkdir -p $CHROOT_DIR/usr/local/bin

# Copy the Rust binary
sudo cp $PROGRAM_PATH $CHROOT_DIR/usr/local/bin/

# Copy necessary libraries
for LIB in $(ldd $PROGRAM_PATH | awk '/=>/ {print $3}'); do
  LIB_PATH=$(dirname $LIB)
  sudo mkdir -p $CHROOT_DIR$LIB_PATH
  sudo cp $LIB $CHROOT_DIR$LIB_PATH
done

# Create other necessary directories
sudo mkdir -p $CHROOT_DIR/etc
sudo mkdir -p $CHROOT_DIR/tmp

# Run the Rust program in chroot
sudo chroot $CHROOT_DIR /usr/local/bin/rust_program
