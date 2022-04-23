//
//  FeedCoordinator.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 17.04.2022.
//

import Foundation
import UIKit

class FeedCoordinator: Coordinator {
    
    // MARK: - Internal variables

    var parentCoordinator: TabBarCoordinator
    
    // MARK: - private variables

    private let navigationController = UINavigationController()
    
    // MARK: Routes
    
    enum  Route {
        case feed
    }
    
    // MARK: - Initialisation

    init(parent: TabBarCoordinator) {
        self.parentCoordinator = parent
    }
    
    // MARK: - Navigation method
    
    func navigate(with route: Route)  {
        switch route {
        case .feed:
            let viewController = FeedViewController()
            viewController.viewModel = FeedViewModel(coordinator: self)
            navigationController.pushViewController(viewController, animated: true)
        }
    }
    
    // MARK: - ViewController configuration

    func configureMainController() -> UIViewController {
        navigate(with: .feed)
        return navigationController
    }
}
