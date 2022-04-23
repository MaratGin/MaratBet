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
    func signUp(login: String, password: String, email: String, repassword: String) -> Bool
    var coordinator: SignUpCoordinator { get }
    var signUpStatus: Observable<String> { get }
    func goToApp()
}
class SignUpViewModel: SignUpViewModelProtocol {
    
    // MARK: - variables
    var signUpStatus: Observable<String>
    var validator: Validation
    var coordinator: SignUpCoordinator
    var signUpService: SignUpService
    
    // MARK: - initialisation method
    init(signUpService: SignUpService, coordinator: SignUpCoordinator) {
        self.signUpService = signUpService
        self.coordinator = coordinator
        signUpStatus = Observable("")
        validator = Validation()
    }
    // MARK: - signUp method
    func signUp(login: String, password: String, email: String, repassword: String) -> Bool {
        if login.isEmpty || password.isEmpty || email.isEmpty || repassword.isEmpty {
            signUpStatus.value = L10n.incorrectData🥺
            return false
        } else {
            if !validator.checkLogin(login) {
                signUpStatus.value = L10n.IncorrectPassword.nOnlyLatinSymblosAndNumbersAllowed🔴
                return false
            } else {
                if !validator.checkEmail(email) {
                    signUpStatus.value = L10n.incorrectEMail🔴
                    return false
                } else {
                    if !validator.checkPassword(password) {
                        signUpStatus.value = L10n.IncorrectPassword.nOnlyLatinSymblosAndNumbersAllowed🔴
                        return false
                    } else {
                        if password != repassword {
                            signUpStatus.value = L10n.enterPasswordsAgain🔴
                            return false
                        } else {
                            signUpStatus.value = L10n.registered🥰
                            goToApp()
                        }
                    }
                }
        }
        }
        // MARK: - network result handling
     /*
        signUpService.funcSendUserInfo(login: login, email: email, password: password) { [weak self] result in
            switch result {
            case .success():
                self?.signUpStatus.value = "Token was succesfully saved!"
            case .failure(_):
                print("error")
                self.goToApp()
                        }
        }
      */
        return true
}
    // MARK: - coordinator's navigation method call
    
    func goToApp() {
        print("goToApp")
        coordinator.navigate(with: .appScreen)
    }
}
