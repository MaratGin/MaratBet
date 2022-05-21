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
    func getFootballBets()
    func getAllMatches()
    func goToDetail(cell: SportCell, dataType: DataType, matchID: Int)
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
    
    func goToDetail(cell: SportCell, dataType: DataType, matchID: Int) {
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
                    let token = String(data: response.data, encoding: .utf8) ?? "nil"
//                    try print(token)
                      finalData = try JSONDecoder().decode(BetResponse.self, from: response.data)
//                    print(finalData.get?.description)
                } catch {
                    print("123123")
//                    print(error.localizedDescription)
                    print(String(describing: error))
                }
                self.coordinator.navigate(with: .detail(matchData: cell, bookmaker: finalData.response ?? []))
            case .failure(let error):
                print(error)
            }

        })
    }
    
    func getAllMatches() {
        getHockeyMatches(league: Constants.nhlLeague)
        matchStatus.value = allData
        print(matchStatus.value.count)
    }

    func getFootballMatches(league: Int) {
        // TODO: -weak self
        print("getFootballMatches")
        
        moyaMatchProvider.request(.getFootballMatches(league: league)) { (result) in
            print("in closure!")

            switch result {
            case .success(let response):
                var finalData = MyFootballResponse(get: nil, parametrs: nil, errors: nil, paging: nil, response: [])
                do {
                    let token = String(data: response.data, encoding: .utf8) ?? "nil"
                    try print(token)
                      finalData = try JSONDecoder().decode(MyFootballResponse.self, from: response.data)
//                    print(finalData.get?.description)
                } catch {
                    print("123123")
                print(Error.self)
                }
                for item in 0..<finalData.response.count {
                    finalData.response[item].type = "football"
                }
//                self.matchStatus.value += finalData.response
                self.matchStatus.value = finalData.response
//                self.signInStatus.value = finalData.response
                print(" footbalwwl \(finalData.response.count)")
            case .failure(let error):
                print(error)
            }
        }

    }

    
    func getHockeyMatches(league: Int) {
        print("HOCKEY!")

        var finalData = MyHockeyResponse(get: nil, parameters: nil, errors: nil, response: [])
        moyaMatchProvider.request(.getHockeyMatches(league: league)) { (result) in
            print("in closure!")

            switch result {
            case .success(let response):
                
                do {
//                    let token = String(data: response.data, encoding: .utf8) ?? "nil"
//                    print(token)
                      finalData = try JSONDecoder().decode(MyHockeyResponse.self, from: response.data)
                    for item in 0..<finalData.response.count {
                        finalData.response[item].type = "hockey"
                    }
                } catch {
//                    self.errorrr = error.self
                    print(error.localizedDescription)
                }
                self.matchStatus.value = finalData.response
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getBasketballMatches(league: Int)  {
        moyaMatchProvider.request(.getBasketBallMatches(league: league)) { (result) in
            switch result {
            case .success(let response):
                var finalData = MyBasketBallResponse(get: nil, parameters: nil, errors: nil, results: nil, response: [BasketBallMatch(id: nil, date: nil, time: nil, timestamp: nil, timezone: nil, stage: nil, week: nil, status: nil, league: nil, country: nil, teams: nil, scores: nil)])
                do {
                   // let token = String(data: response.data, encoding: .utf8) ?? "nil"
//                    try print(token)
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
                print(error)
            }
        }
    }
    
    func getHockeyBets() {
        
        
    }
    func getBasketballBets() {
        
    }
    func getTop() {
        
    }
    func getFootballBets() {
            print("")
       
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
//FootballMatch(fixture: nil, league: nil, teams: nil, goals: nil, score: nil),HockeyMatch(country: nil, date: nil, events: nil, id: nil, league: nil, periods: nil, scores: nil, status: nil, teams: nil, time: nil, timer: nil, timestamp: nil, timezone: nil, week: nil),BasketBallMatch(id: nil, date: nil, time: nil, timestamp: nil, timezone: nil, stage: nil, week: nil, status: nil, league: nil, country: nil, teams: nil, scores: nil)
