//
//  HomePage.swift
//  MusicApp
//
//  Created by John Landy on 9/9/20.
//  Copyright © 2020 John Landy. All rights reserved.
//

import SwiftUI

struct HomePage: View {
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
                        destination: SignUp()
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                    ) {
                        Image(systemName: "person.circle")
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
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
