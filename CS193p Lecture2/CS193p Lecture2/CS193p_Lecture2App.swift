//
//  CS193p_Lecture2App.swift
//  CS193p Lecture2
//
//  Created by 김지우 on 2020/10/08.
//

import SwiftUI

@main
struct CS193p_Lecture2App: App {
    var body: some Scene {
        DocumentGroup(newDocument: CS193p_Lecture2Document()) { file in
            ContentView(document: file.$document)
        }
    }
}
