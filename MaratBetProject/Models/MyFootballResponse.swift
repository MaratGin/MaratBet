//
//  MyResponse.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 18.04.2022.
//

import Foundation
struct MyFootballResponse: Codable {
    let get: String?
    let parametrs: Parametr?
    let errors: [Errors]?
    let paging: Paging?
    var response: [FootballMatch]
}

struct Parametr: Codable {
    let date: String?
    let league: String?
    let season: String?
}
struct Errors: Codable {

}
struct Paging: Codable {
    let current: Int?
    let total: Int?
}
