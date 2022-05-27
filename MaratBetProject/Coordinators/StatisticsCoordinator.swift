//
//  FriendsCoordinator.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 18.04.2022.
//

import Foundation
import UIKit

class StatisticsCoordinator: Coordinator {
    
    // MARK: - Internal variables

    var parentCoordinator: TabBarCoordinator
    
    // MARK: - private variables

    private let navigationController = UINavigationController()
    
    // MARK: - Routes

    enum Route {
        case statistic
        case detail(viewModel: StatisticsViewModelProtocol, leagueID: Int, row: Int)
    }
    
    // MARK: - Initialisation

    init(parent: TabBarCoordinator) {
        self.parentCoordinator = parent
    }
    
    // MARK: - Navigation method
    
    func navigate(with route: Route) {
        switch route {
        case .statistic:
            let viewController = StatisticsViewController()
            let viewModel = StatisticsViewModel(coordinator: self)
            viewController.viewModel = viewModel
            navigationController.pushViewController(viewController, animated: true)
        case .detail(let viewModel, let leagueID, let row):
            let viewController = StatisticsDetailViewController()
            viewController.viewModel = viewModel
            viewController.leagueID = leagueID
            viewController.row = row
            navigationController.pushViewController(viewController, animated: true)
        }
    }
    
    // MARK: - ViewController configuration

    func configureMainController() -> UIViewController {
        navigate(with: .statistic)
        return navigationController
    }
}
