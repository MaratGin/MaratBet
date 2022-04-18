//
//  Score.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 10.04.2022.
//

import Foundation
struct Score: Codable {
    let halftime: Halftime?
    let fulltime: Fulltime?
    let extratime: Extratime?
    let penalty: Penalty?
}

struct Halftime: Codable {
    let home: Int?
    let away: Int?
}

struct Fulltime: Codable {
    let home: Int?
    let away: Int?
}

struct Extratime: Codable {
    let home: Int?
    let away: Int?
}

struct Penalty: Codable {
    let home: Int?
    let away: Int?
}
