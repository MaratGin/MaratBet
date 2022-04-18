//
//  MyResponse.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 18.04.2022.
//

import Foundation
struct MyResponse: Codable {
    let get: String?
    let parametrs: Parametr?
    let errors: [Errors]?
    let paging: Paging?
    let response: [Match]
}

struct Parametr: Codable {
    let date: String?
    let league: Int?
    let season: Int?
}
struct Errors: Codable {

}
struct Paging: Codable {
    let current: Int?
    let total: Int?
}
