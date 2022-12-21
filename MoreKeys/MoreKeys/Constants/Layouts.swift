//
//  Layouts.swift
//  Ancient Greek
//
//  Created by Quentin Soubeyran (Perso) on 9/19/22.
//

import SwiftUI
import UIKit

struct Layouts {
    
    static func debug(proxy: TextProxy? = nil, nextKeyboardButton: UIButton? = nil, shape: KeyboardShape = KeyboardShape(), colors: KeyboardColors = KeyboardColors()) -> KeyboardLayout {
        let rows = ["azerytyuiop", "qsdfghjklm", "wxcvbn"]
        let keyboardRows = rows.map {
            $0.map {
                AnyView(KeyView(
                    fromString: String($0),
                    callback: InsertTextCallback(text:String($0), proxy:proxy),
                    shape:shape,
                    colors:colors
            ))
            }}
        var nextKeyboardButtonWrapper:TogglableUIButtonView? = nil
        if nextKeyboardButton != nil {
            nextKeyboardButtonWrapper = TogglableUIButtonView(button:nextKeyboardButton, shape:shape, colors:colors)
            var lastRow = keyboardRows.last!
            lastRow.insert(AnyView(nextKeyboardButtonWrapper), at:lastRow.startIndex)
        }
        return KeyboardLayout(keyboard: KeyboardView(fromViews:keyboardRows, shape:shape, colors:colors), nextKeyboardButton: nextKeyboardButtonWrapper)
    }
    
    static func ancientGreekComplement(proxy: TextProxy? = nil, nextKeyboardButton: UIButton? = nil, shape: KeyboardShape = KeyboardShape(), colors: KeyboardColors = KeyboardColors()) -> KeyboardLayout {
        let row = [
            "{", "}", "\u{0304}", "'", "\u{0387}", "\u{0323}", "[", "]", "\u{301A}", "\u{301B}"
        ]
        var keyboardRow = row.map {
            AnyView(KeyView(
                fromString: String($0),
                callback: InsertTextCallback(text:String($0), proxy:proxy)
        ))}
        var nextKeyboardButtonWrapper:TogglableUIButtonView? = nil
        if nextKeyboardButton != nil {
            nextKeyboardButtonWrapper = TogglableUIButtonView(button:nextKeyboardButton)
            keyboardRow.insert(AnyView(nextKeyboardButtonWrapper), at:keyboardRow.startIndex)
        }
        return KeyboardLayout(keyboard: KeyboardView(fromViews:[keyboardRow], shape:shape, colors:colors), nextKeyboardButton: nextKeyboardButtonWrapper)
    }
}
