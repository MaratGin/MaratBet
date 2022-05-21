//
//  Sport.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 02.05.2022.
//

import Foundation
import UIKit
struct Sport {
    let name: String?
    let icon: UIImage?
    let selectedColor: UIColor?
    var isSelected: Bool
}

protocol SportCell {
    var type: String? { get }
}
