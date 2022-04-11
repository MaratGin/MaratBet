//
//  StackViewPatterns.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 10.04.2022.
//

import Foundation
import UIKit

class ButtonsStackView: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        spacing = 20
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 3
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
