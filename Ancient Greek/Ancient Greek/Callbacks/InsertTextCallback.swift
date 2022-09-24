//
//  InsertCallback.swift
//  Ancient Greek
//
//  Created by Quentin Soubeyran (Perso) on 9/19/22.
//

import Foundation

struct InsertTextCallback: Callback {
    var text: String
    var delegate: KeyboardDelegate?
    
    func exec() {
        self.delegate?.insertText(self.text)
    }
}
