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
    
    var shape: KeyboardShape
    var colors: KeyboardColors
    
    init(fromString: String = "a", callback: Callback? = nil, shape: KeyboardShape = KeyboardShape(), colors:KeyboardColors =  KeyboardColors())
    {
        self.content = AnyView(Text(fromString))
        self.callback = callback
        self.shape = shape
        self.colors = colors
    }
    
    init<V: View>(fromView: V, callback: Callback? = nil, shape: KeyboardShape = KeyboardShape(), colors:KeyboardColors =  KeyboardColors())
    {
        self.content = AnyView(fromView)
        self.callback=callback
        self.shape = shape
        self.colors = colors
    }
    
    
    var body: some View {
        Button {
            callback?.exec()
        } label: {
            self.content
                .font(.system(size: 30))
                .frame(maxWidth: self.shape.keyWidth, minHeight: self.shape.keyHeight, maxHeight: self.shape.keyHeight)
                .background(self.colors.keyBackground)
                .foregroundColor(self.colors.keyForeground)
                .cornerRadius(self.shape.keyRadius)
                
                
        }
        .buttonStyle(.plain)
    }
}

struct KeyView_Previews: PreviewProvider {
    static var previews: some View {
        KeyView()
    }
}
