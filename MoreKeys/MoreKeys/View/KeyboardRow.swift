//
//  KeyboardRow.swift
//  Ancient Greek
//
//  Created by Quentin Soubeyran (Perso) on 9/18/22.
//

import SwiftUI

struct KeyboardRow: View {
    var keys: [AnyView]
    var styling: KeyboardStyling
    
    init(keys: [AnyView], styling: KeyboardStyling = KeyboardStyling()) {
        self.keys = keys
        self.styling = styling
    }
    
    init<V: View>(fromViews: [V], styling: KeyboardStyling = KeyboardStyling()) {
        self.keys = fromViews.map {AnyView($0)}
        self.styling = styling
    }
    
    var body: some View {
        HStack(spacing:self.styling.keySpacing) {
            ForEach(keys.startIndex...keys.endIndex-1, id: \.self) { index in
                    keys[index]
            }
        }
        .frame(minWidth:0, maxWidth: .infinity)
        .background(self.styling.keyboardBackground)
    }
}

struct KeyboardRow_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardRow(fromViews:[KeyView(fromString: "a")])
    }
}
