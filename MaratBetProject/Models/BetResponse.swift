//
//  Bet.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 10.05.2022.
//

import Foundation

struct BetResponse: Codable {
    let get: String?
    let parameters: BetParameters?
    let errors: Errors?
    let results: Int?
    let paging: Paging?
    let response: [BetInfo]?
}

struct BetParameters: Codable {
    let bookmaker: String?
    let fixture: String?
    let game: String?
}
