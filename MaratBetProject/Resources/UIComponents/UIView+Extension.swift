//
//  UIView+Extension.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 27.05.2022.
//
// swiftlint:disable all


import Foundation
import UIKit
extension UIView {
    
    public func activate(constraints: [NSLayoutConstraint]) {
           translatesAutoresizingMaskIntoConstraints = false
           NSLayoutConstraint.activate(constraints)
       }
   
   public func add(subview: UIView, createConstraints: (_ view: UIView, _ parent: UIView) -> ([NSLayoutConstraint])) {
          addSubview(subview)
          
          subview.activate(constraints: createConstraints(subview, self))
      }
   
public func addSeparatorLine(color: UIColor) {
       let view = UIView()
       view.backgroundColor = color
       if #available(iOS 9.0, *) {
           add(subview: view) { (v, p) in [
               v.bottomAnchor.constraint(equalTo: p.bottomAnchor),
               v.leadingAnchor.constraint(equalTo: p.leadingAnchor),
               v.trailingAnchor.constraint(equalTo: p.trailingAnchor),
               v.heightAnchor.constraint(equalToConstant: 0.5)
               ]}
       }
   }
}
