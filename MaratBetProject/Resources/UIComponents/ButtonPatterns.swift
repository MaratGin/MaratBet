//
//  ButtonPatterns.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 10.04.2022.
//

import Foundation
import UIKit

class AuthButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        titleLabel?.font = UIFont(name: "Futura Bold", size: 15)
        setTitleColor(.white, for: .normal)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class OptionButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        titleLabel?.font = UIFont(name: "Futura Bold", size: 18)
        setTitleColor(UIColor.black, for: .normal)
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 2
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 0.0
        layer.masksToBounds = false
        layer.cornerRadius = 3.0
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class BetButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Colors.buttonColor
        layer.cornerRadius = 5
//        titleLabel?.font = UIFont(name: "Futura Bold", size: 12)
        titleLabel?.adjustsFontSizeToFitWidth = true
        setTitleColor(UIColor.black, for: .normal)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
