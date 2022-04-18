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
            signInStatus.value = "Недопустимая длина 😱"
        } else {
            if !validator.checkLogin(login) || !validator.checkPassword(password) {
                goToApp()
                signInStatus.value = "Некорретно введен пароль, допускаются латинские буквы и цифры 🔴"
            }        }            
        }
//        signInService.funcSendUserInfo(email: login, password: password) {[weak self] result in
//            switch result {
//            case .success():
//                self?.signInStatus.value = "Успешно!🥰"
//            case .failure(_):
//                self?.signInStatus.value = "Ошибка соединения.. повториите вход🙁"
//            }
        
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
