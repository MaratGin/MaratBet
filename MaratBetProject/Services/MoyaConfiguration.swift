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
}

extension MoyaServices: TargetType {
    var baseURL: URL { return URL(string: "http://localhost:8080")!}
    
    var path: String {
        switch self {
        case .sendSignUpInfo:
            return "/registration"
        case .sendSignInInfo:
            return "/signIn"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .sendSignUpInfo:
               return .post
        case .sendSignInInfo:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .sendSignUpInfo(let login, let email, let password):
            return .requestParameters(parameters: ["login" : login, "email" : email, "password" : password], encoding: JSONEncoding.default)
        case .sendSignInInfo(let email, let password):
            return .requestParameters(parameters: ["email": email, "password": password], encoding: JSONEncoding.default)
        }
    }
    var headers: [String : String]? {
        return["Content-Type": "application/json"]
    }
}
