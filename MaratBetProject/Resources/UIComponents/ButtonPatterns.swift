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
        titleLabel?.font = UIFont(name: "Futura Bold", size: 15)
        setTitleColor(.white, for: .normal)
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 3
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
