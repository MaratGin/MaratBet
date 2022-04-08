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
    let moyaProvider = MoyaProvider<MoyaServices>()
    
    func funcSendUserInfo(login: String, email: String, password: String, completion: @escaping (Result<(), SignUpErrors>) -> Void) {
        print("here----------------------------------")
        moyaProvider.request(.sendSignUpInfo(login: login, email: email, password: password)) { (result) in
            switch result {
            case .success(let response):
                print(result)
                return completion(.success(()))
            case .failure(let error):
                return completion(.failure(.connectionError))
            }
        }
    }

}
