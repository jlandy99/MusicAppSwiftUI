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

struct LogIn: View {
    // Help with login transitions
    @ObservedObject var model: Model
    // Theme color
    var themeColor = Color.init(red: 110/255, green: 52/255, blue: 235/255)
    // Variable strings from text fields
    @State var emailAddress = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background
                Color.black.edgesIgnoringSafeArea(.all)
                // Text fields
                ScrollView {
                    VStack {
                        // Logo
                        Image(systemName: "music.house")
                        // Sign up form (we want tight spacing here)
                        VStack(spacing: 0) {
                            SignUpField(field: "Email Address", result: self.$emailAddress)
                            Divider().frame(width:240, height:3).background(themeColor)
                            SignUpField(field: "Password", result: self.$password)
                            Divider().frame(width:240, height:3).background(themeColor)
                        }
                        // Log in Button
                        Button(action: {
                            self.logInPressed()
                        }) {
                            Text("Log In")
                                .foregroundColor(.white)
                                .frame(width:240, height:50)
                                .background(Color.blue)
                                .cornerRadius(25)
                                .font(.system(size:20, weight: .bold))
                        }
                        Spacer().frame(height:20)
                        // Sign up button
                        NavigationLink(
                            destination: SignUp()
                                .navigationBarTitle("")
                                .navigationBarHidden(true)
                        ) {
                            Text("Sign Up")
                                .foregroundColor(.white)
                                .frame(width:240, height:50)
                                .background(themeColor)
                                .cornerRadius(25)
                                .font(.system(size:20, weight: .bold))
                        }
                    }
                    .padding(.top, 125)
                    .padding(.bottom, 20)
                }
                .edgesIgnoringSafeArea(.top)
                .background(Color.black)
                .foregroundColor(.white)
                // Top bar glow
                VStack {
                    LinearGradient(gradient: Gradient(colors: [themeColor, Color.clear]), startPoint: .top, endPoint: .bottom).frame(height:150)
                    Spacer()
                }.edgesIgnoringSafeArea(.all)
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }

    func logInPressed() {
        Auth.auth().signIn(withEmail: emailAddress, password: password, completion: { (authResult, error) in
            if let error = error {
                self.showError(error.localizedDescription)
            }
        })
        // Return to content view 
        self.model.loggedIn = true
    }

    func showError(_ message:String) {
        print("Error message", message)
    }
}

struct LogIn_Previews: PreviewProvider {
    static var previews: some View {
        LogIn(model: Model())
    }
}
