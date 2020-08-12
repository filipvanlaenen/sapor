# encoding: utf-8
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

require 'spec_helper'

describe Sapor::UnitedKingdom, '#area_code' do
  it 'returns GB as the area code' do
    expect(Sapor::UnitedKingdom.instance.area_code).to eq('GB')
  end
end

describe Sapor::UnitedKingdom, '#no_of_seats' do
  it 'returns 650 as the number of seats' do
    expect(Sapor::UnitedKingdom.instance.no_of_seats).to eq(650)
  end
end

describe Sapor::UnitedKingdom, '#population_size' do
  it 'returns a population size of 32,014,110' do
    expect(Sapor::UnitedKingdom.instance.population_size).to eq(32_014_110)
  end
end

describe Sapor::UnitedKingdom, '#seats' do
  it 'calculates the number of seats for the election of 12 December 2019' do
    uk = Sapor::UnitedKingdom.instance
    results = uk.overall_election_results_of_2019
    seats = uk.seats(results)   
    expect(seats['Conservative Party']).to eq(365)
    expect(seats['Labour Party']).to eq(202)
    expect(seats['Scottish National Party']).to eq(48)
    expect(seats['Liberal Democrats']).to eq(11)
    expect(seats['Democratic Unionist Party']).to eq(8)
    expect(seats['Sinn Féin']).to eq(7)
    expect(seats['Plaid Cymru']).to eq(4)
    expect(seats['Social Democratic and Labour Party']).to eq(2)
    expect(seats['Alliance Party of Northern Ireland']).to eq(1)
    expect(seats['Green Party of England and Wales']).to eq(1)
    expect(seats['Speaker']).to eq(1)
    expect(seats['Advance Together']).to eq(0)
    expect(seats['Alliance for Green Socialism']).to eq(0)
    expect(seats['Animal Welfare Party']).to eq(0)
    expect(seats['Aontú']).to eq(0)
    expect(seats['Ashfield Independents']).to eq(0)
    expect(seats['Best4Luton']).to eq(0)
    expect(seats['Birkenhead Social Justice Party']).to eq(0)
    expect(seats['Brexit Party']).to eq(0)
    expect(seats['British National Party']).to eq(0)
    expect(seats['Burnley and Padiham Independent Party']).to eq(0)
    expect(seats['Christian Party']).to eq(0)
    expect(seats['Christian Peoples Alliance']).to eq(0)
    expect(seats['Church of the Militant Elvis Party']).to eq(0)
    expect(seats['Citizens Movement Party UK']).to eq(0)
    expect(seats['Common People']).to eq(0)
    expect(seats['Communist League']).to eq(0)
    expect(seats['Communities United Party']).to eq(0)
    expect(seats['Constitution and Reform']).to eq(0)
    expect(seats['English Democrats']).to eq(0)
    expect(seats['Green Party in Northern Ireland']).to eq(0)
    expect(seats['Gwlad Gwlad']).to eq(0)
    expect(seats['Heavy Woollen District Independents']).to eq(0)
    expect(seats['Independent Network']).to eq(0)
    expect(seats['Liberal Party']).to eq(0)
    expect(seats['Libertarian Party']).to eq(0)
    expect(seats['Lincolnshire Independents']).to eq(0)
    expect(seats['Mebyon Kernow']).to eq(0)
    expect(seats['Motherworld Party']).to eq(0)
    expect(seats['North East Party']).to eq(0)
    expect(seats['Northern Ireland Conservatives']).to eq(0)
    expect(seats['Official Monster Raving Loony Party']).to eq(0)
    expect(seats['Patria']).to eq(0)
    expect(seats['Peace Party']).to eq(0)
    expect(seats['Proud of Oldham & Saddleworth']).to eq(0)
    expect(seats['Rebooting Democracy']).to eq(0)
    expect(seats['Renew Party']).to eq(0)
    expect(seats['People Before Profit']).to eq(0)
    expect(seats['Psychedelic Future']).to eq(0)
    expect(seats['Putting Cumbria First']).to eq(0)
    expect(seats['Scottish Family']).to eq(0)
    expect(seats['Scottish Green Party']).to eq(0)
    expect(seats['Shropshire Party']).to eq(0)
    expect(seats['Social Democratic Party']).to eq(0)
    expect(seats['Socialist Equality Party']).to eq(0)
    expect(seats['Socialist Labour Party']).to eq(0)
    expect(seats['Socialist Party of Great Britain']).to eq(0)
    expect(seats['Space Navies Party']).to eq(0)
    expect(seats['The Cynon Valley Party']).to eq(0)
    expect(seats['The Independent Group for Change']).to eq(0)
    expect(seats['The Justice & Anti-Corruption Party']).to eq(0)
    expect(seats['The Universal Good Party']).to eq(0)
    expect(seats['Touch Love Worldwide']).to eq(0)
    expect(seats['UK Independence Party']).to eq(0)
    expect(seats['Ulster Unionist Party']).to eq(0)
    expect(seats['Veterans and People’s Party']).to eq(0)
    expect(seats['Women’s Equality Party']).to eq(0)
    expect(seats['Workers Revolutionary Party']).to eq(0)
    expect(seats['Wycombe Independents']).to eq(0)
    expect(seats['Yeshua']).to eq(0)
    expect(seats['Yorkshire Party']).to eq(0)
    expect(seats['Young People’s Party UK']).to eq(0)
  end
end

describe Sapor::UnitedKingdom, '#threshold' do
  it 'returns there is no threshold' do
    expect(Sapor::UnitedKingdom.instance.threshold).to be_nil
  end
end
