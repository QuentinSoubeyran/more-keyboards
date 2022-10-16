//
//  KeyboardViewController.swift
//  debug
//
//  Created by Quentin Soubeyran (Perso) on 9/21/22.
//

import UIKit
import SwiftUI

struct KeyboardViewTextProxy: TextProxy {
    var controller : KeyboardViewController
    
    func insertText(_ text: String) {
        self.controller.textDocumentProxy.insertText(text)
    }
    
}

class KeyboardViewController: UIInputViewController {

    var nextKeyboardButton: TogglableUIButtonView!
    var wrapper: UIHostingController<KeyboardLayout>?
    
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
    }
    
    func makeNextKeayboardButton(colors: KeyboardColors = KeyboardColors()) -> UIButton {
        // Create a nextKeyboardButton, style it and add the callback
        let nextKeyboardButton = UIButton(type: .custom)
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "globe")!.withRenderingMode(.alwaysTemplate)
        nextKeyboardButton.tintColor = UIColor(colors.keyForeground)
        nextKeyboardButton.configuration = config
        // nextKeyboardButton.sizeToFit()
        
        // nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        return nextKeyboardButton
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let colors = KeyboardColors()
        let nextKeyboardButton = self.makeNextKeayboardButton(colors: colors)
        let proxy = KeyboardViewTextProxy(controller:self)
        let layout = Layouts.ancientGreekComplement(proxy:proxy,nextKeyboardButton:nextKeyboardButton, colors:colors)
        self.nextKeyboardButton = layout.nextKeyboardButton!
        self.wrapper = swiftUIToUIKitViewController(layout, into:self)
        
    }
    
    override func viewWillLayoutSubviews() {
        self.nextKeyboardButton.visible = self.needsInputModeSwitchKey
        super.viewWillLayoutSubviews()
    }

}
