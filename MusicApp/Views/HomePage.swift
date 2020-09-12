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
    // State var for menu bar
    @State var showMenu = false
    // Theme color
    var themeColor = Color.init(red: 110/255, green: 52/255, blue: 235/255)
    
    var body: some View {
        // Drag guesture for side menu
        let drag = DragGesture()
            .onEnded {
                if $0.translation.width < -100 {
                    withAnimation {
                        self.showMenu = false
                    }
                }
                if $0.translation.width > 100 {
                    withAnimation {
                        self.showMenu = true
                    }
                }
            }
        
        return GeometryReader { geometry in
            ZStack(alignment: .leading) {
                // Main home view
                VStack {
                    Spacer().frame(height:30)
                    HStack {
                        // When profile button tapped, view basic profile information or log in/sign up
                        Button(action: {
                            withAnimation {
                                self.showMenu.toggle()
                            }
                        }) {
                            HStack {
                                Image(systemName: "person.circle")
                                Text(self.currentUser())
                                    .font(.system(size:20))
                            }
                        }
                        Spacer()
                        Image(systemName: "music.note")
                        Spacer()
                        Spacer()
                    }.padding(20)
                    Spacer()
                }
                .padding(.top, 25)
                .background(Color.black)
                .foregroundColor(.white)
                .offset(x: self.showMenu ? geometry.size.width / 2 : 0)
                .disabled(self.showMenu ? true : false)
                .edgesIgnoringSafeArea(.all)
                // Logout view side panel
                if self.showMenu {
                    UserInfo(model: self.model)
                        .frame(width: geometry.size.width / 2)
                        .transition(.move(edge: .leading))
                }
            }
        } .gesture(drag)
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
