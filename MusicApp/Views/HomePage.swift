//
//  HomePage.swift
//  MusicApp
//
//  Created by John Landy on 9/9/20.
//  Copyright © 2020 John Landy. All rights reserved.
//

import SwiftUI
import FirebaseAuth
import Firebase
import FirebaseFirestore

struct HomePage: View {
    @ObservedObject var model: Model
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Home")
                        .underline()
                        .foregroundColor(.white)
                        .font(.system(size:28, weight: .bold))
                        .padding()
                    Spacer()
                    // When profile button tapped, view basic profile information or log in/sign up
                    NavigationLink(
                        destination: UserInfo(model: model)
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                    ) {
                        HStack {
                            Text(currentUser())
                                .font(.system(size:20))
                            Image(systemName: "person.circle")
                        }
                    }
                }.padding(20)
                Spacer()
            }
            .padding(.top, 25)
            .background(Color.black)
            .foregroundColor(.white)
            .edgesIgnoringSafeArea(.all)
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
    
    func currentUser() -> String {
        let user = Auth.auth().currentUser
        if let user = user {
            return user.displayName ?? ""
        } else {
            return ""
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage(model: Model())
    }
}
