//
//  Teams.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 10.04.2022.
//

import Foundation
struct Teams: Codable {
    let home: Home?
    let away: Away?
    
}

struct Home: Codable {
    let id: Int?
    let name: String?
    let logo: String?
    let winner: Bool?
}

struct Away: Codable {
    let id: Int?
    let name: String?
    let logo: String?
    let winner: Bool?
}

