//
//  Globals.swift
//  Ancient Greek
//
//  Created by Quentin Soubeyran (Perso) on 9/17/22.
//

import UIKit

enum Globals {
    static var screenWidth: CGFloat {
        UIScreen.main.bounds.size.width
    }
    
    static var screenHeight: CGFloat {
        UIScreen.main.bounds.size.height
    }
    
    static var minDimension: CGFloat {
        min(screenWidth, screenHeight)
    }
    
    static var keyWidth: CGFloat {
        switch minDimension {
        case 0...320:
            return 35
        default:
            return 55
        }
    }
    
    static var keyAspectRatio: CGFloat {
        1
    }
}
