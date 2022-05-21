//
//  Match.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 17.04.2022.
//

import Foundation
struct FootballMatch: Codable, SportCell {
    var type: String?
    let fixture: Fixture?
    let league: League?
    let teams: Teams?
    let goals: Goals?
    let score: Score?
}
