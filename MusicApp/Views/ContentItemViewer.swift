//
//  ContentItemViewer.swift
//  MusicApp
//
//  Created by John Landy on 9/9/20.
//  Copyright © 2020 John Landy. All rights reserved.
//

import SwiftUI

struct ContentItemViewer: View {
    // How much room for header (image, title, subtitle, etc.)
    var topInset: CGFloat = 350
    
    var body: some View {
        ZStack{
            // Standard color layer
            Color.init(red: 110/255, green: 52/255, blue: 235/255).edgesIgnoringSafeArea(.all)
            // Background (title, image)
            VStack {
                Spacer()
                    .frame(height:50)
                Image(systemName: "tv.music.note")
                    .resizable()
                    .frame(width:topInset - 150, height:topInset - 150)
                Text("Title")
                    .foregroundColor(.white)
                    .font(.system(size:20, weight: .bold))
                Text("Subtitle")
                    .foregroundColor(.init(red:0.8, green:0.8, blue:0.8))
                    .font(.system(size:16, weight: .medium))
                Spacer()
            }
            // Scrolling portion (songs, playlists, artists, etc.)
            ScrollView {
                VStack (spacing:0) {
                    HStack {
                        Spacer()
                            .frame(height:topInset)
                            .background(LinearGradient(gradient:
                                Gradient(colors: [
                                    Color.clear,
                                    Color.clear,
                                    Color.clear,
                                    Color.black
                                ]), startPoint: .top, endPoint: .bottom))
                    }
                    VStack {
                        ForEach(0..<40) { i in
                            HStack {
                                Song()
                                Spacer()
                            }
                        }
                    }.background(Color.black)
                }
            }.background(Color.clear)
        }
    }
}

struct ContentItemViewer_Previews: PreviewProvider {
    static var previews: some View {
        ContentItemViewer()
    }
}
