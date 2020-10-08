//
//  ContentView.swift
//  CS193p Lecture2
//
//  Created by 김지우 on 2020/10/08.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: CS193p_Lecture2Document

    var body: some View {
        TextEditor(text: $document.text)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(CS193p_Lecture2Document()))
    }
}
