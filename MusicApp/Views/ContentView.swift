//
//  ContentView.swift
//  MusicApp
//
//  Created by John Landy on 9/9/20.
//  Copyright © 2020 John Landy. All rights reserved.
//

import SwiftUI
import FirebaseAuth

class Model: ObservableObject {
    @Published var loggedIn = false
    
    init() {
        self.loggedIn = self.isLoggedIn()
    }
    
    func isLoggedIn() -> Bool {
        return Auth.auth().currentUser != nil
    }
}

struct ContentView: View {
    @State private var selection = 0
    @ObservedObject var model = Model()
    
    init() {
        UITabBar.appearance().barTintColor = .black
        UITabBar.appearance().layer.borderColor = UIColor.clear.cgColor
        UITabBar.appearance().clipsToBounds = true
    }
    
    @ViewBuilder
    var body: some View {
        if model.loggedIn {
            TabbedView(model)
        } else {
            LogIn(model: model)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
