//
//  KeyboardRow.swift
//  Ancient Greek
//
//  Created by Quentin Soubeyran (Perso) on 9/18/22.
//

import SwiftUI

struct KeyboardRow: View {
    var keys: [AnyView]
    
    init(keys: [AnyView]) {
        self.keys = keys
    }
    
    init<V: View>(fromViews: [V]) {
        self.keys = fromViews.map {AnyView($0)}
    }
    
    var body: some View {
        HStack(spacing:Globals.keyWidth / 7.5) {
            ForEach(keys.startIndex...keys.endIndex-1, id: \.self) { index in
                    keys[index]
            }
        }
        .frame(minWidth:0, maxWidth: .infinity)
        .background(Color.keyboardBackground)
    }
}

struct KeyboardRow_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardRow(fromViews:[KeyView(fromString: "a")])
    }
}
