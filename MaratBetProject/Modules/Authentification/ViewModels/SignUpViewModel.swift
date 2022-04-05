//
//
//  SignUpViewModel.swift
//  MaratBet
//
//  Created by Marat Giniyatov on 11.03.2022.
//

import Foundation
import UIKit

// MARK: - Sign up protocol
protocol SignUpViewModelProtocol {
    func signUp(login: String, password: String, email: String, repassword: String)
    var coordinator: SignUpCoordinator? { get }
    var signUpStatus: Observable<String> { get }
    func goToApp()
}
class SignUpViewModel: SignUpViewModelProtocol {
    
    // MARK: - variables
    var signUpStatus = Observable("")
    var validator = Validation()
    var coordinator: SignUpCoordinator?
    var signUpService = SignUpService()
    var vc: UIViewController?
    // MARK: - signUp method
    func signUp(login: String, password: String, email: String, repassword: String) {
        if login.isEmpty || password.isEmpty || email.isEmpty || repassword.isEmpty {
            signUpStatus.value = "Некорректные данные 🥺"
        } else {
            if !validator.checkLogin(login) {
                signUpStatus.value = "Некорретно введен логин, допускаются латинские буквы и цифры 🔴"
            } else {
                if !validator.checkEmail(email) {
                    signUpStatus.value = "Некорректно введена почта! 🔴"
                } else {
                    if !validator.checkPassword(password) {
                        signUpStatus.value = "Некорретно введен пароль, допускаются латинские буквы и цифры 🔴"
                    } else {
                        if password != repassword {
                            signUpStatus.value = "Введите пароли заново! 🔴"
                        } else {
                            signUpStatus.value = "Зарегестрирован! 🥰"
                        }
                    }
                }
        }
        }
        signUpService.funcSendUserInfo(login: login, email: email, password: password) { [weak self] result in
            switch result {
            case .success():
                self?.signUpStatus.value = "Token was succesfully saved!"
            case .failure(_):
                print("error")
            }
        }
}
    // MARK: - coordinator's navigation method call
    func goToApp() {
        coordinator?.navigate(with: .appScreen)
    }
}
