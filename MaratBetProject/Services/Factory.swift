//
//  Factory.swift
//  MaratBet
//
//  Created by Marat Giniyatov on 26.03.2022.
//

import Foundation
/// На данном этапе разработки использовать паттерн фабрики пока не с чем,
/// поэтому в проекте нет примеров его применения
/// (структуры тоже не имеют ничего общего, с тем, как они должны выглядеть)
// MARK: - Factory pattern realisation
protocol MatchFactory {
    func createMatch() -> Match
}

class HockeyMatchFactory: MatchFactory {
    func createMatch() -> Match {
        print("created Hockey match")
        return HockeyMatch()
    }
}
class FootballMatchFactory: MatchFactory {
    func createMatch() -> Match {
        print("created Football match")
        return FootballMatch()
    }
}
class TennisMatchFactory: MatchFactory {
    func createMatch() -> Match {
        print("created Tennis match")
        return HockeyMatch()
    }
}
