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
          // return  URL(string: "https://api-football-v1.p.rapidapi.com/v3")!
            return URL(string: "https://v3.football.api-sports.io")!
        case .getHockeyBets:
            return URL(string: "https://v1.hockey.api-sports.io")!
        case .getBasketballBets:
            return URL(string: "https://v1.basketball.api-sports.io")!
        }
    }
//    var MatchListURL: URL {return URL(string: "https://v3.football.api-sports.io")!}
//    var APIKey: String {return "1f370125c8msh68d348664965b81p15de67jsnb3956c25cc45"}
//    var APIHost: String {return "api-football-v1.p.rapidapi.com"}
    
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
//                "X-RapidAPI-Host": "api-football-v1.p.rapidapi.com",
//                    "X-RapidAPI-Key": "1f370125c8msh68d348664965b81p15de67jsnb3956c25cc45"
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
