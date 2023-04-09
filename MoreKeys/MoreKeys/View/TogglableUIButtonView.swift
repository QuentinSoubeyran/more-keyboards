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
    
    var styling: KeyboardStyling = KeyboardStyling()
    
    var visible: Bool = true
    
    var body: some View {
        if self.button != nil && self.visible {
             UIButtonWrapper(button:self.button!)
                .frame(maxWidth: self.styling.keyWidth, maxHeight: self.styling.keyHeight)
                .background(self.styling.keyBackground)
                .foregroundColor(self.styling.keyForeground)
                .cornerRadius(self.styling.keyRadius)
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
