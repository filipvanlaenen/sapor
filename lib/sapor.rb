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

# Library namespace
module Sapor
  def self.analyze(filename, arguments)
    yaml_file = filename.gsub('.poll', '-state.yaml')
    options = Options.new(arguments)
    if File.exist?(yaml_file)
      YAML::load(File.open(yaml_file)).continue_analysis(options)
    else
      Poll.from_file(filename).analyze(options)
    end
  end
end

require 'sapor/number_formatter'
require 'sapor/dichotomies'
require 'sapor/combinations_distribution'
require 'sapor/dichotomy'
require 'sapor/log4r_logger'
require 'sapor/log_facade'
require 'sapor/pseudorandom_multirange_enumerator'
require 'sapor/binomials_cache'
require 'sapor/options'
require 'sapor/polychotomy'
require 'sapor/referendum_polychotomy'
require 'sapor/representatives_polychotomy'
require 'sapor/first_past_the_post'
require 'sapor/largest_remainder'
require 'sapor/denominators'
require 'sapor/single_district_proportional'
require 'sapor/multi_district_proportional'
require 'sapor/multi_district_leveled_proportional'
require 'sapor/multi_district_variable_threshold_proportional'
require 'sapor/regional_data/area'
require 'sapor/regional_data/austria'
require 'sapor/regional_data/belgium'
require 'sapor/regional_data/belgium_brussels'
require 'sapor/regional_data/belgium_flanders'
require 'sapor/regional_data/belgium_wallonia'
require 'sapor/regional_data/catalonia'
require 'sapor/regional_data/catalonia-no-jxsi'
require 'sapor/regional_data/catalonia-jxcat'
require 'sapor/regional_data/denmark'
require 'sapor/regional_data/denmark_with_e'
require 'sapor/regional_data/denmark_with_e_and_p'
require 'sapor/regional_data/denmark_with_p'
require 'sapor/regional_data/estonia'
require 'sapor/regional_data/european_union_27_austria'
require 'sapor/regional_data/european_union_27_croatia'
require 'sapor/regional_data/european_union_27_denmark'
require 'sapor/regional_data/european_union_27_estonia'
require 'sapor/regional_data/european_union_27_finland'
require 'sapor/regional_data/european_union_27_france'
require 'sapor/regional_data/european_union_27_ireland'
require 'sapor/regional_data/european_union_27_ireland_with_ia'
require 'sapor/regional_data/european_union_27_italy'
require 'sapor/regional_data/european_union_27_netherlands'
require 'sapor/regional_data/european_union_27_poland'
require 'sapor/regional_data/european_union_27_romania'
require 'sapor/regional_data/european_union_27_slovakia'
require 'sapor/regional_data/european_union_27_spain'
require 'sapor/regional_data/european_union_27_sweden'
require 'sapor/regional_data/european_union_austria'
require 'sapor/regional_data/european_union_bulgaria'
require 'sapor/regional_data/european_union_croatia'
require 'sapor/regional_data/european_union_cyprus'
require 'sapor/regional_data/european_union_czech_republic'
require 'sapor/regional_data/european_union_denmark'
require 'sapor/regional_data/european_union_estonia'
require 'sapor/regional_data/european_union_finland'
require 'sapor/regional_data/european_union_flanders'
require 'sapor/regional_data/european_union_france'
require 'sapor/regional_data/european_union_french_community_of_belgium'
require 'sapor/regional_data/european_union_germany'
require 'sapor/regional_data/european_union_great_britain'
require 'sapor/regional_data/european_union_greece'
require 'sapor/regional_data/european_union_hungary'
require 'sapor/regional_data/european_union_ireland'
require 'sapor/regional_data/european_union_ireland_with_ia'
require 'sapor/regional_data/european_union_italy'
require 'sapor/regional_data/european_union_latvia'
require 'sapor/regional_data/european_union_lithuania'
require 'sapor/regional_data/european_union_luxembourg'
require 'sapor/regional_data/european_union_malta'
require 'sapor/regional_data/european_union_netherlands'
require 'sapor/regional_data/european_union_northern_ireland'
require 'sapor/regional_data/european_union_poland'
require 'sapor/regional_data/european_union_portugal'
require 'sapor/regional_data/european_union_romania'
require 'sapor/regional_data/european_union_slovakia'
require 'sapor/regional_data/european_union_slovenia'
require 'sapor/regional_data/european_union_spain'
require 'sapor/regional_data/european_union_sweden'
require 'sapor/regional_data/finland'
require 'sapor/regional_data/finland_with_sin'
require 'sapor/regional_data/flanders'
require 'sapor/regional_data/france'
require 'sapor/regional_data/greece'
require 'sapor/regional_data/hungary'
require 'sapor/regional_data/iceland'
require 'sapor/regional_data/latvia'
require 'sapor/regional_data/luxembourg'
require 'sapor/regional_data/netherlands'
require 'sapor/regional_data/norway'
require 'sapor/regional_data/norwegian_municipality'
require 'sapor/regional_data/poland'
require 'sapor/regional_data/poland_with_ko_and_l_without_n_po_r_and_zl'
require 'sapor/regional_data/poland_with_ko_konf_kp_l_and_zp_without_k_k15_n_pis_po_psl_r_and_zl'
require 'sapor/regional_data/poland_with_ko_sld_and_wi_without_n_po_and_zl'
require 'sapor/regional_data/poland_with_sld_and_wi_without_zl'
require 'sapor/regional_data/poland_with_sld_without_zl'
require 'sapor/regional_data/portugal'
require 'sapor/regional_data/portugal_with_a_and_ch_without_paf'
require 'sapor/regional_data/portugal_with_a_and_il_without_paf'
require 'sapor/regional_data/portugal_with_a_ch_and_il_without_paf'
require 'sapor/regional_data/portugal_with_a_without_paf'
require 'sapor/regional_data/portugal_with_ch_and_il_without_paf'
require 'sapor/regional_data/portugal_without_paf'
require 'sapor/regional_data/slovakia'
require 'sapor/regional_data/slovenia'
require 'sapor/regional_data/spain'
require 'sapor/regional_data/sweden'
require 'sapor/regional_data/sweden_20140914'
require 'sapor/regional_data/united_kingdom'
require 'sapor/regional_data/united_kingdom_with_brexit'
require 'sapor/regional_data/united_kingdom_with_brexit_and_chuk'
require 'sapor/regional_data/united_kingdom_with_tig'
require 'sapor/regional_data/utopia'
require 'sapor/regional_data/wallonia'
require 'sapor/poll'
