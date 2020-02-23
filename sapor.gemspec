# -*- encoding: utf-8 -*-
#
# Statistical Analysis of Polling Results (SAPoR)
# Copyright (C) 2020 Filip van Laenen <f.a.vanlaenen@ieee.org>
#
# This file is part of SAPoR.
#
# SAPoR is free software: you can redistribute it and/or modify it under the
# terms of the GNU General Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later
# version.
#
# SAPoR is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
#
# You can find a copy of the GNU General Public License in /doc/gpl.txt
#

Gem::Specification.new do |gem|
  gem.name = 'sapor'
  gem.version = '0.4.2a1'
  gem.authors = ['Filip van Laenen']
  gem.email = ['f.a.vanlaenen@ieee.org']

  gem.description = 'SAPoR'
  gem.summary = 'Statistical Analysis of Polling Results'
  gem.homepage = 'https://github.com/filipvanlaenen/sapor'
  gem.license = 'GPL'

  gem.require_paths = ['lib']
  gem.files = `git ls-files`.split("\n")
  gem.test_files = `git ls-files -- spec`.split("\n")
  gem.extra_rdoc_files = %w(LICENSE README.md)
end
