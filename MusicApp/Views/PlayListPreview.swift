//
//  PlayListPreview.swift
//  MusicApp
//
//  Created by John Landy on 9/9/20.
//  Copyright © 2020 John Landy. All rights reserved.
//

import SwiftUI

struct PlaylistPreview: View {
    var body: some View {
        HStack {
            Image(systemName: "music.note")
                .padding(.trailing, 10)
                .frame(width:50, height:50)
            VStack(alignment: .leading) {
                Text("Playlist Name").font(.system(size:18))
                Text("100 Songs").font(.system(size:16))
            }
            Spacer()
            Image(systemName: "ellipsis")
        }
        .padding(18)
        .background(Color.black)
        .foregroundColor(.white)
    }
}

struct PlaylistPreview_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistPreview()
    }
}
