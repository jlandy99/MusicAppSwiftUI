//
//  TabView.swift
//  MusicApp
//
//  Created by John Landy on 9/10/20.
//  Copyright © 2020 John Landy. All rights reserved.
//


import SwiftUI

struct TabbedView: View {
    @State private var selection = 0
    @ObservedObject var model: Model
    
    init(_ model: Model) {
        UITabBar.appearance().barTintColor = .black
        UITabBar.appearance().layer.borderColor = UIColor.clear.cgColor
        UITabBar.appearance().clipsToBounds = true
        self.model = model
    }
 
    var body: some View {
        TabView(selection: $selection){
            HomePage(model: model)
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "house")
                        Text("Home")
                    }
                }
                .tag(0)
            SearchPage()
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                }
                .tag(1)
            LibraryPage()
            .font(.title)
            .tabItem {
                VStack {
                    Image(systemName: "line.horizontal.3.decrease.circle")
                    Text("Library")
                }
            }
            .tag(2)
        }
    }
}

struct TabbedView_Previews: PreviewProvider {
    static var previews: some View {
        TabbedView(Model())
    }
}
