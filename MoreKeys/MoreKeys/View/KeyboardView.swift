//
//  KeyboardView.swift
//  Ancient Greek
//
//  Created by Quentin Soubeyran (Perso) on 7/4/22.
//

import SwiftUI

struct KeyboardView: View {
    var rows: [KeyboardRow]
    var styling: KeyboardStyling
    
    init(rows: [KeyboardRow], styling: KeyboardStyling = KeyboardStyling()) {
        self.rows = rows
        self.styling = styling
    }
    
    init(fromViews: [[AnyView]], styling: KeyboardStyling = KeyboardStyling()) {
        self.rows = fromViews.map {
            KeyboardRow(keys: $0, styling:styling)
        }
        self.styling = styling
    }
    
    init<V: View>(fromViews: [[V]], styling: KeyboardStyling = KeyboardStyling()) {
        self.rows = fromViews.map {
            KeyboardRow(fromViews: $0, styling:styling)
        }
        self.styling = styling
    }
    
    var body: some View {
        VStack(spacing:self.styling.rowSpacing) {
            ForEach(rows.startIndex...rows.endIndex-1, id: \.self) { index in
                    rows[index]
            }
        }
        .padding([.horizontal, .top])
        .background(self.styling.keyboardBackground)
    }
}

struct KeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        Layouts.debug().keyboard
    }
}
