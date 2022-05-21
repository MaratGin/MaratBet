//
//  SignInService.swift
//  MaratBet
//
//  Created by Marat Giniyatov on 04.04.2022.
//

import Foundation
import Moya

protocol SignInServiceProtocol {
    func funcSendUserInfo(email: String, password: String, completion: @escaping (Result<(), SignInErrors>) -> Void)
}
// MARK: - SignIn network method
class SignInService: SignInServiceProtocol {
    private let moyaProvider = MoyaProvider<AuthMoyaConfiguration>()

    func funcSendUserInfo(email: String, password: String, completion: @escaping (Result<(), SignInErrors>) -> Void) {
        moyaProvider.request(.sendSignInInfo(email: email, password: password)) { (result) in
                switch result {
                case .success(_):
                    print(result)
                    return completion(.success(()))
                case .failure(_):
                    return completion(.failure(.connectionError))
                }
    }
   
        }
}
