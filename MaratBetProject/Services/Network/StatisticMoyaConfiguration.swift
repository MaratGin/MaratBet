//
//  NetworkMoyaConfiguration.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 27.05.2022.
//

import Foundation
import Moya

enum StatisticMoyaConfiguration {
    case getLeagueStats(leagueID: Int)
}

extension StatisticMoyaConfiguration: TargetType {
    var baseURL: URL {
        switch self {
        case .getLeagueStats:
            return URL(string: "https://v3.football.api-sports.io")!
        }
    }
    var path: String {
        switch self {
        case .getLeagueStats:
            return "/standings"
        }
    }
    var method: Moya.Method {
        switch self {
        case .getLeagueStats:
            return .get
        }
    }
    var task: Task {
        switch self {
        case .getLeagueStats(let leagueID):
            return .requestParameters(parameters: [
                "season": 2021,
                "league": leagueID
            ], encoding: URLEncoding.queryString)
        }
    }
    var headers: [String: String]? {
        switch self {
        case .getLeagueStats:
            return [
                "X-RapidAPI-Host": "v3.football.api-sports.io",
                    "X-RapidAPI-Key": "7535a6498e04ead516f323a8dcd09c2b"
            ]
        }
}
}
