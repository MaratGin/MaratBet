//
//  MyHockeyResponse.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 06.05.2022.
//

import Foundation
struct MyHockeyResponse: Codable {
    let get: String?
    let parameters: Parametr?
    let errors: [Errors]?
    var response: [HockeyMatch]
}
