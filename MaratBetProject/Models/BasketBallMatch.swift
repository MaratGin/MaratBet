//
//  BasketBallMatch.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 06.05.2022.
//
// swiftlint:disable all

import Foundation
struct BasketBallMatch: Codable, SportCell {
    var type: String?
    let id: Int?
    let date: String?
    let time: String?
    let timestamp: Int?
    let timezone: String?
    let stage: String?
    let week: String?
    let status: BasketStatus?
    let league: BasktetballLeague?
    let country: Country?
    let teams: HockeyTeams?
    let scores: Scores?
}
struct BasketStatus: Codable {
    let long: String?
    let short: String?
    let timer: String?
}
struct Scores: Codable {
    let home: TeamScores?
    let away: TeamScores?
}
struct TeamScores: Codable {
    let quarter_1: Int?
    let quarter_2: Int?
    let quarter_3: Int?
    let quarter_4: Int?
    let over_time: Int?
    let total: Int?
}
