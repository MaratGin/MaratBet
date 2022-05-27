//
//  FeedViewModel.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 10.04.2022.
//
// swiftlint:disable all

import Foundation
import Moya
import CoreText
import QuartzCore

// MARK: - ViewModel's protocol

protocol FeedViewModelProtocol {
    func getFootballMatches(league: Int)
    func getHockeyMatches(league: Int)
    func getBasketballMatches(league: Int)
    func getAllMatches()
    func showBetDetail(predictions: [UserPrediction])
    func goToDetail(cell: SportCell, dataType: DataType, matchID: Int, predictions: [UserPrediction])
    var coordinator: FeedCoordinator { get }
    var matchStatus: Observable<[SportCell]> { get }
    var betStatus: Observable<BetInfo> { get  }
}

class FeedViewModel: FeedViewModelProtocol {
   
    // MARK: - Variables
    
    var coordinator: FeedCoordinator
    var matchStatus: Observable<[SportCell]>
    var betStatus: Observable<BetInfo>
    var moyaMatchProvider: MoyaProvider<MatchMoyaConfiguration>
    var moyaBetProvider: MoyaProvider<BetMoyaConfiguration>
    
    var allData: [SportCell] = []
    
    // MARK: - Initialisation

    init(coordinator: FeedCoordinator ) {
        self.moyaBetProvider = MoyaProvider<BetMoyaConfiguration>()
        self.coordinator = coordinator
        self.moyaMatchProvider =  MoyaProvider<MatchMoyaConfiguration>()
        self.matchStatus = Observable([])
        self.betStatus = Observable(BetInfo(league: nil, fixture: nil, update: nil, bookmakers: nil))
    }
    
    func goToDetail(cell: SportCell, dataType: DataType, matchID: Int, predictions: [UserPrediction]) {
        print("detail")
        var betRequestType = BetMoyaConfiguration.getFootballBets(matchID: matchID)
        var finalData = BetResponse(get: nil, parameters: nil, errors: nil, results: nil, paging: nil, response: [])
        switch dataType {
        case .top:
            break
        case .football:
            betRequestType = .getFootballBets(matchID: matchID)
        case .basketball:
            betRequestType = .getBasketballBets(matchID: matchID)
        case .hockey:
            betRequestType = .getHockeyBets(matchID: matchID)
        }
        moyaBetProvider.request(betRequestType, completion: { (result) in
            switch result {
            case .success(let response):
                print("success")

                do {
                    _ = String(data: response.data, encoding: .utf8) ?? "nil"
                      finalData = try JSONDecoder().decode(BetResponse.self, from: response.data)
                } catch {
                    print(String(describing: error))
                }
                self.coordinator.navigate(with: .detail(matchData: cell, bookmaker: finalData.response ?? [], predictions: predictions))
            case .failure(let error):
                print(error.localizedDescription)
            }

        })
    }
    
    func showBetDetail(predictions: [UserPrediction]) {
        coordinator.navigate(with: .betDetail(predictions: predictions))
        
    }
    
    func getAllMatches() {
        getHockeyMatches(league: Constants.nhlLeague)
        matchStatus.value = allData
        print(matchStatus.value.count)
    }

    func getFootballMatches(league: Int) {
        print("getFootballMatches")
        
        moyaMatchProvider.request(.getFootballMatches(league: league)) { (result) in
            print("in closure!")

            switch result {
            case .success(let response):
                var finalData = MyFootballResponse(get: nil, parametrs: nil, errors: nil, paging: nil, response: [])
                do {
                    _ = String(data: response.data, encoding: .utf8) ?? "nil"
                      finalData = try JSONDecoder().decode(MyFootballResponse.self, from: response.data)
                } catch {
                    print("123123")
                print(Error.self)
                }
                for item in 0..<finalData.response.count {
                    finalData.response[item].type = "football"
                }
                self.matchStatus.value = finalData.response
                print(" footbalwwl \(finalData.response.count)")
            case .failure(let error):
                print(String(describing: error))
            }
        }

    }
    func getHockeyMatches(league: Int) {
        var finalData = MyHockeyResponse(get: nil, parameters: nil, errors: nil, response: [])
        moyaMatchProvider.request(.getHockeyMatches(league: league)) { (result) in
            switch result {
            case .success(let response):
                do {
                      finalData = try JSONDecoder().decode(MyHockeyResponse.self, from: response.data)
                    for item in 0..<finalData.response.count {
                        finalData.response[item].type = "hockey"
                    }
                } catch {
                    print(error.localizedDescription)
                }
                self.matchStatus.value = finalData.response
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    func getBasketballMatches(league: Int)  {
        moyaMatchProvider.request(.getBasketBallMatches(league: league)) { (result) in
            switch result {
            case .success(let response):
                var finalData = MyBasketBallResponse(get: nil, parameters: nil, errors: nil, results: nil, response: [BasketBallMatch(id: nil, date: nil, time: nil, timestamp: nil, timezone: nil, stage: nil, week: nil, status: nil, league: nil, country: nil, teams: nil, scores: nil)])
                do {
                      finalData = try JSONDecoder().decode(MyBasketBallResponse.self, from: response.data)
                } catch {
                    print(Error.self)
                }
                for item in 0..<finalData.response.count {
                    finalData.response[item].type = "basketball"
                }
                self.matchStatus.value = finalData.response
                print(" basketww \(finalData.response.count)")
                self.allData += finalData.response
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
}
private struct Constants {
    static let englandPL = 39
    static let championsLeague = 2
    static let europaLeague = 3
    static let seriaA = 135
    static let bundesliga = 79
    static let laLiga = 140
    static let nbaLeague = 12
    static let russiaVTB = 82
    static let nhlLeague = 57
    static let khlLeague = 35
}
