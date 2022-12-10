//
//  FavoriteView.swift
//  DicodingCapstoneProject
//
//  Created by Ardian Pramudya Alphita on 06/12/22.
//

import SwiftUI

struct FavoriteView: View {
    
    @ObservedObject var presenter: FavoritePresenter
    
    var body: some View {
        NavigationStack {
            ZStack {
                if presenter.favorites.isEmpty {
                    Text("No Favorite Saved")
                } else {
                    ScrollView {
                        ForEach(presenter.favorites) { favorite in
                            presenter.detailLinkBuilder(for: favorite.toMealModel()) {
                                MealCardView(meal: favorite.toMealModel(), category: favorite.toCategoryModel())
                            }
                        }
                    }
                }
            }
            .navigationTitle("Favorite")
            .onAppear {
                presenter.getFavorites()
            }
        }
    }
}
