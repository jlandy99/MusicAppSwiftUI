//
//  CreatePlaylist.swift
//  MusicApp
//
//  Created by John Landy on 9/10/20.
//  Copyright © 2020 John Landy. All rights reserved.
//

import SwiftUI

struct CreatePlaylist: View {
    var body: some View {
        HStack {
            Image(systemName: "plus.circle")
                .padding(.trailing, 10)
                .frame(width:50, height:50)
            Text("Create New Playlist").font(.system(size:18))
            Spacer()
        }
        .padding(18)
        .background(Color.black)
        .foregroundColor(.white)
    }
}

struct CreatePlaylist_Previews: PreviewProvider {
    static var previews: some View {
        CreatePlaylist()
    }
}
