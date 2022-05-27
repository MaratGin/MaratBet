//
//  MoyaConfiguration.swift
//  MaratBet
//
//  Created by Marat Giniyatov on 02.04.2022.
//
// swiftlint:disable all

import Foundation
import Moya

enum AuthMoyaConfiguration {
    case sendSignUpInfo(login: String, email: String, password: String)
    case sendSignInInfo(email: String, password: String)
    case getQuestions
}

extension AuthMoyaConfiguration: TargetType {
    
    var baseURL: URL {
        switch self {
        case .sendSignUpInfo(_, _, _):
            return URL(string: "http://localhost:8080")!
        case .sendSignInInfo(_, _):
            return URL(string: "http://localhost:8080")!
        case .getQuestions:
            return URL(string: "http://localhost:8080")!
        }
    }
    
    var path: String {
        switch self {
        case .sendSignUpInfo:
            return "/registration"
        case .sendSignInInfo:
            return "/signIn"
        case .getQuestions:
            return "/questions"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .sendSignUpInfo:
            return .post
        case .sendSignInInfo:
            return .post
        case .getQuestions:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .sendSignUpInfo(let login, let email, let password):
            return .requestParameters(parameters: ["login" : login, "email" : email, "password" : password], encoding: JSONEncoding.default)
        case .sendSignInInfo(let email, let password):
            return .requestParameters(parameters: ["email": email, "password": password], encoding: JSONEncoding.default)
        case .getQuestions:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .sendSignInInfo(email: _, password: _):
            return["Content-Type": "application/json"]
        case .sendSignUpInfo(login: _, email: _, password: _):
            return["Content-Type": "application/json"]
        case .getQuestions:
            return["Content-Type": "application/json"]
        }
    }
}

