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

    @IBOutlet var nextKeyboardButton: UIButton!
    var controller: UIHostingController<KeyboardView>?
    
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        //self.host?.view.frame = self.view.bounds
        // let controller = self.controller
        // if controller != nil {
        //    NSLayoutConstraint.activate([
        //                controller!.view.widthAnchor.constraint(equalTo: view.widthAnchor),
        //                controller!.view.heightAnchor.constraint(equalTo: view.heightAnchor),
        //                controller!.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        //                controller!.view.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        //            ])
        // }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // from https://stackoverflow.com/questions/56631892/addsubview-swiftui-view-to-uikit-uiview-in-swift
        let controller = UIHostingController(rootView:Layouts.debug(delegate:KeyboardViewControllerDelegate(controller:self)))
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
        //self.addChild(host)
        
        
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: .system)
        
        // self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        // self.nextKeyboardButton.sizeToFit()
        // self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        // self.view.addSubview(self.nextKeyboardButton)
        
        // self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        // self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    override func viewWillLayoutSubviews() {
        //self.nextKeyboardButton.isHidden = !self.needsInputModeSwitchKey
        super.viewWillLayoutSubviews()
    }

}
