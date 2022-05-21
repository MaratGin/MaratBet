//
//  League.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 10.04.2022.
//

import Foundation

struct League: Codable {
    let id: Int?
    let name: String?
    let country: String?
    let logo: String?
    let flag: String?
//    let season: Int?
    let round: String?
}

struct HockeyLeague: Codable {
    let id: Int?
    let name: String?
    let type: String?
    let logo: String?
    let season: Int?
}
struct BasktetballLeague: Codable {
    let id: Int?
    let name: String?
    let type: String?
    let logo: String?
    let season: String?
}
