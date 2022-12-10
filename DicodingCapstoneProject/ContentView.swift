//
//  ContentView.swift
//  DicodingCapstoneProject
//
//  Created by Ardian Pramudya Alphita on 28/11/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var browsePresenter: BrowsePresenter
    @EnvironmentObject var favoritePresenter: FavoritePresenter
    
    var body: some View {
        TabView {
            BrowseView(presenter: browsePresenter)
                .tabItem {
                    Label("Browse", systemImage: "house.fill")
                }
            FavoriteView(presenter: favoritePresenter)
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
