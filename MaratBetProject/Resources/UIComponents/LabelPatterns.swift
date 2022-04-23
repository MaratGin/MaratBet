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
        font = UIFont(name: "Futura Bold", size: 10)
        textColor = UIColor.white
        textAlignment = .center
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
