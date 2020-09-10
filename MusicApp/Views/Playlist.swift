//
//  ContentItemViewer.swift
//  MusicApp
//
//  Created by John Landy on 9/9/20.
//  Copyright © 2020 John Landy. All rights reserved.
//

import SwiftUI

struct Playlist: View {
    // How much room for header (image, title, subtitle, etc.)
    var topInset: CGFloat = 400
    var titleImageSize: CGFloat = 200
    // State variable (changes automatically) for play button location
    @State var playButtonOffset: CGFloat = 335
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
                    .foregroundColor(.init(red:0.8, green:0.8, blue:0.8))
                    .font(.system(size:16, weight: .medium))
                Spacer()
            }
            // Scrolling portion (songs, playlists, artists, etc.)
            ScrollView {
                GeometryReader {geo -> AnyView? in
                    let offset = geo.frame(in: .global).minY
                    if (offset > -300) {
                        self.playButtonOffset = offset
                    } else {
                        self.playButtonOffset = -300
                    }
                    return nil
                }
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
            // Top bar glow
            VStack {
                LinearGradient(gradient: Gradient(colors: [themeColor, Color.clear]), startPoint: .top, endPoint: .bottom).frame(height:300)
                Spacer()
            }.edgesIgnoringSafeArea(.all)
            // Left chevron and info
            VStack {
                HStack {
                    Image(systemName: "chevron.left").padding(.leading, 10)
                    Spacer()
                    Image(systemName: "ellipsis").padding(.trailing, 10)
                }
                .foregroundColor(.white)
                .padding()
                Spacer()
            }
            // Play button
            VStack {
                Spacer()
                    .frame(height:playButtonOffset + 300)
                HStack {
                    if (playButtonOffset > -300) {
                        Text("Play")
                    } else {
                        Image(systemName: "play.fill")
                    }
                }
                .foregroundColor(.white)
                .frame(width:getPlayButtonWidth(), height:50)
                .background(themeColor)
                .cornerRadius(25)
                .font(.system(size:20, weight: .bold))
                .shadow(radius: 20)
                Spacer()
            }
        }
    }
    
    // Allow play button to gradually condense as it gets closer to the top of the screen
    func getPlayButtonWidth() -> CGFloat {
        if (playButtonOffset > -150) {
            return 240
        } else if (playButtonOffset < -300) {
            return 50
        } else {
            let width = 240 - (190 * (((-1 * playButtonOffset) - 150) / 150))
            return width
        }
    }
}

struct Playlist_Previews: PreviewProvider {
    static var previews: some View {
        Playlist()
    }
}
