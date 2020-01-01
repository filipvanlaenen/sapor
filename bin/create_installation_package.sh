#!/bin/sh
#
# Statistical Analysis of Polling Results (SAPoR)
# Copyright © 2020 Filip van Laenen <f.a.vanlaenen@ieee.org>
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
# Creates an installation package.
#

# Create an empty temporary directory

SCRIPTDIR="$( cd "$( dirname "$0" )" && pwd )"
VERSION="0.2a1"
TEMPDIR="sapor-${VERSION}"

if [ -d "$TEMPDIR" ]; then
    rm -R "$TEMPDIR"
fi

mkdir "$TEMPDIR"

# Copy all resources to the temporary directory

BINDIR=${SCRIPTDIR}/../bin
cp ${BINDIR}/install.sh "$TEMPDIR"
cp ${BINDIR}/sapor.sh "$TEMPDIR"
cp ${BINDIR}/sapor.rb "$TEMPDIR"

# Creates the archive file

TARFILE="sapor-${VERSION}.tar.gz"
tar -pczf $TARFILE "$TEMPDIR"

# Remove the temporary directory

rm -R $TEMPDIR