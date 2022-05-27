//
//  UIImage+Decompression.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 27.05.2022.
//

import Foundation
import UIKit

extension UIImage {
    
  var decompressedImage: UIImage {
    UIGraphicsBeginImageContextWithOptions(size, true, 0)
    draw(at: CGPoint.zero)
    guard let decompressedImage = UIGraphicsGetImageFromCurrentImageContext() else {
      return UIImage()
    }
    UIGraphicsEndImageContext()
    return decompressedImage
  }
}
