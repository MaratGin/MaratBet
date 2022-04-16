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
    static func saveToken(token: String) {
        keychain["token"] = token
    }
    static func loadToken(token: String) -> String? {
        return keychain["token"]
    }
    static func deleteToken(token: String) {
        keychain["token"] = nil
    }
}
