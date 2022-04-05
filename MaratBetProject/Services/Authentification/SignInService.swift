//
//  SignInService.swift
//  MaratBet
//
//  Created by Marat Giniyatov on 04.04.2022.
//

import Foundation
import Moya

protocol SignInServiceProtocol {
    func funcSendUserInfo(email: String, password: String, completion: @escaping (Result<(),SignInErrors>) -> Void)
}
class SignInService: SignInServiceProtocol {
    private let moyaProvider = MoyaProvider<MoyaServices>()

    func funcSendUserInfo(email: String, password: String, completion: @escaping (Result<(), SignInErrors>) -> Void) {
        
        
            print("here----------------------------------")
        moyaProvider.request(.sendSignInInfo(email: email, password: password)) { (result) in
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
