//
//  KeyboardRow.swift
//  Ancient Greek
//
//  Created by Quentin Soubeyran (Perso) on 9/18/22.
//

import SwiftUI

struct KeyboardRow: View {
    var keys: [AnyView]
    var shape: KeyboardShape
    var colors: KeyboardColors
    
    init(keys: [AnyView], shape: KeyboardShape = KeyboardShape(), colors:KeyboardColors =  KeyboardColors()) {
        self.keys = keys
        self.colors = colors
        self.shape = shape
    }
    
    init<V: View>(fromViews: [V], shape: KeyboardShape = KeyboardShape(), colors:KeyboardColors =  KeyboardColors()) {
        self.keys = fromViews.map {AnyView($0)}
        self.colors = colors
        self.shape = shape
    }
    
    var body: some View {
        HStack(spacing:self.shape.keySpacing) {
            ForEach(keys.startIndex...keys.endIndex-1, id: \.self) { index in
                    keys[index]
            }
        }
        .frame(minWidth:0, maxWidth: .infinity)
        .background(self.colors.keyboardBackground)
    }
}

struct KeyboardRow_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardRow(fromViews:[KeyView(fromString: "a")])
    }
}
