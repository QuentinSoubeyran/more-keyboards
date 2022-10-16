//
//  ContentView.swift
//  Ancient Greek
//
//  Created by Quentin Soubeyran (Perso) on 7/2/22.
//

import SwiftUI

struct ContentView: View {
    @State private var fullText: String = "Text the keyboard here"
    
    var body: some View {
        let editor = TextEditor(text:$fullText)
            .frame(width: .infinity, height: .infinity)
            .padding()
            .border(.black)
            .padding()
        return editor
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
