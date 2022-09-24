//
//  KeyboardView.swift
//  Ancient Greek
//
//  Created by Quentin Soubeyran (Perso) on 7/4/22.
//

import SwiftUI

struct KeyboardView: View {
    var rows: [KeyboardRow]
    
    init(rows: [KeyboardRow]) {
        self.rows = rows
    }
    
    init(fromViews: [[AnyView]]) {
        self.rows = fromViews.map {
            KeyboardRow(keys: $0)
        }
    }
    
    init<V: View>(fromViews: [[V]]) {
        self.rows = fromViews.map {
            KeyboardRow(fromViews: $0)
        }
    }
    
    var body: some View {
        VStack(spacing:Globals.keyWidth / 7.5) {
            ForEach(rows.startIndex...rows.endIndex-1, id: \.self) { index in
                    rows[index]
            }
        }
        .padding([.horizontal, .top])
        .background(Color.systemBackground)
    }
}

struct KeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        Layouts.debug()
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
