//
//  MyBasketBallResponse.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 06.05.2022.
//

import Foundation
struct MyBasketBallResponse: Codable {
    let get: String?
    let parameters: Parametr?
    let errors: [Errors]?
    let results: Int?
    var response: [BasketBallMatch]
}
