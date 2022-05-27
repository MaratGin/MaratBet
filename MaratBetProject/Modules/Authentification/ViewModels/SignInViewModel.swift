//
//  ViewModel.swift
//  MaratBet
//
//  Created by Marat Giniyatov on 7.03.2022.
//

import Foundation

// MARK: - protocol
protocol SignInViewModelProtocol {
    //    var signInStatus:
    func signIn(login: String, password: String)
    func goToApp()
    var coordinator: SignInCoordinator { get }
    var signInStatus: Observable<String> { get }
}

class SignInViewModel: SignInViewModelProtocol {
    
    // MARK: - variables
    var signInStatus: Observable<String> = Observable("")
    var validator: Validation
    var coordinator: SignInCoordinator
    var signInService: SignInService
    
    init(signInService: SignInService, coordinator: SignInCoordinator) {
        self.signInService = signInService
        self.coordinator = coordinator
        validator = Validation()
    }
    
    // MARK: - sign in method
    
    func signIn(login: String, password: String) {
        if login.isEmpty || password.isEmpty {
            signInStatus.value = L10n.wrongLength😱
        } else {
            if !validator.checkLogin(login) || !validator.checkPassword(password) {
                signInStatus.value = L10n.IncorrectPassword.nOnlyLatinSymblosAndNumbersAllowed🔴
            } else {
                if password == KeychainService.loadPassword() && login == KeychainService.loadLogin() {
                    signInStatus.value = L10n.succesful🥰
                    goToApp()
                }
                
            }
            
        }
        }

    func goToApp() {
        coordinator.navigate(with: .appScreen)
    }
}
    
    // MARK: - coordinator's navigation method call
    
protocol AuthentificationServiceProtocol {
    func signInService(login: String, password: String) -> Bool
}
class AuthentificationMock: AuthentificationServiceProtocol {
    let authLogin = "Marat"
    let authPassword = "Marat1"
    func signInService(login: String, password: String) -> Bool {
        if login == authLogin && password == authPassword {
            return true
        } else {
            return false
            
        }
    }
}
