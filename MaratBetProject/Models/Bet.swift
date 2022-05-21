//
//  Bet.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 10.05.2022.
//

import Foundation
struct Bet: Codable {
    let id: Int?
    let name: String?
    let values: [Values]?
}
struct BetInfo: Codable {
    let league: League?
    let fixture: Fixture?
    let update: String?
    let bookmakers: [Bookmaker]?
}

struct Bookmaker: Codable {
    let id: Int?
    let name: String?
    let bets: [Bet]?
}
struct Values: Codable {
    let value: StringOrDouble?
    let odd: String?

}

enum StringOrDouble: Codable {
    
    case string(String)
    case double(Double)
    
    init(from decoder: Decoder) throws {
        if let double = try? decoder.singleValueContainer().decode(Double.self) {
            self = .double(double)
            return
        }
        if let string = try? decoder.singleValueContainer().decode(String.self) {
            self = .string(string)
            return
        }
        throw Error.couldNotFindStringOrDouble
    }
    enum Error: Swift.Error {
        case couldNotFindStringOrDouble
    }
}
