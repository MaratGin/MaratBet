//
//  APIConfiguration.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 10.04.2022.
//

import Foundation
import Moya

protocol MatchListServiceProtocol {
    func getMatches (completion: @escaping (Result<(), SignInErrors>) -> Void)
}
class MatchListService: MatchListServiceProtocol {
    private let moyaProvider = MoyaProvider<MoyaServices>()

    func getMatches(completion: @escaping (Result<(), SignInErrors>) -> Void) {
        moyaProvider.request(.getMatches) { (result) in
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
