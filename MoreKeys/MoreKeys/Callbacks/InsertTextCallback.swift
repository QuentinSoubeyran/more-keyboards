//
//  InsertCallback.swift
//  Ancient Greek
//
//  Created by Quentin Soubeyran (Perso) on 9/19/22.
//

import Foundation

struct InsertTextCallback: Callback {
    var text: String
    var proxy: TextProxy?
    
    func exec() {
        self.proxy?.insertText(self.text)
    }
}
