//
//  Classes.swift
//  Ancient Greek
//
//  Created by Quentin Soubeyran (Perso) on 10/16/22.
//

import UIKit
import SwiftUI

func swiftUIToUIKitViewController<T: View>(_ view: T, into: UIViewController) -> UIHostingController<T> {

        // Create a UIHostingController to wrap the SwiftUI KeyboardView in a UIKit layer
        // to use it in a UIKit custom keyboard
        let wrapper = UIHostingController(rootView:view)
        wrapper.view.translatesAutoresizingMaskIntoConstraints = false
        into.addChild(wrapper)
        into.view.addSubview(wrapper.view)
        wrapper.didMove(toParent: into)

        NSLayoutConstraint.activate([
            wrapper.view.widthAnchor.constraint(equalTo: into.view.widthAnchor),
            wrapper.view.heightAnchor.constraint(equalTo: into.view.heightAnchor),
            wrapper.view.centerXAnchor.constraint(equalTo: into.view.centerXAnchor),
            wrapper.view.centerYAnchor.constraint(equalTo: into.view.centerYAnchor)
                ])
        return wrapper
}

func swiftUIToUIKitView<T: View>(_ view: T, into: UIView) -> UIHostingController<T> {

        // Create a UIHostingController to wrap the SwiftUI KeyboardView in a UIKit layer
        // to use it in a UIKit custom keyboard
        let wrapper = UIHostingController(rootView:view)
        wrapper.view.translatesAutoresizingMaskIntoConstraints = false
        into.addSubview(wrapper.view)
        //wrapper.didMove(toParent: into)

        NSLayoutConstraint.activate([
            wrapper.view.widthAnchor.constraint(equalTo: into.widthAnchor),
            wrapper.view.heightAnchor.constraint(equalTo: into.heightAnchor),
            wrapper.view.centerXAnchor.constraint(equalTo: into.centerXAnchor),
            wrapper.view.centerYAnchor.constraint(equalTo: into.centerYAnchor)
                ])
        return wrapper
}
