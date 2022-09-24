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
    
    var width: CGFloat = Globals.keyWidth
    var height: CGFloat = Globals.keyWidth * Globals.keyAspectRatio
    var radius: CGFloat = Globals.keyWidth / 5.5
    var color: Color = Color.keyBackground
    
    init(fromString: String = "a", callback: Callback? = nil, width: CGFloat = Globals.keyWidth, height: CGFloat = Globals.keyWidth * Globals.keyAspectRatio, radius: CGFloat = Globals.keyWidth / 5.5, color: Color = Color.keyBackground)
    {
        self.content = AnyView(Text(fromString))
        self.callback = callback
        self.width=width
        self.height=height
        self.radius=radius
        self.color=color
    }
    
    init<V: View>(fromView: V, callback: Callback? = nil, width: CGFloat = Globals.keyWidth, height: CGFloat = Globals.keyWidth * Globals.keyAspectRatio, radius: CGFloat = Globals.keyWidth / 5.5, color: Color = Color.keyBackground)
    {
        self.content = AnyView(fromView)
        self.callback=callback
        self.width=width
        self.height=height
        self.radius=radius
        self.color=color
    }
    
    
    var body: some View {
        Button {
            callback?.exec()
        } label: {
            self.content
                .font(.system(size: 30))
                .frame(width: self.width, height: self.height)
                .foregroundColor(Color.primary)
                .background(self.color)
                .cornerRadius(self.radius)
        }
        .buttonStyle(.plain)
    }
}

struct KeyView_Previews: PreviewProvider {
    static var previews: some View {
        KeyView()
    }
}
