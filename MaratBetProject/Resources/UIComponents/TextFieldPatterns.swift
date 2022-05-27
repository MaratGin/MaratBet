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

class BaseTextField: UITextField {

    init(placeHolder: String?=nil) {
        super.init(frame: CGRect.zero)
        
        font = UIFont(name: "Futura Bold", size: 13)
        returnKeyType = .next
        
        attributedPlaceholder = NSAttributedString(string: placeHolder ?? "", attributes: [NSAttributedString.Key.font: UIFont(name: "Futura Bold", size: 14) as Any, NSAttributedString.Key.foregroundColor: UIColor.lightGray])

        autocorrectionType = .no
        autocapitalizationType = .none
        enablesReturnKeyAutomatically = true
        tintColor = .lightGray
        textColor = .black
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: super.intrinsicContentSize.width, height: 45)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CustomTextField: UITextField {
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width, height: bounds.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width, height: bounds.height)
    }
    
    init(placeHolder: String?=nil) {
        super.init(frame: CGRect.zero)
        
        font = UIFont(name: "Futura Bold", size: 14)
        returnKeyType = .next
        
        attributedPlaceholder = NSAttributedString(string: placeHolder ?? "", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14) ?? .systemFont(ofSize: 10), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
        autocorrectionType = .no
        autocapitalizationType = .none
        enablesReturnKeyAutomatically = true
        
        tintColor = .lightGray
        textColor = .white
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: super.intrinsicContentSize.width, height: 45)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
