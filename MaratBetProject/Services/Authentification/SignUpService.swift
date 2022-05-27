//
//  SignUpService.swift
//  MaratBet
//
//  Created by Marat Giniyatov on 04.04.2022.
//
// swiftlint:disable all

import Foundation
import Moya

protocol SignUpServiceProtocol {
    func funcSendUserInfo(login: String, email: String, password: String, completion: @escaping (Result<(),SignUpErrors>) -> Void)
}

// MARK: - SignUp network method

class SignUpService: SignUpServiceProtocol {
    let moyaProvider = MoyaProvider<AuthMoyaConfiguration>()
    
    func funcSendUserInfo(login: String, email: String, password: String, completion: @escaping (Result<(), SignUpErrors>) -> Void) {
        moyaProvider.request(.sendSignUpInfo(login: login, email: email, password: password)) { (result) in
            switch result {
            case .success(let response):
                self.getToken(response: response)
                print(result)
                return completion(.success(()))
            case .failure(_):
                return completion(.failure(.connectionError))
            }
        }
    }
    func getToken(response: Response) {
        let token = String(data: response.data, encoding: .utf8) ?? "nil"
        print(token)
        KeychainService.saveLogin(login: token)
        
    }
    
}


