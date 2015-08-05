Statistical Analysis of Polling Results (SAPoR)
===============================================

Installation
------------

You can install this program by cloning this repository, and then executing the
following commands in the directory where it got cloned:

    sudo gem build sapor.gemspec 
    sudo gem install sapor-0.1b1.gem 

    bin/create_installation_package.sh 
    tar -xzf sapor-0.1b1.tar.gz
    cd sapor-0.1b1/
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

* Areas: Added Oslo, local election, 2015

**Version 0.1**

* First round analysis of poll results as a set of dichotomies, reporting on the
  most probable fraction, the 95% confidence interval for the vote share, and
  probability to reach a threshold
* Second round analysis of poll results as a polychotomy, reporting on the most
  probable fraction, the most probable rounded fraction, the 95% confidence
  interval for the vote share, the probability to be larger than the next party,
  the 95% confidence interval for the number of seats in parliament, and for
  coalitions the most probable fraction, the most probable rounded fraction, the
  95% confidence interval for the vote share, the probability to have a majority
  of the popular vote (vote share larger than 50%), the 95% confidence interval
  for the number of seats and the probability to have a majority in parliament.
* Areas: Catalan parliamentary election, 2015

License
-------

Statistical Analysis of Polling Results (SAPoR)
Copyright (C) 2014 Filip van Laenen <f.a.vanlaenen@ieee.org>

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
