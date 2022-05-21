//
//  Fixture.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 10.04.2022.
//

import Foundation
struct Fixture: Codable {
    let id: Int?
    let referee: String?
    let timezone: String?
    let date: String?
    let timestamp: Int?
    let periods: FootballPeriods?
    let venue: Venue?
    let status: Status?

}

struct Venue: Codable {
    let id: Int?
    let name: String?
    let city: String?
}

 struct FootballPeriods: Codable {
    let first: Int?
    let second: Int?
}
struct Status: Codable {
    let long: String?
    let short: String?
    let elapsed: Int?
}
