//
//  KeyView.swift
//  Ancient Greek
//
//  Created by Quentin Soubeyran (Perso) on 9/18/22.
//

import SwiftUI

struct KeyView: View {
    
    var content: AnyView = AnyView(Text("a"))
    var callback: Callback? = nil
    
    var styling: KeyboardStyling
    
    init(fromString: String = "a", callback: Callback? = nil, styling: KeyboardStyling = KeyboardStyling())
    {
        self.content = AnyView(Text(fromString))
        self.callback = callback
        self.styling = styling
    }
    
    init<V: View>(fromView: V, callback: Callback? = nil, styling: KeyboardStyling = KeyboardStyling())
    {
        self.content = AnyView(fromView)
        self.callback = callback
        self.styling = styling
    }
    
    
    var body: some View {
        Button {
            callback?.exec()
        } label: {
            self.content
                .font(self.styling.font)
                .frame(maxWidth: self.styling.keyWidth, minHeight: self.styling.keyHeight, maxHeight: self.styling.keyHeight)
                .background(self.styling.keyBackground)
                .foregroundColor(self.styling.keyForeground)
                .cornerRadius(self.styling.keyRadius)
        }
        .buttonStyle(.plain)
    }
}

struct KeyView_Previews: PreviewProvider {
    static var previews: some View {
        KeyView()
    }
}
