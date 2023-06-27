//
//  TextEditorView.swift
//  Bookworm
//
//  Created by Fauzan Dwi Prasetyo on 26/06/23.
//

import SwiftUI

struct TextEditorView: View {
//  Tip: @AppStorage is not designed to store secure information, so never use it for anything private.
    @AppStorage("notes") var notes = ""
    
    var body: some View {
        NavigationView {
            TextEditor(text: $notes)
                .navigationTitle("Notes")
                .padding()
        }
    }
}

struct TextEditorView_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorView()
    }
}
