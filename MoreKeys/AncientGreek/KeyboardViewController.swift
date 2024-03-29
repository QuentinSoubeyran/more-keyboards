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
    
    func makeNextKeyboardButton(styling: KeyboardStyling = KeyboardStyling()) -> UIButton {
        // Create a nextKeyboardButton, style it and add the callback
        let nextKeyboardButton = UIButton(type: .custom)
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "globe")!.withRenderingMode(.alwaysTemplate)
        nextKeyboardButton.tintColor = UIColor(styling.keyForeground)
        nextKeyboardButton.configuration = config
        // nextKeyboardButton.sizeToFit()
        
        // nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        return nextKeyboardButton
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nextKeyboardButton = self.makeNextKeyboardButton(styling: Styles.ancientGreek)
        let proxy = KeyboardViewTextProxy(controller:self)
        let layout = Layouts.ancientGreekComplement(proxy:proxy,nextKeyboardButton:nextKeyboardButton)
        self.nextKeyboardButton = layout.nextKeyboardButton!
        self.wrapper = swiftUIToUIKitViewController(layout, into:self)
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
    }
    
    override func viewWillLayoutSubviews() {
        self.nextKeyboardButton.visible = self.needsInputModeSwitchKey
        super.viewWillLayoutSubviews()
    }

}
