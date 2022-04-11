//
//  MoyaConfiguration.swift
//  MaratBet
//
//  Created by Marat Giniyatov on 02.04.2022.
//
// swiftlint:disable all

import Foundation
import Moya

enum MoyaServices {
    case sendSignUpInfo(login: String, email: String, password: String)
    case sendSignInInfo(email: String, password: String)
    case getMatches
}

extension MoyaServices: TargetType {

    var baseURL: URL { return URL(string: "http://localhost:8080")!}
    var MatchListURL: URL {return URL(string: "https://v3.football.api-sports.io")!}
    var APIKey: String {return "1f370125c8msh68d348664965b81p15de67jsnb3956c25cc45"}
    var APIHost: String {return "api-football-v1.p.rapidapi.com"}
    
    
    var path: String {
        switch self {
        case .sendSignUpInfo:
            return "/registration"
        case .sendSignInInfo:
            return "/signIn"
        case .getMatches:
            return "v3/fixtures?league=39&season=2020"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .sendSignUpInfo:
               return .post
        case .sendSignInInfo:
            return .post
        case .getMatches:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .sendSignUpInfo(let login, let email, let password):
            return .requestParameters(parameters: ["login" : login, "email" : email, "password" : password], encoding: JSONEncoding.default)
        case .sendSignInInfo(let email, let password):
            return .requestParameters(parameters: ["email": email, "password": password], encoding: JSONEncoding.default)
        case .getMatches:
            return .requestParameters(parameters: ["fixture": Fixture.self,"league": League.self, "teams": Teams.self], encoding: JSONEncoding.default)
        }
    }
    var headers: [String : String]? {
        switch self {
        case .sendSignInInfo(email: _, password: _):
            return["Content-Type": "application/json"]
        case .sendSignUpInfo(login: _, email: _, password: _):
            return["Content-Type": "application/json"]

        case .getMatches:
            return [
                "X-RapidAPI-Host": "api-football-v1.p.rapidapi.com",
                "X-RapidAPI-Key": "1f370125c8msh68d348664965b81p15de67jsnb3956c25cc45"
            ]
            
        }
        
            
    }
}
