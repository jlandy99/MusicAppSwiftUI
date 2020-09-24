//
//  Song.swift
//  MusicApp
//
//  Created by John Landy on 9/9/20.
//  Copyright © 2020 John Landy. All rights reserved.
//

import SwiftUI

struct Song: View {
    var body: some View {
        HStack {
            Image(systemName: "music.note")
                .padding(.trailing, 10)
                .frame(width: 20, height: 20)
            Text("Song Title")
                .font(.system(size:16))
            Spacer()
            Image(systemName: "ellipsis")
        }
        .padding(18)
        .background(Color.black)
        .foregroundColor(.white)
    }
}

struct Song_Previews: PreviewProvider {
    static var previews: some View {
        Song()
    }
}
