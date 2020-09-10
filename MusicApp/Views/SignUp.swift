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
    // Save fields for checking later
    let fields = ["First Name", "Last Name", "Email Address", "Phone Number", "Date of Birth", "Gender"]

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
                ForEach(fields, id: \.self) { title in
                    SignUpField(field: title)
                }
            }.padding(.top, 30)
        }
        .background(Color.black)
        .foregroundColor(.white)
        .edgesIgnoringSafeArea(.all)
    }
    
    // Validate sign up fields, and returns nil upon success. Otherwise, will return the error message
    func validateFields() -> String? {
        // Check that all fields are filled in
        
        return nil
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
