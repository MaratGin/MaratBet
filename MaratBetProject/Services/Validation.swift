//
//  Validation.swift
//  MaratBet
//
//  Created by Marat Giniyatov on 10.03.2022.
//

import Foundation
class Validation {
// MARK: - Method to check is string an email or not
func checkEmail(_ email: String) -> Bool {
    let result: Bool
    let regex = "[A-Z0-9a-z]{1,64}@[0-9A-Za-z]{1,64}\\.[a-z]{2,64}"
    let emailPred = NSPredicate(format: "SELF MATCHES %@", regex)
    result = emailPred.evaluate(with: email)
    return result
}

// MARK: - Method to check correction of the password
func checkPassword(_ email: String) -> Bool {
    let result: Bool
    let regex = "(?=.*[0-9])[a-zA-Z0-9]{6,64}"
    let emailPred = NSPredicate(format: "SELF MATCHES %@", regex)
    result = emailPred.evaluate(with: email)
    return result
}
    // MARK: - Method to check correction of the login

    func checkLogin(_ login: String) -> Bool {
        let result: Bool
        let regex = "(?=.*[0-9])[a-zA-Z0-9]{6,12}"
        let loginPred = NSPredicate(format: "SELF MATCHES %@", regex)
        result = loginPred.evaluate(with: login)
        return result
    }
}
