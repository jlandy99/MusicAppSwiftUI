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
    
    var body: some View {
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
                    PlaylistPreview()
                }
            }
        }
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}

struct LibraryPage_Previews: PreviewProvider {
    static var previews: some View {
        LibraryPage()
    }
}
