#!/bin/bash

on_chroot << EOF
systemctl enable duetcontrolserver
systemctl enable duetwebserver
EOF
