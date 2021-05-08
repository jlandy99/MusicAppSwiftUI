//
//  SpotifyAuth.swift
//  MusicApp
//
//  Created by John Landy on 5/7/21.
//  Copyright © 2021 John Landy. All rights reserved.
//

import SwiftUI

struct SpotifyAuth: View {
    
    // Theme color
    var themeColor = Color.init(red: 110/255, green: 52/255, blue: 235/255)
    
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                self.authorizeUser()
            }) {
                Text("Login to Spotify")
                    .foregroundColor(.white)
                    .frame(width:300, height:50)
                    .background(themeColor)
                    .cornerRadius(25)
                    .font(.system(size:18, weight: .bold))
            }
            Spacer()
        }
    }
    
    func authorizeUser() {
        print("authorizing...")
    }
}

struct SpotifyAuth_Previews: PreviewProvider {
    static var previews: some View {
        SpotifyAuth()
    }
}
