//
//  HockeyTeams.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 06.05.2022.
//

import Foundation
struct HockeyTeams: Codable {
    let home: TeamData?
    let away: TeamData?
}
struct TeamData: Codable {
    let id: Int?
    let name: String?
    let logo: String?
}
