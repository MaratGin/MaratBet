//
//  FeedViewModel.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 10.04.2022.
//
// swiftlint:disable all

import Foundation
import Moya
// MARK: - ViewModel's protocol

protocol FeedViewModelProtocol {
    //    var signInStatus:
    //    func signIn(login: String, password: String)
    func getFootballMatches()
    func getFootballBets()
    var coordinator: FeedCoordinator { get }
    var signInStatus: Observable<[Match]> { get }
}

class FeedViewModel: FeedViewModelProtocol {
    
    // MARK: - Variables

    var coordinator: FeedCoordinator
    var signInStatus: Observable<[Match]>
    var moyaProvider: MoyaProvider<MoyaServices>
    
    // MARK: - Initialisation

    init(coordinator: FeedCoordinator ) {
        self.coordinator = coordinator
        self.moyaProvider =  MoyaProvider<MoyaServices>()
        self.signInStatus = Observable([Match(fixture: nil, league: nil, teams: nil, goals: nil, score: nil)])
    }

    func getFootballMatches() {
        moyaProvider.request(.getMatches) { (result) in
            switch result {
            case .success(let response):
                var finalData = MyResponse(get: nil, parametrs: nil, errors: nil, paging: nil, response: [Match(fixture: nil, league: nil, teams: nil, goals: nil, score: nil)])
                do {
                    let token = String(data: response.data, encoding: .utf8) ?? "nil"

                    try print(token)
                      finalData = try JSONDecoder().decode(MyResponse.self, from: response.data)
                } catch {
                    print(Error.self)
                }
                self.signInStatus.value = finalData.response
            case .failure(let error):
                print(error)
            }
            
        }
    }
        
    func getFootballBets() {
            print("")
        }
}
