//
//  BalanceCoordinator.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 18.04.2022.
//

import Foundation
import UIKit
class BalanceCoordinator: Coordinator {
    
    // MARK: - Internal variables
    
    var parentCoordinator: TabBarCoordinator
    
    // MARK: - private variables

    private let navigationController = UINavigationController()
    
    // MARK: - Routes

    enum Route {
        case balance
    }
    
    // MARK: - Initialization

    init(parent: TabBarCoordinator) {
        self.parentCoordinator = parent
    }
    
    // MARK: - Navigation method
    
    func navigate(with route: Route) {
        switch route {
        case .balance:
            let viewController = BalanceViewController()
            //            viewController.viewModel = FeedViewModel(coordinator: self)
            navigationController.pushViewController(viewController, animated: true)
        }
    }
    
    // MARK: - ViewController configuration

    func configureMainController() -> UIViewController {
        navigate(with: .balance)
        return navigationController
    }
}
