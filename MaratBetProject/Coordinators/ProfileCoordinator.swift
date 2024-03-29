//
//  ProfileCoordinator.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 18.04.2022.
//

import Foundation
import UIKit

class ProfileCoordinator: Coordinator {
    
    // MARK: - Internal variables

    var parentCoordinator: TabBarCoordinator
    
    // MARK: - private variables

    private let navigationController = UINavigationController()
    
    // MARK: - Routes

    enum Route {
        case profile
        case leave
    }
    
    // MARK: - Navigation method
    
    func navigate(with route: Route) {
        switch route {
        case .profile:
            let viewModel = ProfileViewModel(coordinator: self)
            let viewController = ProfileViewController()
            viewController.viewModel = viewModel
            navigationController.pushViewController(viewController, animated: true)
        case .leave:
            parentCoordinator.navigate(with: .leave)
        }
    }
    
    // MARK: - Initialisation

    init(parent: TabBarCoordinator) {
        self.parentCoordinator = parent
    }
    
    // MARK: - ViewController configuration

    func configureMainController() -> UIViewController {
        navigate(with: .profile)
        return navigationController
    }
}
