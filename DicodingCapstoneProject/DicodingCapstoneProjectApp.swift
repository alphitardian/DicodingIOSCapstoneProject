//
//  DicodingCapstoneProjectApp.swift
//  DicodingCapstoneProject
//
//  Created by Ardian Pramudya Alphita on 28/11/22.
//

import SwiftUI

@main
struct DicodingCapstoneProjectApp: App {
    
    /// Provide browse presenter
    private let browseUseCase = Injection.init().provideBrowseUseCase()
    private var browsePresenter: BrowsePresenter {
        return BrowsePresenter(browseUseCase: browseUseCase)
    }
    
    /// Provide favorite presenter
    private let favoriteUseCase = Injection.init().provideFavoriteUseCase()
    private var favoritePresenter: FavoritePresenter {
        return FavoritePresenter(favoriteUseCase: favoriteUseCase)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(browsePresenter)
                .environmentObject(favoritePresenter)
        }
    }
}
