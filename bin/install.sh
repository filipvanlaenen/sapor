#!/bin/sh
#
# Statistical Analysis of Polling Results (SAPoR)
# Copyright © 2014 Filip van Laenen <f.a.vanlaenen@ieee.org>
#
# This file is part of SAPoR.
#
# SAPoR is free software: you can redistribute it and/or modify it under the terms of the GNU General
# Public License as published by the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# SAPoR is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General
# Public License for more details.
# 
# You can find a copy of the GNU General Public License in /doc/gpl.txt
#

#
# Installs SAPoR into /opt, and creates a link from /usr/bin to the sapor script.
#
# Note: Requires root permissions to create the directory. Use sudo to execute this script.
#

SAPORDIR="/opt/sapor"

if [ -d "$SAPORDIR" ]; then
    rm -R "$SAPORDIR"
fi

mkdir "$SAPORDIR"
mkdir "$SAPORDIR/lib"

cp lib/*.rb "$SAPORDIR/lib"

cp sapor* "$SAPORDIR"
chmod a+x "$SAPORDIR/sapor.sh"
ln -f "$SAPORDIR/sapor.sh" /usr/bin/sapor

LOG4R=$(gem list log4r | awk '/log4r/ {print $1}')
if [ ${#LOG4R[@]} -eq "0" ]; then
	gem install -r log4r
fi
