//
//  LoginView.swift
//  MusicApp
//
//  Created by John Landy on 9/10/20.
//  Copyright © 2020 John Landy. All rights reserved.
//

import SwiftUI
import FirebaseAuth
import Firebase
import FirebaseFirestore

struct SignUp: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject var model: Model
    // Theme color
    var themeColor = Color.init(red: 110/255, green: 52/255, blue: 235/255)
    // Variable strings from text fields
    @State var password = ""
    @State var firstName = ""
    @State var lastName = ""
    @State var emailAddress = ""
    @State var phoneNumber = ""
    @State var birthdate = ""
    @State var gender = ""

    var body: some View {
        ZStack {
            // Background
            Color.black.edgesIgnoringSafeArea(.all)
            // Text fields
            ScrollView {
                VStack(spacing: 0) {
                    // Sign up form
                    SignUpField(field: "First Name", result: self.$firstName)
                    Divider().frame(width:240, height:3).background(themeColor)
                    SignUpField(field: "Last Name", result: self.$lastName)
                    Divider().frame(width:240, height:3).background(themeColor)
                    SignUpField(field: "Email Address", result: self.$emailAddress)
                    Divider().frame(width:240, height:3).background(themeColor)
                    SignUpField(field: "Password", result: self.$password)
                    Divider().frame(width:240, height:3).background(themeColor)
                }
                .padding(.top, 125)
                VStack(spacing: 0) {
                    SignUpField(field: "Phone Number", result: self.$phoneNumber)
                    Divider().frame(width:240, height:3).background(themeColor)
                    SignUpField(field: "Birthdate", result: self.$birthdate)
                    Divider().frame(width:240, height:3).background(themeColor)
                    SignUpField(field: "Gender", result: self.$gender)
                    Divider().frame(width:240, height:3).background(themeColor)
                    // Sign up button
                    Button(action: {
                        self.signUpPressed()
                    }) {
                        Text("Sign Up")
                            .foregroundColor(.white)
                            .frame(width:240, height:50)
                            .background(themeColor)
                            .cornerRadius(25)
                            .font(.system(size:20, weight: .bold))
                    }.padding(.top, 20)
                }
                .padding(.bottom, 20)
            }
            .background(Color.black)
            .foregroundColor(.white)
            .edgesIgnoringSafeArea(.top)
            // Top bar glow
            VStack {
                LinearGradient(gradient: Gradient(colors: [themeColor, Color.clear]), startPoint: .top, endPoint: .bottom).frame(height:150)
                Spacer()
            }.edgesIgnoringSafeArea(.all)
            // Top Bar
            VStack {
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
                Spacer()
            }
        }
    }
    
    // Validate sign up fields, and returns nil upon success. Otherwise, will return the error message
    func validateFields() -> String? {
        // Check that all fields are filled in
        
        return nil
    }
    
    func signUpPressed() {
        let error = validateFields()
        if error != nil {
            // Show error message
            showError(error!)
        } else {
            // Create the user
            Auth.auth().createUser(withEmail: emailAddress, password: password) { (result, error) in
                // Check for errors
                if let error = error {
                    // There was an error
                    self.showError(error.localizedDescription)
                } else {
                    // Store user data as new document
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["uid": result!.user.uid, "firstName": self.firstName, "lastName": self.lastName, "emailAddress": self.emailAddress, "phoneNumber": self.phoneNumber, "birthdate": self.birthdate,"gender": self.gender]) { (error) in
                        if error != nil {
                            self.showError("Error saving user data")
                        }
                    }
                    // Display name
                    let changeRequest = result!.user.createProfileChangeRequest()
                    changeRequest.displayName = self.firstName
                    changeRequest.commitChanges { (error) in
                        if let error = error {
                            self.showError(error.localizedDescription)
                        }
                    }
                }
            }
            // Navigate to login screen
            self.presentationMode.wrappedValue.dismiss()
        }
    }
    
    func showError(_ message:String) {
        print("Error message", message)
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp(model: Model())
    }
}
