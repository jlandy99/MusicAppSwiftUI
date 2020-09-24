//
//  UserInfo.swift
//  MusicApp
//
//  Created by John Landy on 9/10/20.
//  Copyright © 2020 John Landy. All rights reserved.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct UserInfo: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    // Help with logging out
    @ObservedObject var model: Model
    // Theme color
    var themeColor = Color.init(red: 110/255, green: 52/255, blue: 235/255)
    // Menu color
    var menuColor = Color.init(red: 0.08, green: 0.08, blue: 0.08)

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "person")
                Text(self.currentUser())
                    .font(.system(size:16))
            }
            .padding(.top, 80)
            Button(action: {
                self.showFriends { (value) in
                    print(value)
                }
            }) {
                HStack {
                    Image(systemName: "rectangle.stack.person.crop")
                    Text("Friends")
                        .font(.system(size:16))
                }
                .padding(.top, 30)
            }
            HStack {
                Image(systemName: "gear")
                Text("Settings")
                    .font(.system(size:16))
            }
            .padding(.top, 30)
            Button(action: {
                self.handleLogOut()
                self.model.loggedIn = false
            }) {
                Text("Log Out")
                    .foregroundColor(.white)
                    .frame(width:150, height:50)
                    .background(self.themeColor)
                    .cornerRadius(25)
                    .font(.system(size:20, weight: .bold))
            }
            .padding(.top, 30)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(self.menuColor)
        .foregroundColor(.white)
        .edgesIgnoringSafeArea(.all)
    }
    
    func currentUser() -> String {
        let user = Auth.auth().currentUser
        if let user = user {
            return user.displayName ?? ""
        } else {
            return ""
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
    
    func showFriends(completion: @escaping(_ value: [String]) -> ()) {
        // Set up document read
        let uid = Auth.auth().currentUser!.uid
        let db = Firestore.firestore()
        let docRef = db.collection("users").document(uid)
        var data: [String] = []
        // Grab the user's playlist document
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                // Get data in form: { "Playlist name": array of endpoints }
                let userData: [String: Any] = document.data()!
                data = userData["friends"] as! [String]
            } else {
                print(error!.localizedDescription)
            }
            print(data)
            completion(data)
        }
    }
}

struct UserInfo_Previews: PreviewProvider {
    static var previews: some View {
        UserInfo(model: Model())
    }
}
