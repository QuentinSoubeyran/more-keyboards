//
//  KeyboardLayout.swift
//  Ancient Greek
//
//  Created by Quentin Soubeyran (Perso) on 10/16/22.
//

import SwiftUI

struct KeyboardLayout: View {
    var keyboard: KeyboardView
    var nextKeyboardButton: TogglableUIButtonView? = nil
    
    var body: some View {
        self.keyboard
    }
}

struct KeyboardLayout_Previews: PreviewProvider {
    static var previews: some View {
        Layouts.debug()
    }
}
