//
//  File.swift
//  Ancient Greek
//
//  Created by Quentin Soubeyran (Perso) on 10/16/22.
//

import SwiftUI
import UIKit

struct KeyboardStyling {
    var keyboardBackground: Color = Color("keyboardBackground")
    var keyBackground: Color = Color("keyBackground")
    var keyForeground: Color = Color.primary
    
    var keyWidth: CGFloat = Globals.keyWidth
    var keyHeight: CGFloat = Globals.keyWidth * Globals.keyAspectRatio
    var keyRadius: CGFloat = Globals.keyWidth / 5.5
    
    var keySpacing: CGFloat = Globals.keyWidth / 7.5
    var rowSpacing: CGFloat = Globals.keyWidth / 7.5

    var font: Font = Font.system(size: 30)
}
