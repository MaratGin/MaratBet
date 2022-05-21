//
//  HockeyMatch.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 06.05.2022.
//

import Foundation
struct HockeyMatch: Codable, SportCell {
    let id: Int?
    let date: String?
    let time: String?
    let timestamp: Int?
    let timezone: String?
    let week: String?
    let timer: String?
    let status: Status?
    let country: Country?
    let league: HockeyLeague?
    let teams: HockeyTeams?
    let scores: HockeyScore?
    let periods: HockeyPeriods?
    let events: Bool?
    var type: String?
}
struct HockeyPeriods: Codable {
    let first: String?
    let second: String?
    let third: String?
    let overtime: String?
    let penalties: String?
}
struct HockeyScore: Codable {
    let away: Int?
    let home: Int?
}
