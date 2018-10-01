#
# Statistical Analysis of Polling Results (SAPoR)
# Copyright (C) 2016 Filip van Laenen <f.a.vanlaenen@ieee.org>
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

module Sapor
  #
  # Class building the denominators for D'Hondt.
  #
  class DhondtDenominators
    def self.get(size)
      Range.new(1, size)
    end
  end

  #
  # Class building the denominators for modified D'Hondt raising the
  # denominators to the power 0.9.
  #
  class Dhondt09Denominators
    def self.get(size)
      Range.new(1, size).map { |a| a**0.9 }
    end
  end

  #
  # Class building the denominators for Sainte-Lague.
  #
  class SainteLagueDenominators
    def self.get(size)
      Range.new(1, size).map { |a| a * 2 - 1 }
    end
  end

  #
  # Class building the denominators for the modified Sainte-Lague starting with
  # 1.2.
  #
  class SainteLague12Denominators
    def self.get(size)
      Range.new(1, size).map { |a| a.equal?(1) ? 1.2 : a * 2 - 1 }
    end
  end

  #
  # Class building the denominators for the modified Sainte-Lague starting with
  # 1.4.
  #
  class SainteLague14Denominators
    def self.get(size)
      Range.new(1, size).map { |a| a.equal?(1) ? 1.4 : a * 2 - 1 }
    end
  end
end
