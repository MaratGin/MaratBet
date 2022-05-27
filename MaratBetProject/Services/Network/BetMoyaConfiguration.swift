//
//  MatchMoyaConfiguration.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 03.05.2022.
//

import Foundation
import Moya

enum BetMoyaConfiguration {
    case getFootballBets(matchID: Int)
    case getHockeyBets(matchID: Int)
    case getBasketballBets(matchID: Int)
}

extension BetMoyaConfiguration: TargetType {
    var baseURL: URL {
        switch self {
        case .getFootballBets:
            return URL(string: "https://v3.football.api-sports.io")!
        case .getHockeyBets:
            return URL(string: "https://v1.hockey.api-sports.io")!
        case .getBasketballBets:
            return URL(string: "https://v1.basketball.api-sports.io")!
        }
    }
    
    var path: String {
        switch self {
        case .getFootballBets:
            return "/odds"
        case .getHockeyBets:
            return "/odds"
        case .getBasketballBets:
            return "/odds"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getFootballBets:
            return .get
        case .getHockeyBets:
            return .get
        case .getBasketballBets:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getFootballBets(let matchID):
            return .requestParameters(parameters: [
                "fixture": matchID
            ], encoding: URLEncoding.queryString)
        case .getHockeyBets(let matchID):
            return .requestParameters(parameters: [
                "game": matchID
            ], encoding: URLEncoding.queryString)
        case .getBasketballBets(let matchID):
            return .requestParameters(parameters: [
                "game": matchID
            ], encoding: URLEncoding.queryString)
        }
    }
    var headers: [String: String]? {
        switch self {
        case .getFootballBets:
            return [
                "X-RapidAPI-Host": "v3.football.api-sports.io",
                "X-RapidAPI-Key": "7535a6498e04ead516f323a8dcd09c2b"
            ]
        case .getHockeyBets:
            return [
                "X-RapidAPI-Host": "v1.hockey.api-sports.io",
                "X-RapidAPI-Key": "7535a6498e04ead516f323a8dcd09c2b"
            ]
        case .getBasketballBets:
            return [
                "X-RapidAPI-Host": "v1.basketball.api-sports.io",
                "X-RapidAPI-Key": "7535a6498e04ead516f323a8dcd09c2b"
            ]
        }
    }
}
