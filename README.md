# Statistical Analysis of Polling Results (SAPoR)

## Requirements

The program is developed in Ruby, and the scripts to run it are Unix scripts
using `/bin/sh`.

## Installation

You can install this program by cloning this repository, and then executing the
commands from the following sections in the directory where it got cloned.

### Latest Release 

The latest release is a beta version, and has version number 0.1b1. Use the tag
`v0.1b1` to check it out after you've cloned the repository, and build and
install the program using the following commands:

    sudo gem build sapor.gemspec 
    sudo gem install sapor-0.1b1.gem 

    bin/create_installation_package.sh 
    tar -xzf sapor-0.1b1.tar.gz
    cd sapor-0.1b1/
    sudo ./install.sh

### Snapshot

The most recent version, currently under development, is an alpha version. It
resides in the master branch, and has version number 0.2a1. You can build it
using the following commands:

    sudo gem build sapor.gemspec 
    sudo gem install sapor-0.2a1.gem 

    bin/create_installation_package.sh 
    tar -xzf sapor-0.2a1.tar.gz
    cd sapor-0.2a1/
    sudo ./install.sh

Usage
-----

Simply call `sapor` or `sapor help` to get instructions on how to use the
program.

Examples
--------

See [this](Examples.md) page.

Technical Documentation
-----------------------

See [this](Technical%20Documentation.md) page.

Changelog
---------

**Version 0.2**

* Included more data in the calculation of the error estimate.
* Added the Type field with values Election and Referendum. Polls of type
  Referendum do not try to calculate a seat distribution.
* Areas: Added Flanders.
* Areas: Added Greece with a simplified approach to the parliamentary elections.
* Areas: Added Norwegian municipalities Oslo, Bergen and Trondheim, local
  election, 2015.

**Version 0.1**

* First round analysis of poll results as a set of dichotomies, reporting on the
  most probable fraction, the 95% confidence interval for the vote share, and
  probability to reach a threshold.
* Second round analysis of poll results as a polychotomy, reporting on the most
  probable fraction, the most probable rounded fraction, the 95% confidence
  interval for the vote share, the probability to be larger than the next party,
  the 95% confidence interval for the number of seats in parliament, and for
  coalitions the most probable fraction, the most probable rounded fraction, the
  95% confidence interval for the vote share, the probability to have a majority
  of the popular vote (vote share larger than 50%), the 95% confidence interval
  for the number of seats and the probability to have a majority in parliament.
* Areas: Catalan parliamentary election, 2015.

License
-------

Statistical Analysis of Polling Results (SAPoR)
Copyright (C) 2020 Filip van Laenen <f.a.vanlaenen@ieee.org>

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
