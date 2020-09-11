//
//  LoginField.swift
//  MusicApp
//
//  Created by John Landy on 9/10/20.
//  Copyright © 2020 John Landy. All rights reserved.
//

import SwiftUI

struct SignUpField: View {
    var field: String
    @Binding var result: String

    var body: some View {
        HStack {
            TextField("\(field)", text: $result)
                .foregroundColor(.white)
                .background(Color.black)
                .font(.system(size:16))
                .frame(width: 200)
                .padding()
                .border(Color.white, width: 2).cornerRadius(5)
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
