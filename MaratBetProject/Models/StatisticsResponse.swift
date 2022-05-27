//
//  StatisticsResponse.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 26.05.2022.
//

import Foundation
struct StatisticsResponse: Codable {
    let get: String?
    let parameters: Parametr?
    let errors: [Errors]?
    let results: Int?
    let paging: Paging?
    var response: [Statistics]
}

struct Statistics: Codable {
    let league: StatisticsLeague?
}
struct StatisticsLeague: Codable {
    let id: Int?
    let name: String?
    let country: String?
    let logo: String?
    let flag: String?
    let season: Int?
    let standings: [[Standing?]]
}

struct Standing: Codable {
    let rank: Int?
    let team: TeamData?
    let points: Int?
    let goalsDiff: Int?
    let group: String?
    let form: String?
    let status: String?
    let description: String?
    let all: All?
    let home: All?
    let away: All?
    let update: String?
}
struct All: Codable {
    let played: Int?
    let win: Int?
    let draw: Int?
    let lose: Int?
    let goals: StatGoal?
}
struct StatGoal: Codable {
    let `for`: Int?
    let against: Int?
    
}
