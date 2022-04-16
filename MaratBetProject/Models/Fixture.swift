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
    let date: String?
    let periods: String?
    let status: String?

}

struct Venue: Codable {
    let id: Int?
    let name: String?
    let city: String?
}
