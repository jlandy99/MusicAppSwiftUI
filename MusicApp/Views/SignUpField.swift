//
//  LoginField.swift
//  MusicApp
//
//  Created by John Landy on 9/10/20.
//  Copyright © 2020 John Landy. All rights reserved.
//

import SwiftUI

struct CustomTextField: View {
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }

    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty { placeholder }
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
    }
}

struct SignUpField: View {
    var field: String
    @Binding var result: String

    var body: some View {
        HStack {
            CustomTextField(placeholder: Text("\(field)"), text: $result)
                .foregroundColor(.white)
                .background(Color.black)
                .font(.system(size:16))
                .frame(width: 240)
        }
        .padding(18)
        .background(Color.black)
        .foregroundColor(.white)
    }
}

struct SignUpField_Previews: PreviewProvider {
    static var previews: some View {
        SignUpField(field: "Tommy", result: .constant(""))
    }
}
