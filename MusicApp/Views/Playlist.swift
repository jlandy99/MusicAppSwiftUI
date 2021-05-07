//
//  ContentItemViewer.swift
//  MusicApp
//
//  Created by John Landy on 9/9/20.
//  Copyright © 2020 John Landy. All rights reserved.
//

import SwiftUI

struct Playlist: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    // How much room for header (image, title, subtitle, etc.)
    var topInset: CGFloat = 400
    var titleImageSize: CGFloat = 200
    // Theme color
    var themeColor = Color.init(red: 110/255, green: 52/255, blue: 235/255)
    
    var body: some View {
        ZStack{
            // Standard color layer
            LinearGradient(gradient: Gradient(colors:
                [themeColor,
                 Color.black,
                 Color.black]
            ), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            // Background (title, image)
            VStack {
                Spacer()
                    .frame(height:50)
                Image(systemName: "tv.music.note")
                    .resizable()
                    .frame(width:titleImageSize, height:titleImageSize)
                Text("Title")
                    .foregroundColor(.white)
                    .font(.system(size:20, weight: .bold))
                Text("Subtitle")
                    .foregroundColor(Color.init(red:0.8, green:0.8, blue:0.8))
                    .font(.system(size:16, weight: .medium))
                Spacer()
            }
            // Scrolling portion (songs, playlists, artists, etc.)
            ScrollView {
                // Play button
                VStack {
                    Spacer()
                        .frame(height:335)
                    HStack {
                        Text("Play")
                    }
                    .foregroundColor(.white)
                    .frame(width:240, height:50)
                    .background(themeColor)
                    .cornerRadius(25)
                    .font(.system(size:20, weight: .bold))
                    .shadow(radius: 20)
                    Spacer()
                }
                VStack {
                    ForEach(0..<40) { i in
                        HStack {
                            Song()
                            Spacer()
                        }
                    }
                }.background(Color.black)
            }.background(Color.clear)
            // Top bar glow
            VStack {
                LinearGradient(gradient: Gradient(colors: [themeColor, Color.clear]), startPoint: .top, endPoint: .bottom).frame(height:300)

                Spacer()
            }.edgesIgnoringSafeArea(.all)
            // Left chevron and info
            VStack {
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left").padding(.leading, 10)
                    }
                    Spacer()
                    Image(systemName: "ellipsis").padding(.trailing, 10)
                }
                .foregroundColor(.white)
                .padding()
                Spacer()
            }
        }
    }
}

struct Playlist_Previews: PreviewProvider {
    static var previews: some View {
        Playlist()
    }
}
