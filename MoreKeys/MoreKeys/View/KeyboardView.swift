//
//  KeyboardView.swift
//  Ancient Greek
//
//  Created by Quentin Soubeyran (Perso) on 7/4/22.
//

import SwiftUI

struct KeyboardView: View {
    var rows: [KeyboardRow]
    var shape: KeyboardShape
    var colors: KeyboardColors
    
    init(rows: [KeyboardRow], shape: KeyboardShape = KeyboardShape(), colors:KeyboardColors =  KeyboardColors()) {
        self.rows = rows
        self.shape = shape
        self.colors = colors
    }
    
    init(fromViews: [[AnyView]], shape: KeyboardShape = KeyboardShape(), colors:KeyboardColors =  KeyboardColors()) {
        self.rows = fromViews.map {
            KeyboardRow(keys: $0, shape:shape, colors:colors)
        }
        self.shape = shape
        self.colors = colors
    }
    
    init<V: View>(fromViews: [[V]], shape: KeyboardShape = KeyboardShape(), colors:KeyboardColors =  KeyboardColors()) {
        self.rows = fromViews.map {
            KeyboardRow(fromViews: $0)
        }
        self.shape = shape
        self.colors = colors
    }
    
    var body: some View {
        VStack(spacing:self.shape.rowSpacing) {
            ForEach(rows.startIndex...rows.endIndex-1, id: \.self) { index in
                    rows[index]
            }
        }
        .padding([.horizontal, .top])
        .background(self.colors.keyboardBackground)
    }
}

struct KeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        Layouts.debug().keyboard
    }
}
