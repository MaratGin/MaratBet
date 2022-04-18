//
//  SignInCoordinator.swift
//  MaratBet
//
//  Created by Marat Giniyatov on 28.03.2022.
//

import Foundation
import UIKit

// MARK: - Coordinator for sign in screen

class SignInCoordinator: Coordinator {
    enum Route {
        case signInScreen
        case appScreen
    }
    
    // MARK: - Variables
    
    var mainCoordinator: MainCoordinator?
    
    // MARK: - Navigation method
    
    func navigate(with route: Route) {
        switch route {
        case .signInScreen:
            break
        case .appScreen:
            mainCoordinator?.navigate(with: .tabBar)
        }
    }
    
    // MARK: - ViewController configuration
    
    func configureViewController(id: Int) -> UIViewController {
        let viewController = SignInViewController()
        let signInService = SignInService()
        viewController.viewModel = SignInViewModel(signInService: signInService, coordinator: self)
        return viewController
    }
}
