//
//  Layouts.swift
//  Ancient Greek
//
//  Created by Quentin Soubeyran (Perso) on 9/19/22.
//

import SwiftUI
import UIKit

struct Layouts {
    
    static func debug(delegate: KeyboardDelegate? = nil, nextKeyboardButton: TogglableUIButtonView? = nil) -> KeyboardView {
        let rows = ["azerytyuiop", "qsdfghjklm", "wxcvbn"]
        let keyboardRows = rows.map {
            $0.map {
                AnyView(KeyView(
                    fromString: String($0),
                    callback: InsertTextCallback(text:String($0), delegate:delegate)
            ))
            }}
        if nextKeyboardButton != nil {
            var lastRow = keyboardRows.last!
            lastRow.insert(AnyView(nextKeyboardButton), at:lastRow.startIndex)
        }
        return KeyboardView(fromViews:keyboardRows)
    }
    
    static func ancientGreekComplement(delegate: KeyboardDelegate? = nil, nextKeyboardButton: TogglableUIButtonView? = nil) -> KeyboardView {
        let row = [
            "{", "}", "\u{0304}", "'", "\u{0387}", "\u{0323}", "[", "]", "\u{301A}", "\u{301B}"
        ]
        var keyboardRow = row.map {
            AnyView(KeyView(
                fromString: String($0),
                callback: InsertTextCallback(text:String($0), delegate:delegate)
        ))}
        if nextKeyboardButton != nil {
            keyboardRow.insert(AnyView(nextKeyboardButton), at:keyboardRow.startIndex)
        }
        return KeyboardView(fromViews:[keyboardRow])
    }
}
