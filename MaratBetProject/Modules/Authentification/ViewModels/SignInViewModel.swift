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
    var coordinator: SignInCoordinator? { get }
    var signInStatus: Observable<String> { get }
    
}
// protocol SignInServiceProtocol {
//    func verifyUser(name: String, password: String, completion: @escaping ((Result<Void, Error>) -> ()))
// }

class SignInViewModel: SignInViewModelProtocol {
    // MARK: - variables
    var signInStatus = Observable("")
    var validator = Validation()
    let service: AuthentificationServiceProtocol! = nil
    var coordinator: SignInCoordinator?
    // MARK: - sign in method
    func signIn(login: String, password: String) {
        if login.isEmpty || password.isEmpty {
            signInStatus.value = "Недопустимая длина 😱"
        } else {
            if service.signInService(login: login, password: password) {
                signInStatus.value = "Успешно! 🟢"
            } else {
                signInStatus.value = " Неправильно введенные данные 🔴"
            }
        }
    }
    // MARK: - coordinator's navigation method call
    func goToApp() {
        coordinator?.navigate(with: .appScreen)
    }
}
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
