//
//  MockData.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 27.05.2022.
//

import Foundation

class MockData {
    static let leagues: [StatisticTeam] = [
        StatisticTeam(name: L10n.premierLeague, image: Asset.epl.image, leagueID: 39),
        StatisticTeam(name: L10n.argentinaLeague, image: Asset.argentina.image, leagueID: 128),
        StatisticTeam(name: L10n.brazilLeague, image: Asset.brasil.image, leagueID: 71),
        StatisticTeam(name: L10n.bundesliga, image: Asset.bundesliga.image, leagueID: 78),
        StatisticTeam(name: L10n.eredivisi, image: Asset.eredivisi.image, leagueID: 88),
        StatisticTeam(name: L10n.laLiga, image: Asset.laLiga.image, leagueID: 140),
        StatisticTeam(name: L10n.ligue1, image: Asset.ligue1.image, leagueID: 61),
        StatisticTeam(name: L10n.portugalLeague, image: Asset.portugal.image, leagueID: 94),
        StatisticTeam(name: L10n.rpl, image: Asset.rpl.image, leagueID: 235),
        StatisticTeam(name: L10n.seriaA, image: Asset.seriaA.image, leagueID: 135),
        StatisticTeam(name: L10n.fnl, image: Asset.fnl.image, leagueID: 236)
]
    
}
