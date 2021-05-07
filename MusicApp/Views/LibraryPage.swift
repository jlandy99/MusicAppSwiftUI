//
//  LibraryPage.swift
//  MusicApp
//
//  Created by John Landy on 9/9/20.
//  Copyright © 2020 John Landy. All rights reserved.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct LibraryPage: View {
    // Offset variables
    let topInset: CGFloat = 50
    // Theme color
    let themeColor = Color.init(red: 110/255, green: 52/255, blue: 235/255)
    
    var body: some View {
        NavigationView {
            // List of playlsits
            ScrollView {
                VStack (alignment: .leading, spacing:0) {
                    Spacer()
                        .frame(height:topInset)
                    Text("Playlists")
                        .underline()
                        .foregroundColor(.white)
                        .font(.system(size:28, weight: .bold))
                        .padding()
                    // Option for logging in or out of spotify (and other platforms soon)
                    SpotifyAuth()
                    CreatePlaylist()
                    ForEach(0..<12) { i in
                        NavigationLink(
                            destination: Playlist()
                            .navigationBarTitle("")
                            .navigationBarHidden(true)
                        ) {
                            PlaylistPreview()
                        }
                    }
                }
            }
            .background(Color.black)
            .edgesIgnoringSafeArea(.top)
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct LibraryPage_Previews: PreviewProvider {
    static var previews: some View {
        LibraryPage()
    }
}
