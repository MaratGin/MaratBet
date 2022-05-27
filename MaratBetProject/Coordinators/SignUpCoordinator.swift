//
//  AuthentificationCoordinator.swift
//  MaratBet
//
//  Created by Marat Giniyatov on 16.03.2022.
//

import Foundation
import UIKit

// MARK: - Coordinator for sign up screen

class SignUpCoordinator: Coordinator {
    
    enum Route {
        case signUpScreen
        case appScreen
    }
    // MARK: - Variables
    
    private let navigationController = UINavigationController()
    var mainCoordinator: MainCoordinator?
    
    // MARK: - coordinator's navigation method
    
    func navigate(with route: Route) {
        switch route {
        case .signUpScreen:
            break
        case .appScreen:
            mainCoordinator?.navigate(with: .tabBar)
        }
    }
    
    func configureViewController(id: Int) -> UIViewController {
        let viewController = SignUpViewController()
        let signUpService = SignUpService()
        let viewModel = SignUpViewModel(signUpService: signUpService, coordinator: self)
        viewController.viewModel = viewModel
        return viewController
    }
}
