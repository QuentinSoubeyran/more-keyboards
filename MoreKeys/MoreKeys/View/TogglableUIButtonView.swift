//
//  UIButtonView.swift
//  Ancient Greek
//
//  Created by Quentin Soubeyran (Perso) on 9/24/22.
//

import SwiftUI
import UIKit

struct UIButtonWrapper: UIViewRepresentable {
    typealias UIViewType = UIButton
    
    var button: UIButton
    
    func makeUIView(context: Context) -> UIButton {
        return self.button
    }
    
    func updateUIView(_ uiView: UIButton, context: Context) {
        // Nothing to do ?
    }
}

struct TogglableUIButtonView: View {
    
    var button: UIButton? = nil
    
    var shape: KeyboardShape = KeyboardShape()
    var colors: KeyboardColors = KeyboardColors()
    
    var visible: Bool = true
    
    var body: some View {
        if self.button != nil && self.visible {
             UIButtonWrapper(button:self.button!)
                .frame(maxWidth: self.shape.keyWidth, maxHeight: self.shape.keyHeight)
                .background(self.colors.keyBackground)
                .foregroundColor(self.colors.keyForeground)
                .cornerRadius(self.shape.keyRadius)
        }
    }
}

struct UIButtonView_Previews: PreviewProvider {
    static var previews: some View {
        let button = UIButton(type: .custom)
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "globe")
        button.configuration = config
        button.sizeToFit()
        return TogglableUIButtonView(button:button)
    }
}
