//
//  LoginView.swift
//  MusicApp
//
//  Created by John Landy on 9/10/20.
//  Copyright © 2020 John Landy. All rights reserved.
//

import SwiftUI

struct SignUp: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        ScrollView {
            VStack {
                // Top Bar
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left").padding(.leading, 10)
                    }
                    Spacer()
                }
                .foregroundColor(.white)
                .padding()
                // Sign up form
                SignUpField(field: "First Name")
                SignUpField(field: "Last Name")
                SignUpField(field: "Email Address")
                SignUpField(field: "Phone Number")
                Text("DOB")
                Text("Gender")
            }.padding(.top, 30)
        }
        .background(Color.black)
        .foregroundColor(.white)
        .edgesIgnoringSafeArea(.all)
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
