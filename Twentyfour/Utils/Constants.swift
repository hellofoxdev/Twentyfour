//
//  Constants.swift
//  Twentyfour
//
//  Created by Sebastian Fox on 27.09.22.
//

import Foundation
import UIKit
import SwiftUI

// Screen width.
public var screenWidth: CGFloat {
    return UIScreen.main.bounds.width
}

// Screen height.
public var screenHeight: CGFloat {
    return UIScreen.main.bounds.height
}

func dynamicColorGradient(colors: [Color]) -> LinearGradient {
    return LinearGradient(
        gradient: Gradient(
            colors: colors),
        startPoint: .top,
        endPoint: .bottom)
}
