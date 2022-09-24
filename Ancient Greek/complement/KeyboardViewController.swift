//
//  KeyboardViewController.swift
//  debug
//
//  Created by Quentin Soubeyran (Perso) on 9/21/22.
//

import UIKit
import SwiftUI

struct KeyboardViewControllerDelegate: KeyboardDelegate {
    var controller : KeyboardViewController
    
    func insertText(_ text: String) {
        self.controller.textDocumentProxy.insertText(text)
    }
    
}

class KeyboardViewController: UIInputViewController {

    var nextKeyboardButton: TogglableUIButtonView!
    var controller: UIHostingController<KeyboardView>?
    
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a nextKeyboardButton, style it and add the callback
        let nextKeyboardButton = UIButton(type: .custom)
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "globe")!.withRenderingMode(.alwaysOriginal)
        nextKeyboardButton.configuration = config
        nextKeyboardButton.sizeToFit()
        // nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        self.nextKeyboardButton = TogglableUIButtonView(button:nextKeyboardButton)
        
        // Wrap our SwiftUI KeyboardView in a UIHostingController to display SwiftUI view inside the
        // UIKit-based UIInputViewController
        // from https://stackoverflow.com/questions/56631892/addsubview-swiftui-view-to-uikit-uiview-in-swift
        let keyboard = Layouts.ancientGreekComplement(
            delegate:KeyboardViewControllerDelegate(controller:self),
            nextKeyboardButton:self.nextKeyboardButton
        )
        let controller = UIHostingController(rootView:keyboard)
        self.controller = controller
        self.addChild(controller)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        //host.view.frame = self.view.bounds
        self.view.addSubview(controller.view)
        controller.didMove(toParent: self)
        
        NSLayoutConstraint.activate([
                    controller.view.widthAnchor.constraint(equalTo: view.widthAnchor),
                    controller.view.heightAnchor.constraint(equalTo: view.heightAnchor),
                    controller.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    controller.view.centerYAnchor.constraint(equalTo: view.centerYAnchor)
                ])
    }
    
    override func viewWillLayoutSubviews() {
        self.nextKeyboardButton.visible = self.needsInputModeSwitchKey
        super.viewWillLayoutSubviews()
    }

}
