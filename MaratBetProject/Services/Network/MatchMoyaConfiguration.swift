//
//  MatchMoyaConfiguration.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 03.05.2022.
//

import Foundation
import Moya

enum MatchMoyaConfiguration {
    case getFootballMatches(league: Int)
    case getHockeyMatches(league: Int)
    case getBasketBallMatches(league: Int)
}

extension MatchMoyaConfiguration: TargetType {
    var baseURL: URL {
        switch self {
        case .getFootballMatches:
        //   return  URL(string: "https://api-football-v1.p.rapidapi.com/v3")!
            return URL(string: "https://v3.football.api-sports.io")!
        case .getHockeyMatches:
            return URL(string: "https://v1.hockey.api-sports.io")!
        case .getBasketBallMatches:
            return URL(string: "https://v1.basketball.api-sports.io")!
        }
    }
//    var MatchListURL: URL {return URL(string: "https://v3.football.api-sports.io")!}
//    var APIKey: String {return "1f370125c8msh68d348664965b81p15de67jsnb3956c25cc45"}
//    var APIHost: String {return "api-football-v1.p.rapidapi.com"}
    
    var path: String {
        switch self {
        case .getFootballMatches:
            return "/fixtures"
        case .getHockeyMatches:
            return "/games"
        case .getBasketBallMatches:
            return "/games"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getFootballMatches:
            return .get
        case .getHockeyMatches:
            return .get
        case .getBasketBallMatches:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getFootballMatches(let league):
            return .requestParameters(parameters: [
                "league": league,
                "season": 2021,
                "from": "2022-05-07",
                "to": "2022-05-08"
            ], encoding: URLEncoding.queryString)
        case .getHockeyMatches(let league):
            return .requestParameters(parameters: ["league": league,
                                                   "season": 2021,
                                                   "date": "2022-05-08"], encoding: URLEncoding.queryString)
        case .getBasketBallMatches(league: let league):
            return .requestParameters(parameters: ["league": league,
                                                   "season": "2021-2022",
                                                   "date": "2022-05-08"], encoding: URLEncoding.queryString)
        }
    }
    var headers: [String: String]? {
        switch self {
        case .getFootballMatches:
            return [
                "X-RapidAPI-Host": "v3.football.api-sports.io",
                    "X-RapidAPI-Key": "7535a6498e04ead516f323a8dcd09c2b"
//                "X-RapidAPI-Host": "api-football-v1.p.rapidapi.com",
//                    "X-RapidAPI-Key": "1f370125c8msh68d348664965b81p15de67jsnb3956c25cc45"
            ]
        case .getHockeyMatches:
            return [
                //                "X-RapidAPI-Host": "api-football-v1.p.rapidapi.com",
                //                    "X-RapidAPI-Key": "1f370125c8msh68d348664965b81p15de67jsnb3956c25cc45"
                                "X-RapidAPI-Host": "v1.hockey.api-sports.io",
                                    "X-RapidAPI-Key": "7535a6498e04ead516f323a8dcd09c2b"
                            ]
        case .getBasketBallMatches:
            return [
                                "X-RapidAPI-Host": "v1.basketball.api-sports.io",
                                    "X-RapidAPI-Key": "7535a6498e04ead516f323a8dcd09c2b"
                            ]
        }
}
}
