//
//  LibraryPage.swift
//  MusicApp
//
//  Created by John Landy on 9/9/20.
//  Copyright © 2020 John Landy. All rights reserved.
//

import SwiftUI

struct LibraryPage: View {
    // Offset variables
    var topInset: CGFloat = 50
    // Theme color
    var themeColor = Color.init(red: 110/255, green: 52/255, blue: 235/255)
    
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
            .edgesIgnoringSafeArea(.all)
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
