//
//  StatisticsViewModel.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 26.05.2022.
//

import Foundation
import Moya

protocol StatisticsViewModelProtocol {
    func getStatistic(league: Int)
    func getAllLeagues() -> [StatisticTeam]
    func goToDetail(leagueID: Int, row: Int)
    var status: Observable<[Statistics]> { get  }
}

class StatisticsViewModel: StatisticsViewModelProtocol {
     
    // MARK: - Variables
    
    var coordinator: StatisticsCoordinator
    var status: Observable<[Statistics]>
    var moyaStatisticsProvider: MoyaProvider<StatisticMoyaConfiguration>
        
    // MARK: - Initialisation

    init(coordinator: StatisticsCoordinator ) {
        self.coordinator = coordinator
        self.status = Observable([])
        self.moyaStatisticsProvider = MoyaProvider<StatisticMoyaConfiguration>()
    }
    
    func getAllLeagues() -> [StatisticTeam] {
        return MockData.leagues
    }
    func goToDetail(leagueID: Int, row: Int) {
        coordinator.navigate(with: .detail(viewModel: self, leagueID: leagueID, row: row))
    }

    func getStatistic(league: Int) {
        moyaStatisticsProvider.request(.getLeagueStats(leagueID: league)) {(result) in
                switch result {
                case .success(let response):
                    var finalData = StatisticsResponse(get: nil, parameters: nil, errors: nil, results: nil, paging: nil, response: [])
                    do {
                        _ = String(data: response.data, encoding: .utf8) ?? "nil"
                          finalData = try JSONDecoder().decode(StatisticsResponse.self, from: response.data)
                    } catch {
                    print(String(describing: error))
                    }
                    self.status.value = finalData.response
                case .failure(let error):
                    print(String(describing: error))
                }
            
        }    }
    
}
