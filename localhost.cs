#!/bin/bash
#
# Localhost Demo
#
# Script to create a tunnel on a remote server. Be sure to configure it to use
# your server's SSH information. You can use this script to temporarily showcase
# a local Web server to the Internet. All you need is a domain and a VPS with
# nginx (or similar software) configured to proxy REMOTE_PORT (see 
# configurations) to port 80.
#
# author: Ian Adam Naval <ian@ianonavy.com>
# version: 0.1
# license: MIT
#
# Usage: demo [port|8000]
#

# Configurations
SSH=/usr/bin/ssh              # Path to your local SSH program.
SSH_PORT=22                   # Remote SSH port.
REMOTE_HOST=demo.example.com  # Remote domain name or IP address.
REMOTE_PORT=8080              # Remote proxy port.
REMOTE_USER=user              # Remote SSH user.

# Print the usage.
usage() {
	echo "Usage: $0 [port|8000]"
	exit 1
}

# Get arguments.
if [ -z "$1" ]
then
	LOCAL_PORT=8000  # Default to port 8000.
else
	# Check for a valid integer.
	case $1 in
		''|*[!0-9]*) usage ;;
		*) LOCAL_PORT=$1 ;;
	esac
fi

echo "Forwarding port $LOCAL_PORT to $REMOTE_HOST as $REMOTE_USER."
echo "Log out of the SSH session to close the tunnel."
$SSH -p$SSH_PORT -R$REMOTE_PORT:localhost:$LOCAL_PORT $REMOTE_USER@$REMOTE_HOST
echo "Remote tunnel closed."

################################################################################
#                                                                              #
#                                Stupid legal bit                              #
#                                                                              #
################################################################################
# Copyright (c) 2012 Ian Adam Naval.                                           #
#                                                                              #
# Permission is hereby granted, free of charge, to any person obtaining a copy #
# of this software and associated documentation files (the "Software"), to     #
# deal in the Software without restriction, including without limitation the   #
# rights to use, copy, modify, merge, publish, distribute, sublicense, and/or  #
# sell copies of the Software, and to permit persons to whom the Software is   #
# furnished to do so, subject to the following conditions:                     #
#                                                                              #
# The above copyright notice and this permission notice shall be included in   #
# all copies or substantial portions of the Software.                          #
#                                                                              #
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR   #
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,     #
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE  #
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER       #
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING      #
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS #
# IN THE SOFTWARE.                                                             #
################################################################################

# Made with love.
@1989shack
Comment
