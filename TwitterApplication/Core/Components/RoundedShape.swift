//
//  RoundedShape.swift
//  TwitterApplication
//
//  Created by Chetan Choudhary on 11/07/23.
//

import Foundation
import SwiftUI

struct roundedShape: Shape{
    var corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: 80, height: 80))
        
        return Path(path.cgPath)
    }
}
