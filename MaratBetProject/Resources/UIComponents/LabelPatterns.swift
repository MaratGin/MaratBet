//
//  LabelPatterns.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 11.04.2022.
//

import Foundation
import UIKit

class LogoLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        text = "MaratBet"
        font = UIFont(name: "Futura Bold", size: 45)
        textColor = UIColor.systemYellow
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class AuthLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        text = "MaratBet"
        font = UIFont(name: "Futura Bold", size: 40)
        textColor = UIColor.black
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class StatusLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        text = "MaratBet"
        font = UIFont(name: "Futura Bold", size: 13)
        textColor = UIColor.white
        textAlignment = .center
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class BetNameLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        font = UIFont(name: "Futura Bold", size: 16)
        textColor = UIColor.black
        textAlignment = .center
        adjustsFontSizeToFitWidth = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class CoefficientLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        font = UIFont(name: "Futura Bold", size: 20)
        textColor = .white
        textAlignment = .left
        adjustsFontSizeToFitWidth = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ProfileLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        font = UIFont(name: "Futura Bold", size: 24)
        textColor = .white
        textAlignment = .left
        adjustsFontSizeToFitWidth = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class BalanceLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        font = UIFont(name: "Futura Bold", size: 44)
        textColor = .white
        textAlignment = .center
        adjustsFontSizeToFitWidth = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class StatisticNameLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        font = UIFont(name: "Futura Bold", size: 45)
        textColor = .white
        textAlignment = .center
        adjustsFontSizeToFitWidth = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class TableLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        font = UIFont(name: "Futura Bold", size: 12)
        textColor = .white
        textAlignment = .left
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
