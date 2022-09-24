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
    
    var width: CGFloat = Globals.keyWidth
    var height: CGFloat = Globals.keyWidth * Globals.keyAspectRatio
    var radius: CGFloat = Globals.keyWidth / 5.5
    var color: Color = Color.keyBackground
    
    var visible: Bool = true
    
    var body: some View {
        if self.button != nil && self.visible {
             UIButtonWrapper(button:self.button!)
                .frame(width: self.width, height: self.height)
                .foregroundColor(Color.primary)
                .background(self.color)
                .cornerRadius(self.radius)
        }
    }
}

struct UIButtonView_Previews: PreviewProvider {
    static var previews: some View {
        let button = UIButton(type: .system)
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "globe")!.withRenderingMode(.alwaysOriginal)
        button.configuration = config
        button.sizeToFit()
        return TogglableUIButtonView(button:button)
    }
}
