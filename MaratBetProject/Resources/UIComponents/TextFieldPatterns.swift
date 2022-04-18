//
//  TextFieldPatterns.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 10.04.2022.
//

import Foundation
import UIKit

class AuthTextField: UITextField {   
    override init(frame: CGRect) {
        super.init(frame: frame)
            isSecureTextEntry = false
            layer.borderColor = UIColor.black.cgColor
            layer.borderWidth = 1.0
            layer.cornerRadius = 8
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
