//
//  KeychainService.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 10.04.2022.
//

import Foundation
import KeychainAccess

enum KeychainService {
    private static let keychain = Keychain(service: "com.maratbetproject")
    static func saveLogin(login: String) {
        keychain["token"] = login
    }
    static func loadLogin() -> String? {
        return keychain["token"]
    }
    static func deleteLogin(login: String) {
        keychain["token"] = nil
    }
    static func saveBalance(balance: Int) {
        keychain["balance"] = String(balance)
    }
    static func loadbalance() -> String? {
        return keychain["balance"]
    }
    static func deleteBalance() {
        keychain["balance"] = nil
    }
    static func savePassword(password: String) {
        keychain["password"] = password
    }
    static func loadPassword() -> String? {
        return keychain["password"]
    }
    static func deleteLogin(password: String) {
        keychain["password"] = nil
    }
    
}
