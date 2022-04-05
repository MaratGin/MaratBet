//
//  ErrorEnums.swift
//  MaratBet
//
//  Created by Marat Giniyatov on 04.04.2022.
//

import Foundation
enum SignUpErrors: Error {
    case notUniqueEmail
    case connectionError
    case notUniqueLogin
}
enum SignInErrors: Error {
    case wrongData
    case connectionError
}
