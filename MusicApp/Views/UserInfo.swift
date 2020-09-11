//
//  UserInfo.swift
//  MusicApp
//
//  Created by John Landy on 9/10/20.
//  Copyright © 2020 John Landy. All rights reserved.
//

import SwiftUI
import FirebaseAuth

struct UserInfo: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    // Help with logging out
    @ObservedObject var model: Model

    // Theme color
    var themeColor = Color.init(red: 110/255, green: 52/255, blue: 235/255)

    var body: some View {
        VStack {
            Text("Soon to contain user info!!")
            Button(action: {
                self.handleLogOut()
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Log Out")
                    .foregroundColor(.white)
                    .frame(width:240, height:50)
                    .background(themeColor)
                    .cornerRadius(25)
                    .font(.system(size:20, weight: .bold))
            }
        }
    }
    
    func handleLogOut() {
        do {
            try Auth.auth().signOut()
        } catch let error {
            print(error.localizedDescription)
        }
        // Return to content view
        self.model.loggedIn = false
    }
}

struct UserInfo_Previews: PreviewProvider {
    static var previews: some View {
        UserInfo(model: Model())
    }
}
